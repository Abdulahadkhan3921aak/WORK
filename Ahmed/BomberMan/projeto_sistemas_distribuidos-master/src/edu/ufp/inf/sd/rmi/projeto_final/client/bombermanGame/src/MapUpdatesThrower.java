package edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src;

// thread que lança mudanças graduais no mapa que ocorrem logo após a bomba ser plantada
class MapUpdatesThrower extends Thread {
   private boolean bombPlanted;
   private int id, l, c;
   private Server server;

   MapUpdatesThrower(int id, Server server) {
      this.id = id;
      this.server = server;
      this.bombPlanted = false;
   }

   void setBombPlanted(int x, int y) {
      x += Const.WIDTH_SPRITE_PLAYER / 2;
      y += 2 * Const.HEIGHT_SPRITE_PLAYER / 3;

      this.c = x / Const.SIZE_SPRITE_MAP;
      this.l = y / Const.SIZE_SPRITE_MAP;

      this.bombPlanted = true;
   }

   // muda o mapa no servidor e no cliente
   private void changeMap(String keyWord, int l, int c) {
      server.getMap()[l][c].img = keyWord;
      ClientManager.sendToAllClients("-1 mapUpdate " + keyWord + " " + l + " " + c);
   }

   private int getColumnOfMap(int x) {
      return x / Const.SIZE_SPRITE_MAP;
   }

   private int getLineOfMap(int y) {
      return y / Const.SIZE_SPRITE_MAP;
   }

   // verifica se o fogo atingiu algum jogador parado (coordenada do centro do corpo)
   private void checkIfExplosionKilledSomeone(int linSprite, int colSprite) {
      int linPlayer, colPlayer, x, y;

      for (int id = 0; id < Const.QTY_PLAYERS; id++) {
         if (server.getPlayers()[id].alive) {
            x = server.getPlayers()[id].x + Const.WIDTH_SPRITE_PLAYER / 2;
            y = server.getPlayers()[id].y + 2 * Const.HEIGHT_SPRITE_PLAYER / 3;

            colPlayer = getColumnOfMap(x);
            linPlayer = getLineOfMap(y);

            if (linSprite == linPlayer && colSprite == colPlayer) {
               server.getPlayers()[id].alive = false;
               ClientManager.sendToAllClients(id + " newStatus dead");
            }
         }
      }
   }

   @Override
   public void run() {
      while (true) {
         if (bombPlanted) {
            bombPlanted = false;

            for (String index : Const.indexBombPlanted) {
               changeMap("bomb-planted-" + index, l, c);
               try {
                  sleep(Const.RATE_BOMB_UPDATE);
               } catch (InterruptedException e) {
                  e.printStackTrace();
               }
            }

            // efeitos da explosão
            new Thrower("center-explosion", Const.indexExplosion, Const.RATE_FIRE_UPDATE, l, c, this).start();
            checkIfExplosionKilledSomeone(l, c);

            // abaixo
            if (server.getMap()[l + 1][c].img.equals("floor-1")) {
               new Thrower("down-explosion", Const.indexExplosion, Const.RATE_FIRE_UPDATE, l + 1, c, this).start();
               checkIfExplosionKilledSomeone(l + 1, c);
            } else if (server.getMap()[l + 1][c].img.contains("block"))
               new Thrower("block-on-fire", Const.indexBlockOnFire, Const.RATE_BLOCK_UPDATE, l + 1, c, this).start();

            // a direita
            if (server.getMap()[l][c + 1].img.equals("floor-1")) {
               new Thrower("right-explosion", Const.indexExplosion, Const.RATE_FIRE_UPDATE, l, c + 1, this).start();
               checkIfExplosionKilledSomeone(l, c + 1);
            } else if (server.getMap()[l][c + 1].img.contains("block"))
               new Thrower("block-on-fire", Const.indexBlockOnFire, Const.RATE_BLOCK_UPDATE, l, c + 1, this).start();

            // acima
            if (server.getMap()[l - 1][c].img.equals("floor-1")) {
               new Thrower("up-explosion", Const.indexExplosion, Const.RATE_FIRE_UPDATE, l - 1, c, this).start();
               checkIfExplosionKilledSomeone(l - 1, c);
            } else if (server.getMap()[l - 1][c].img.contains("block"))
               new Thrower("block-on-fire", Const.indexBlockOnFire, Const.RATE_BLOCK_UPDATE, l - 1, c, this).start();

            // a esquerda
            if (server.getMap()[l][c - 1].img.equals("floor-1")) {
               new Thrower("left-explosion", Const.indexExplosion, Const.RATE_FIRE_UPDATE, l, c - 1, this).start();
               checkIfExplosionKilledSomeone(l, c - 1);
            } else if (server.getMap()[l][c - 1].img.contains("block"))
               new Thrower("block-on-fire", Const.indexBlockOnFire, Const.RATE_BLOCK_UPDATE, l, c - 1, this).start();

            server.getPlayers()[id].numberOfBombs++; // libera bomba
         }
         try {
            sleep(0);
         } catch (InterruptedException e) {
            e.printStackTrace();
         }
      }
   }

   // thread auxiliar
   private class Thrower extends Thread {
      private final String keyWord;
      private final String[] index;
      private final int delay;
      private final int l, c;
      private final MapUpdatesThrower parent;

      Thrower(String keyWord, String[] index, int delay, int l, int c, MapUpdatesThrower parent) {
         this.keyWord = keyWord;
         this.index = index;
         this.delay = delay;
         this.l = l;
         this.c = c;
         this.parent = parent;
      }

      @Override
      public void run() {
         for (String i : index) {
            parent.changeMap(keyWord + "-" + i, l, c);
            try {
               sleep(delay);
            } catch (InterruptedException e) {
               e.printStackTrace();
            }
         }
         // situação pós-explosão
         parent.changeMap("floor-1", l, c);
      }
   }
}
