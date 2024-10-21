package edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src;

import edu.ufp.inf.sd.rmi.projeto_final.client.PlayerObserverRI;
import edu.ufp.inf.sd.rmi.projeto_final.server.SubjectRI;

import java.io.IOException;
import java.io.PrintStream;
import java.io.Serializable;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

import javax.swing.*;


public class Client implements Serializable {

   private PlayerData[] players;
   private Coordinate[][] map;

   private int id;
   public PlayerObserverRI observer;

   private static final int rateStatusUpdate = 115;
   private Coordinate spawn[] = new Coordinate[Const.QTY_PLAYERS];
   private boolean alive[] = new boolean[Const.QTY_PLAYERS];
   private Scanner in;

   public Client(int id, Socket socket) {
      this.players = new PlayerData[Const.QTY_PLAYERS];
      this.map = new Coordinate[Const.LIN][Const.COL];

      try {
         this.in = new Scanner(socket.getInputStream());
      } catch (IOException e) {
         e.printStackTrace();
         return;
      }

      setMap();
      setPlayerData();

      this.id = id;

      System.out.print(" ok\n");

      receiveInitialSettings();
      Game game = new Game(Const.COL * Const.SIZE_SPRITE_MAP, Const.LIN * Const.SIZE_SPRITE_MAP, id, map, alive, spawn, new Sprite());
      new Receiver(this, game).start();

      // Ensure the GUI is created on the EDT
      SwingUtilities.invokeLater(() -> {
         new Window(game, this);
      });
   }
   public PlayerData[] getPlayers() {
      return players;
   }

   public Coordinate[][] getMap() {
      return map;
   }

   private boolean loggedIsFull() {
      for (int i = 0; i < Const.QTY_PLAYERS; i++)
         if (!players[i].logged)
            return false;
      return true;
   }

   private void setMap() {
      for (int i = 0; i < Const.LIN; i++)
         for (int j = 0; j < Const.COL; j++)
            map[i][j] = new Coordinate(Const.SIZE_SPRITE_MAP * j, Const.SIZE_SPRITE_MAP * i, "block");

      // paredes fixas das bordas
      for (int j = 1; j < Const.COL - 1; j++) {
         map[0][j].img = "wall-center";
         map[Const.LIN - 1][j].img = "wall-center";
      }
      for (int i = 1; i < Const.LIN - 1; i++) {
         map[i][0].img = "wall-center";
         map[i][Const.COL - 1].img = "wall-center";
      }
      map[0][0].img = "wall-up-left";
      map[0][Const.COL - 1].img = "wall-up-right";
      map[Const.LIN - 1][0].img = "wall-down-left";
      map[Const.LIN - 1][Const.COL - 1].img = "wall-down-right";

      // paredes fixas centrais
      for (int i = 2; i < Const.LIN - 2; i++)
         for (int j = 2; j < Const.COL - 2; j++)
            if (i % 2 == 0 && j % 2 == 0)
               map[i][j].img = "wall-center";

      // arredores do spawn
      map[1][1].img = "floor-1";
      map[1][2].img = "floor-1";
      map[2][1].img = "floor-1";
      map[Const.LIN - 2][Const.COL - 2].img = "floor-1";
      map[Const.LIN - 3][Const.COL - 2].img = "floor-1";
      map[Const.LIN - 2][Const.COL - 3].img = "floor-1";
      map[Const.LIN - 2][1].img = "floor-1";
      map[Const.LIN - 3][1].img = "floor-1";
      map[Const.LIN - 2][2].img = "floor-1";
      map[1][Const.COL - 2].img = "floor-1";
      map[2][Const.COL - 2].img = "floor-1";
      map[1][Const.COL - 3].img = "floor-1";
   }

   private void setPlayerData() {
      players[0] = new PlayerData(
              map[1][1].x - Const.VAR_X_SPRITES,
              map[1][1].y - Const.VAR_Y_SPRITES
      );

      players[1] = new PlayerData(
              map[Const.LIN - 2][Const.COL - 2].x - Const.VAR_X_SPRITES,
              map[Const.LIN - 2][Const.COL - 2].y - Const.VAR_Y_SPRITES
      );
      players[2] = new PlayerData(
              map[Const.LIN - 2][1].x - Const.VAR_X_SPRITES,
              map[Const.LIN - 2][1].y - Const.VAR_Y_SPRITES
      );
      players[3] = new PlayerData(
              map[1][Const.COL - 2].x - Const.VAR_X_SPRITES,
              map[1][Const.COL - 2].y - Const.VAR_Y_SPRITES
      );
   }

   private void receiveInitialSettings() {
      this.id = in.nextInt();

      //mapa
      for (int i = 0; i < Const.LIN; i++)
         for (int j = 0; j < Const.COL; j++)
            map[i][j] = new Coordinate(Const.SIZE_SPRITE_MAP * j, Const.SIZE_SPRITE_MAP * i, in.next());

      //situação (vivo ou morto) inicial de todos os jogadores
      for (int i = 0; i < Const.QTY_PLAYERS; i++)
         alive[i] = in.nextBoolean();

      //coordenadas inicias de todos os jogadores
      for (int i = 0; i < Const.QTY_PLAYERS; i++)
         spawn[i] = new Coordinate(in.nextInt(), in.nextInt());
   }

   public int getId() {
      return id;
   }



}

class Window extends JFrame {
   private static final long serialVersionUID = 1L;

   Window(Game game, Client client) {
      Sprite.loadImages();
      Sprite.setMaxLoopStatus();

      add(game);
      setTitle("bomberman");
      pack();
      setVisible(true);
      setLocationRelativeTo(null);
      setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

      addKeyListener(new Sender(client, game));
   }
}

class PlayerData {
   boolean logged, alive;
   int x, y; //coordenada atual
   int numberOfBombs;

   PlayerData(int x, int y) {
      this.x = x;
      this.y = y;
      this.logged = false;
      this.alive = false;
      this.numberOfBombs = 1; // para 2 bombas, é preciso tratar cada bomba em uma thread diferente
   }
}
