package edu.ufp.inf.sd.rmi.projeto_final.server;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface GameFactoryRI extends Remote {
    boolean register(String username, String password) throws RemoteException;
    GameSessionRI login(String username, String password) throws RemoteException;
    void addGames(SubjectRI sub) throws RemoteException;
}
