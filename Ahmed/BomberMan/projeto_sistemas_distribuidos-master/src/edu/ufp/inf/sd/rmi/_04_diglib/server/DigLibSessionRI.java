package edu.ufp.inf.sd.rmi._04_diglib.server;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface DigLibSessionRI extends Remote {

    Book[] search(String title, String author) throws RemoteException;
    void logout() throws RemoteException;
}
