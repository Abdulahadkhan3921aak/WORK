package edu.ufp.inf.sd.rmi._04_diglib.server;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class DigLibSessionImpl extends UnicastRemoteObject implements DigLibSessionRI {

    private DigLibFactoryImpl factory;
    private String user;

    protected DigLibSessionImpl(DigLibFactoryImpl factory, String user) throws RemoteException {
        super();
        this.factory = factory;
        this.user = user;
    }

    @Override
    public Book[] search(String title, String author) throws RemoteException {
        return this.factory.getDatabase().select(title, author);
    }

    @Override
    public void logout() throws RemoteException {
        factory.getHashmap_session().remove(user);
    }
}
