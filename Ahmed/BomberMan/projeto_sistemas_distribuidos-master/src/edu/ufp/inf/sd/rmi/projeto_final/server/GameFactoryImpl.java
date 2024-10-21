package edu.ufp.inf.sd.rmi.projeto_final.server;

import edu.ufp.inf.sd.rmi.projeto_final.client.PlayerObserverRI;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.security.Key;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class GameFactoryImpl extends UnicastRemoteObject implements GameFactoryRI {
    private final DatabaseMockup database;
    private final HashMap<String, GameSessionRI> hashmap_session;
    private static final Key SECRET_KEY = Keys.secretKeyFor(SignatureAlgorithm.HS256);

    protected GameFactoryImpl() throws RemoteException {
        super();
        this.database = new DatabaseMockup();
        this.hashmap_session = new HashMap<>();
    }

    @Override
    public void addGames(SubjectRI sub) throws RemoteException {
        database.addSubject(sub);
    }

    @Override
    public boolean register(String username, String password) throws RemoteException {
        try {
            database.register(username, password);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public GameSessionRI login(String username, String password) throws RemoteException {
        if (database.exists(username, password)) {
            String token = generateToken(username);
            if (hashmap_session.containsKey(token)) {
                return hashmap_session.get(token);
            } else {
                GameSessionRI session = new GameSessionImpl(username, this);
                hashmap_session.put(token, session);
                return session;
            }
        } else {
            return null;
        }
    }

    private String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)
                .signWith(SECRET_KEY)
                .compact();
    }

    /**
     public String verifyToken(String token) throws RemoteException {
     try {
     Algorithm algorithm = Algorithm.HMAC256(SECRET_KEY);
     JWTVerifier verifier = JWT.require(algorithm).build();
     DecodedJWT jwt = verifier.verify(token);
     return jwt.getSubject();
     } catch (Exception e) {
     throw new RemoteException("Invalid token");
     }
     }
     */
}
