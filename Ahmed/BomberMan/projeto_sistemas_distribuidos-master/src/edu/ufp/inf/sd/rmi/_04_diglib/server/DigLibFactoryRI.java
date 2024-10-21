package edu.ufp.inf.sd.rmi._04_diglib.server;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface DigLibFactoryRI extends Remote {

    boolean register(String username, String pwd) throws RemoteException;
    DigLibSessionRI login(String user, String pwd) throws RemoteException;
}
