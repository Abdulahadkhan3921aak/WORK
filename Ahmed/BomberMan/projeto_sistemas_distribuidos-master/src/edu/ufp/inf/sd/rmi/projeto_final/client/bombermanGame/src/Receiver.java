package edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src;

import edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src.Player;

import java.rmi.RemoteException;
import java.util.ArrayList;

public class Receiver extends Thread {
   private Client client; // Adiciona a instância de Client
   private Player p;
   private Game game;

   public Receiver(Client client, Game game) { // Construtor para receber a instância de Client e Game
      this.client = client;
      this.game = game;
   }

   Player fromWhichPlayerIs(int id) {
      if (id == client.getId())
         return game.getYou();
      else if (id == (client.getId() + 1) % Const.QTY_PLAYERS)
         return game.getEnemy1();
      else if (id == (client.getId() + 2) % Const.QTY_PLAYERS)
         return game.getEnemy2();
      else if (id == (client.getId() + 3) % Const.QTY_PLAYERS)
         return game.getEnemy3();
      return null;
   }

   public void run() {
      String str[];
      while (true) {
          try {
              this.p = fromWhichPlayerIs(client.observer.getId()); // id do cliente
          } catch (RemoteException e) {
              throw new RuntimeException(e);
          }
          try {
              str = client.observer.getLastObserverState().getInfo().split(" ");
          } catch (RemoteException e) {
              throw new RuntimeException(e);
          }


          if (str[0].equals("mapUpdate")) { // p null
            game.setSpriteMap(str[1], Integer.parseInt(str[2]), Integer.parseInt(str[3]));
            game.getYou().panel.repaint();
         } else if (str[0].equals("newCoordinate")) {
            p.x = Integer.parseInt(str[1]);
            p.y = Integer.parseInt(str[2]);
            game.getYou().panel.repaint();
         } else if (str[0].equals("newStatus")) {
            p.sc.setLoopStatus(str[1]);
         } else if (str[0].equals("stopStatusUpdate")) {
            p.sc.stopLoopStatus();
         } else if (str[0].equals("playerJoined")) {
            p.alive = true;
         }
      }
   }
}
