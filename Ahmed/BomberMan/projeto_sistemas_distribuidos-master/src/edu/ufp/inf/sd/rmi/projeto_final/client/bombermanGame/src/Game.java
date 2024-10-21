package edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Toolkit;
import java.util.Hashtable;
import java.awt.Image;

import javax.swing.JPanel;

public class Game extends JPanel {
   private static final long serialVersionUID = 1L;
   private Player you, enemy1, enemy2, enemy3;
   private Coordinate[][] map;
   private String[] personColors;
   private Hashtable<String, Image> sprites;

   public Game(int width, int height, int id, Coordinate[][] map, boolean[] alive, Coordinate[] spawn, Sprite sprite) {
      this.map = map;
      this.sprites = sprite.getHt();
      this.personColors = sprite.getPersonColors();

      setPreferredSize(new Dimension(width, height));
      try {
         System.out.print("Inicializando jogadores...");
         you = new Player(id, this, spawn, alive, personColors, sprites, sprite);
         enemy1 = new Player((id + 1) % Const.QTY_PLAYERS, this, spawn, alive, personColors, sprites, sprite);
         enemy2 = new Player((id + 2) % Const.QTY_PLAYERS, this, spawn, alive, personColors, sprites, sprite);
         enemy3 = new Player((id + 3) % Const.QTY_PLAYERS, this, spawn, alive, personColors, sprites, sprite);
      } catch (InterruptedException e) {
         System.out.println(" erro: " + e + "\n");
         System.exit(1);
      }
      System.out.print(" ok\n");

      System.out.println("Meu jogador: " + personColors[id]);
   }

   // desenha os componentes, chamada por paint() e repaint()
   public void paintComponent(Graphics g) {
      super.paintComponent(g);
      drawMap(g);
      enemy1.draw(g, sprites);
      enemy2.draw(g, sprites);
      enemy3.draw(g, sprites);
      you.draw(g, sprites);

      // System.out.format("%s: %s [%04d, %04d]\n", you.color, you.status, you.x, you.y);;
      Toolkit.getDefaultToolkit().sync();
   }

   void drawMap(Graphics g) {
      for (int i = 0; i < Const.LIN; i++)
         for (int j = 0; j < Const.COL; j++)
            g.drawImage(
                    sprites.get(map[i][j].img),
                    map[i][j].x, map[i][j].y,
                    Const.SIZE_SPRITE_MAP, Const.SIZE_SPRITE_MAP, null
            );
   }

   void setSpriteMap(String keyWord, int l, int c) {
      map[l][c].img = keyWord;
   }

   public Player getYou() {
      return you;
   }

   public Player getEnemy1() {
      return enemy1;
   }

   public Player getEnemy2() {
      return enemy2;
   }

   public Player getEnemy3() {
      return enemy3;
   }
}


