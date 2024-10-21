package edu.ufp.inf.sd.rmi.projeto_final.client;

import edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src.Client;
import edu.ufp.inf.sd.rmi.projeto_final.server.State;
import edu.ufp.inf.sd.rmi.projeto_final.server.SubjectRI;

import java.net.Socket;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class PlayerObserverImpl extends UnicastRemoteObject implements PlayerObserverRI {

    public SubjectRI subject;
    public String lastObserverState;
    public int id;



    protected PlayerObserverImpl() throws RemoteException {
        super();
    }

    @Override
    public void update() throws RemoteException {
        // Handle update notification
        System.out.println("Received an update notification.");
    }

    @Override
    public void update(String message) throws RemoteException {
        lastObserverState = subject.getState();
        System.out.println("Update received: " + message);
        if (message.equals("sala")) {
            Socket mockSocket = new Socket();
            new Client(id, mockSocket);

        }
    }


    @Override
    public void attach(SubjectRI subjectRI) throws RemoteException {
        subject = subjectRI;
        this.id = subject.getObservers().size()-1;
    }

    public SubjectRI getSubject() {
        return subject;
    }

    public void setSubject(SubjectRI subject) {
        this.subject = subject;
    }

    public String getLastObserverState() {
        return lastObserverState;
    }

    public void setLastObserverState(State lastObserverState) {
        this.lastObserverState = String.valueOf(lastObserverState);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}

