package edu.ufp.inf.sd.rmi.projeto_final.server;

import edu.ufp.inf.sd.rmi.projeto_final.client.PlayerObserverRI;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

public interface SubjectRI extends Remote {
    void attach(PlayerObserverRI observer) throws RemoteException;
    void detach(PlayerObserverRI observer) throws RemoteException;
    void setState(String state) throws RemoteException;
    String getState() throws RemoteException;
    boolean isGameActive() throws RemoteException;
    List<PlayerObserverRI> getObservers() throws RemoteException;
}
