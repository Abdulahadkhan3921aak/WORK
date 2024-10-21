package edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src;

import java.awt.event.KeyEvent;

// thread que dispara as coordenadas seguintes aos clientes enquanto W/A/S/D não é solto
class CoordinatesThrower extends Thread {
   private boolean up, right, left, down;
   private int id;
   private Server server;

   CoordinatesThrower(int id, Server server) {
      this.id = id;
      this.server = server;
      up = down = right = left = false;
   }

   @Override
   public void run() {
      int newX = server.getPlayers()[id].x;
      int newY = server.getPlayers()[id].y;

      while (true) {
         if (up || down || right || left) {
            if (up) newY = server.getPlayers()[id].y - Const.RESIZE;
            else if (down) newY = server.getPlayers()[id].y + Const.RESIZE;
            else if (right) newX = server.getPlayers()[id].x + Const.RESIZE;
            else if (left) newX = server.getPlayers()[id].x - Const.RESIZE;

            if (coordinateIsValid(newX, newY)) {
               ClientManager.sendToAllClients(id + " newCoordinate " + newX + " " + newY);

               server.getPlayers()[id].x = newX;
               server.getPlayers()[id].y = newY;
            } else {
               newX = server.getPlayers()[id].x;
               newY = server.getPlayers()[id].y;
            }
            try {
               sleep(Const.RATE_COORDINATES_UPDATE);
            } catch (InterruptedException e) {
               e.printStackTrace();
            }
         }
         try {
            sleep(0);
         } catch (InterruptedException e) {
            e.printStackTrace();
         }
      }
   }

   private int getColumnOfMap(int x) {
      return x / Const.SIZE_SPRITE_MAP;
   }

   private int getLineOfMap(int y) {
      return y / Const.SIZE_SPRITE_MAP;
   }

