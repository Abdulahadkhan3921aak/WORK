package edu.ufp.inf.sd.rmi.projeto_final.client;

import edu.ufp.inf.sd.rmi.projeto_final.server.GameFactoryRI;
import edu.ufp.inf.sd.rmi.projeto_final.server.GameSessionRI;
import edu.ufp.inf.sd.rmi.projeto_final.server.SubjectRI;
import edu.ufp.inf.sd.rmi.util.rmisetup.SetupContextRMI;

import java.rmi.RemoteException;
import java.rmi.NotBoundException;
import java.rmi.Remote;
import java.rmi.registry.Registry;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BombermanClient {

    private SetupContextRMI contextRMI;
    private GameFactoryRI gameFactory;

    public static void main(String[] args) {
        if (args != null && args.length < 3) {
            System.err.println("usage: java [options] edu.ufp.inf.sd.projeto_rmi.client.BombermanClient <rmi_registry_ip> <rmi_registry_port> <service_name>");
            System.exit(-1);
        } else {
            BombermanClient client = new BombermanClient(args);
            client.lookupService();
            client.playService();
        }
    }

    public BombermanClient(String[] args) {
        try {
            SetupContextRMI.printArgs(this.getClass().getName(), args);
            String registryIP = args[0];
            String registryPort = args[1];
            String serviceName = args[2];
            contextRMI = new SetupContextRMI(this.getClass(), registryIP, registryPort, new String[]{serviceName});
        } catch (RemoteException e) {
            Logger.getLogger(BombermanClient.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    private Remote lookupService() {
        try {
            Registry registry = contextRMI.getRegistry();
            if (registry != null) {
                String serviceUrl = contextRMI.getServicesUrl(0);
                Logger.getLogger(this.getClass().getName()).log(Level.INFO, "going to lookup service @ {0}", serviceUrl);
                gameFactory = (GameFactoryRI) registry.lookup(serviceUrl);
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.INFO, "registry not bound (check IPs). :(");
            }
        } catch (RemoteException | NotBoundException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
        }
        return gameFactory;
    }

    private void playService() {
        try {
            if (gameFactory != null) {
                boolean registered = gameFactory.register("testuser", "testpassword");
                Logger.getLogger(this.getClass().getName()).log(Level.INFO, "User registered: {0}", registered);

                GameSessionRI session = gameFactory.login("testuser", "testpassword");
                if (session != null) {
                    Logger.getLogger(this.getClass().getName()).log(Level.INFO, "Login successful.");


                    //this.token = session.getToken(); // you need to ensure this method exists in your GameSessionRI


                    PlayerObserverRI observer = new PlayerObserverImpl();
                    session.createGame("jogo1", observer, 1);


                    Logger.getLogger(this.getClass().getName()).log(Level.INFO, "Observer attached.");
                } else {
                    Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Login failed.");
                }
            }
        } catch (RemoteException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
        }
    }
}
