package edu.ufp.inf.sd.rmi.projeto_final.server;

import edu.ufp.inf.sd.rmi.projeto_final.client.PlayerObserverRI;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class GameSessionImpl extends UnicastRemoteObject implements GameSessionRI {
    private final String username;
    private final GameFactoryImpl factory;
    private final Map<String, SubjectRI> gameSessions = new HashMap<>();

    public GameSessionImpl(String username, GameFactoryImpl factory) throws RemoteException {
        super();
        this.username = username;
        this.factory = factory;
    }

    @Override
    public void createGame(String gameName, PlayerObserverRI observer, int numPlayers) throws RemoteException {
        try {
            SubjectRI newGameSubject = new SubjectImpl(numPlayers);
            newGameSubject.attach(observer);
            observer.attach(newGameSubject);

            // Store the new game session
            gameSessions.put(gameName, newGameSubject);
            factory.addGames(newGameSubject);

            System.out.println("Game created successfully with name: " + gameName);
        } catch (RemoteException e) {
            throw new RemoteException("Error creating game", e);
        }
    }

    @Override
    public void joinGame(String gameId) throws RemoteException {
        SubjectRI game = gameSessions.get(gameId);
        if (game != null) {
            // Logic to add the player to the game session
            // Example: game.attach(playerObserver);
        } else {
            throw new RemoteException("Game not found.");
        }
    }

    @Override
    public void updateGame(String token, String gameId, String state) throws RemoteException {
        SubjectRI game = gameSessions.get(gameId);
        if (game != null) {
            // Logic to update the game state
            // Example: game.setState(state);
        } else {
            throw new RemoteException("Game not found or invalid state.");
        }
    }

    @Override
    public void logout(String token) throws RemoteException {
        // Logic for logout (if required)
    }

    @Override
    public List<String> getAllGames() throws RemoteException {
        return gameSessions.keySet().stream().collect(Collectors.toList());
    }

    @Override
    public List<String> getActiveGames() throws RemoteException {
        return gameSessions.entrySet().stream()
                .filter(entry -> {
                    try {
                        return entry.getValue().isGameActive();
                    } catch (RemoteException e) {
                        e.printStackTrace();
                        return false;
                    }
                })
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }

    @Override
    public List<String> getAvailableGames() throws RemoteException {
        return gameSessions.entrySet().stream()
                .filter(entry -> {
                    try {
                        return !entry.getValue().isGameActive();
                    } catch (RemoteException e) {
                        e.printStackTrace();
                        return false;
                    }
                })
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }

    @Override
    public SubjectRI getGameReference(String gameId) throws RemoteException {
        SubjectRI game = factory.getActiveGames().get(gameId);
        if (game != null && !((SubjectImpl) game).isGameActive()) {
            return game;
        }
        throw new RemoteException("No active game found for the provided game ID.");
    }

    public String getUsername() {
        return username;
    }
}
