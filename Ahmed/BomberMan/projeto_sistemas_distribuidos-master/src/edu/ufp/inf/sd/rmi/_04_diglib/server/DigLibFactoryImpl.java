package edu.ufp.inf.sd.rmi._04_diglib.server;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;

public class DigLibFactoryImpl extends UnicastRemoteObject implements DigLibFactoryRI {

    private DBMockup database;
    private HashMap<String, DigLibSessionRI> hashmap_session;

    protected DigLibFactoryImpl() throws RemoteException {
        super();
        this.database = new DBMockup();
        this.hashmap_session = new HashMap<>();
    }

    public DBMockup getDatabase() {
        return database;
    }

    public HashMap<String, DigLibSessionRI> getHashmap_session() {
        return hashmap_session;
    }

    @Override
    public boolean register(String username, String pwd) throws RemoteException {

        try {
            database.register(username, pwd);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public DigLibSessionRI login(String user, String pwd) throws RemoteException {

        if(database.exists(user, pwd)){
            if(hashmap_session.containsKey(user)){
                return hashmap_session.get(user);
            }
            else{
                DigLibSessionRI session = new DigLibSessionImpl(this, user);
                hashmap_session.put(user, session);
                return session;
            }
        }
        else{
            return null;
        }
    }
}
