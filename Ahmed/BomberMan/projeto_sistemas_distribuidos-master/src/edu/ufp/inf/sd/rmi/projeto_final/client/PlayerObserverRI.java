package edu.ufp.inf.sd.rmi.projeto_final.client;

import edu.ufp.inf.sd.rmi.projeto_final.server.State;
import edu.ufp.inf.sd.rmi.projeto_final.server.SubjectRI;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface PlayerObserverRI extends Remote {
    void update() throws RemoteException;
    void update(String message) throws RemoteException;
    void attach(SubjectRI subjectRI) throws RemoteException;
    SubjectRI getSubject() throws RemoteException;
    void setSubject(SubjectRI subject) throws RemoteException;
    String getLastObserverState() throws RemoteException;
    void setLastObserverState(State lastObserverState) throws RemoteException;
    int getId() throws RemoteException;
    void setId(int id) throws RemoteException;
}

