package edu.ufp.inf.sd.rmi.projeto_final.server;

import edu.ufp.inf.sd.rmi.projeto_final.client.PlayerObserverRI;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;

public class SubjectImpl extends UnicastRemoteObject implements SubjectRI {
    private String state;
    private boolean gameActive;
    private final List<PlayerObserverRI> observers;
    private final int maxPlayers;

    public SubjectImpl(int maxPlayers) throws RemoteException {
        this.observers = new ArrayList<>();
        this.maxPlayers = maxPlayers;
        this.gameActive = false;
    }

    @Override
    public void attach(PlayerObserverRI observer) throws RemoteException {
        if (observers.size() < maxPlayers) {
            observers.add(observer);
            if (observers.size() == maxPlayers) {
                this.gameActive = true;
            }
        }
    }

    @Override
    public void detach(PlayerObserverRI observer) throws RemoteException {
        observers.remove(observer);
        if (observers.isEmpty()) {
            this.gameActive = false;
        }
    }

    @Override
    public void setState(String state) throws RemoteException {
        this.state = state;
        notifyObservers();
    }

    @Override
    public String getState() throws RemoteException {
        return state;
    }

    @Override
    public boolean isGameActive() throws RemoteException {
        return gameActive;
    }

    @Override
    public List<PlayerObserverRI> getObservers() throws RemoteException {
        return new ArrayList<>(observers);
    }

    private void notifyObservers() throws RemoteException {
        for (PlayerObserverRI observer : observers) {
            observer.update();
        }
    }
}