   // encontra sobre quais sprites do mapa o jogador está e verifica se são válidos
   private boolean coordinateIsValid(int newX, int newY) {
      if (!server.getPlayers()[id].alive) {
         return false;
      }

      // verifica se o jogador foi para o fogo (coordenada do centro do corpo)
      int xBody = newX + Const.WIDTH_SPRITE_PLAYER / 2;
      int yBody = newY + 2 * Const.HEIGHT_SPRITE_PLAYER / 3;

      if (server.getMap()[getLineOfMap(yBody)][getColumnOfMap(xBody)].img.contains("explosion")) {
         server.getPlayers()[id].alive = false;
         ClientManager.sendToAllClients(id + " newStatus dead");
         return true;
      }

      int[] x = new int[4], y = new int[4];
      int[] c = new int[4], l = new int[4];

      // EM RELAÇÃO À NOVA COORDENADA
      // 0: ponto do canto superior esquerdo
      x[0] = Const.VAR_X_SPRITES + newX + Const.RESIZE;
      y[0] = Const.VAR_Y_SPRITES + newY + Const.RESIZE;
      // 1: ponto do canto superior direito
      x[1] = Const.VAR_X_SPRITES + newX + Const.SIZE_SPRITE_MAP - 2 * Const.RESIZE;
      y[1] = Const.VAR_Y_SPRITES + newY + Const.RESIZE;
      // 2: ponto do canto inferior esquerdo
      x[2] = Const.VAR_X_SPRITES + newX + Const.RESIZE;
      y[2] = Const.VAR_Y_SPRITES + newY + Const.SIZE_SPRITE_MAP - 2 * Const.RESIZE;
      // 3: ponto do canto inferior direito
      x[3] = Const.VAR_X_SPRITES + newX + Const.SIZE_SPRITE_MAP - 2 * Const.RESIZE;
      y[3] = Const.VAR_Y_SPRITES + newY + Const.SIZE_SPRITE_MAP - 2 * Const.RESIZE;

      for (int i = 0; i < 4; i++) {
         c[i] = getColumnOfMap(x[i]);
         l[i] = getLineOfMap(y[i]);
      }

      if (
              (server.getMap()[l[0]][c[0]].img.equals("floor-1") || server.getMap()[l[0]][c[0]].img.contains("explosion")) &&
                      (server.getMap()[l[1]][c[1]].img.equals("floor-1") || server.getMap()[l[1]][c[1]].img.contains("explosion")) &&
                      (server.getMap()[l[2]][c[2]].img.equals("floor-1") || server.getMap()[l[2]][c[2]].img.contains("explosion")) &&
                      (server.getMap()[l[3]][c[3]].img.equals("floor-1") || server.getMap()[l[3]][c[3]].img.contains("explosion"))
      ) {
         return true; // estará em uma coordenada válida
      }

      if (
              (server.getMap()[l[0]][c[0]].img.contains("block") || server.getMap()[l[0]][c[0]].img.contains("wall")) ||
                      (server.getMap()[l[1]][c[1]].img.contains("block") || server.getMap()[l[1]][c[1]].img.contains("wall")) ||
                      (server.getMap()[l[2]][c[2]].img.contains("block") || server.getMap()[l[2]][c[2]].img.contains("wall")) ||
                      (server.getMap()[l[3]][c[3]].img.contains("block") || server.getMap()[l[3]][c[3]].img.contains("wall"))
      ) {
         return false; // estará sobre uma parede
      }

      // EM RELAÇÃO À COORDENADA ANTERIOR
      // 0: ponto do canto superior esquerdo
      x[0] = Const.VAR_X_SPRITES + server.getPlayers()[id].x + Const.RESIZE;
      y[0] = Const.VAR_Y_SPRITES + server.getPlayers()[id].y + Const.RESIZE;
      // 1: ponto do canto superior direito
      x[1] = Const.VAR_X_SPRITES + server.getPlayers()[id].x + Const.SIZE_SPRITE_MAP - 2 * Const.RESIZE;
      y[1] = Const.VAR_Y_SPRITES + server.getPlayers()[id].y + Const.RESIZE;
      // 2: ponto do canto inferior esquerdo
      x[2] = Const.VAR_X_SPRITES + server.getPlayers()[id].x + Const.RESIZE;
      y[2] = Const.VAR_Y_SPRITES + server.getPlayers()[id].y + Const.SIZE_SPRITE_MAP - 2 * Const.RESIZE;
      // 3: ponto do canto inferior direito
      x[3] = Const.VAR_X_SPRITES + server.getPlayers()[id].x + Const.SIZE_SPRITE_MAP - 2 * Const.RESIZE;
      y[3] = Const.VAR_Y_SPRITES + server.getPlayers()[id].y + Const.SIZE_SPRITE_MAP - 2 * Const.RESIZE;

      for (int i = 0; i < 4; i++) {
         c[i] = getColumnOfMap(x[i]);
         l[i] = getLineOfMap(y[i]);
      }

      if (
              server.getMap()[l[0]][c[0]].img.contains("bomb-planted") ||
                      server.getMap()[l[1]][c[1]].img.contains("bomb-planted") ||
                      server.getMap()[l[2]][c[2]].img.contains("bomb-planted") ||
                      server.getMap()[l[3]][c[3]].img.contains("bomb-planted")
      ) {
         return true; // estava sobre uma bomba que acabou de plantar, precisa sair
      }

      return false;
   }

   void keyCodePressed(int keyCode) {
      switch (keyCode) {
         case KeyEvent.VK_W:
            up = true;
            down = right = left = false;
            ClientManager.sendToAllClients(this.id + " newStatus up");
            break;
         case KeyEvent.VK_S:
            down = true;
            up = right = left = false;
            ClientManager.sendToAllClients(this.id + " newStatus down");
            break;
         case KeyEvent.VK_D:
            right = true;
            up = down = left = false;
            ClientManager.sendToAllClients(this.id + " newStatus right");
            break;
         case KeyEvent.VK_A:
            left = true;
            up = down = right = false;
            ClientManager.sendToAllClients(this.id + " newStatus left");
            break;
      }
   }

   void keyCodeReleased(int keyCode) {
      if (keyCode != KeyEvent.VK_W && keyCode != KeyEvent.VK_S && keyCode != KeyEvent.VK_D && keyCode != KeyEvent.VK_A) {
         return;
      }

      ClientManager.sendToAllClients(this.id + " stopStatusUpdate");
      switch (keyCode) {
         case KeyEvent.VK_W:
            up = false;
            break;
         case KeyEvent.VK_S:
            down = false;
            break;
         case KeyEvent.VK_D:
            right = false;
            break;
         case KeyEvent.VK_A:
            left = false;
            break;
      }
   }
}
