package edu.ufp.inf.sd.rmi._03_pingpong.client;

import edu.ufp.inf.sd.rmi._03_pingpong.server.Ball;
import edu.ufp.inf.sd.rmi._03_pingpong.server.PingRI;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class PongImpl extends UnicastRemoteObject implements PongRI {

    private PingRI pingRI;

    protected PongImpl(PingRI pingRI, Ball bola) throws RemoteException {
        super();
        this.pingRI = pingRI;
        pingRI.ping(bola, this);
    }

    @Override
    public void pong(Ball bola) throws RemoteException {
        System.out.println("Pong");
        pingRI.ping(bola, this);
    }
}
