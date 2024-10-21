package edu.ufp.inf.sd.rmi.projeto_final.server;

import edu.ufp.inf.sd.rmi.projeto_final.client.PlayerObserverRI;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

public interface GameSessionRI extends Remote {
    void createGame(String gameName, PlayerObserverRI observer, int numPlayers) throws RemoteException;
    void joinGame(String gameId) throws RemoteException;
    void updateGame(String token, String gameId, String state) throws RemoteException;
    void logout(String token) throws RemoteException;
    List<String> getAllGames() throws RemoteException;
    List<String> getActiveGames() throws RemoteException;
    List<String> getAvailableGames() throws RemoteException;
    SubjectRI getGameReference(String gameId) throws RemoteException;
}
