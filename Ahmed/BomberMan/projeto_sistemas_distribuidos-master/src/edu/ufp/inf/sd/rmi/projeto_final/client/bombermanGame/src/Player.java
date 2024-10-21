package edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src;

import java.awt.Graphics;
import javax.swing.JPanel;
import java.util.Hashtable;
import java.awt.Image;

public class Player {
   int x, y;
   String status, color;
   JPanel panel;
   boolean alive;

   StatusChanger sc;

   Player(int id, JPanel panel, Coordinate[] spawn, boolean[] alive, String[] personColors, Hashtable<String, Image> sprites, Sprite sprite) throws InterruptedException {
      this.x = spawn[id].x;
      this.y = spawn[id].y;
      this.color = personColors[id];
      this.panel = panel;
      this.alive = alive[id];

      (sc = new StatusChanger(this, "wait", sprites, sprite)).start();
   }

   public void draw(Graphics g, Hashtable<String, Image> sprites) {
      if (alive) {
         g.drawImage(sprites.get(color + "/" + status), x, y, Const.WIDTH_SPRITE_PLAYER, Const.HEIGHT_SPRITE_PLAYER, null);
      }
   }
}

class StatusChanger extends Thread {
   Player p;
   String status;
   int index;
   boolean playerInMotion;
   Hashtable<String, Integer> maxLoopStatus;
   Hashtable<String, Image> sprites;

   StatusChanger(Player p, String initialStatus, Hashtable<String, Image> sprites, Sprite sprite) {
      this.p = p;
      this.status = initialStatus;
      this.sprites = sprites;
      this.maxLoopStatus = sprite.getMaxLoopStatus();
      index = 0;
      playerInMotion = true;
   }

   public void run() {
      while (true) {
         p.status = status + "-" + index;
         if (playerInMotion) {
            index = (++index) % maxLoopStatus.get(status);
            p.panel.repaint();
         }

         try {
            Thread.sleep(Const.RATE_PLAYER_STATUS_UPDATE);
         } catch (InterruptedException e) {
         }

         if (p.status.equals("dead-4")) {
            p.alive = false;
            if (p == ((Game)p.panel).getYou()) {
               System.exit(1);
            }
         }
      }
   }

   void setLoopStatus(String status) {
      this.status = status;
      index = 1;
      playerInMotion = true;
   }

   void stopLoopStatus() {
      playerInMotion = false;
      index = 0;
   }
}
