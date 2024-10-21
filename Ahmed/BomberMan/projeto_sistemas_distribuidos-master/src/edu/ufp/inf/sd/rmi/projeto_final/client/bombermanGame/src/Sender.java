package edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src;

import edu.ufp.inf.sd.rmi.projeto_final.server.State;

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.rmi.RemoteException;

public class Sender extends KeyAdapter {
   private int lastKeyCodePressed;
   private Client client; // Adiciona a instância de Client
   private Game game;

   public Sender(Client client, Game game) { // Construtor para receber a instância de Client e Game
      this.client = client;
      this.game = game;
   }

   public void keyPressed(KeyEvent e) {
      if (e.getKeyCode() == KeyEvent.VK_SPACE) {
          try {
              client.observer.getSubject().setState(new State("pressedSpace " + game.getYou().x + " " + game.getYou().y));
          } catch (RemoteException ex) {
              throw new RuntimeException(ex);
          }
      }
      else if (isNewKeyCode(e.getKeyCode())) {
          try {
              client.observer.getSubject().setState(new State("keyCodePressed " + e.getKeyCode()));
          } catch (RemoteException ex) {
              throw new RuntimeException(ex);
          }
      }
   }

   public void keyReleased(KeyEvent e) {
       try {
           client.observer.getSubject().setState(new State("keyCodeReleased " + e.getKeyCode()));
       } catch (RemoteException ex) {
           throw new RuntimeException(ex);
       }
       lastKeyCodePressed = -1; // a próxima tecla sempre será nova
   }

   boolean isNewKeyCode(int keyCode) {
      boolean ok = (keyCode != lastKeyCodePressed) ? true : false;
      lastKeyCodePressed = keyCode;
      return ok;
   }
}
