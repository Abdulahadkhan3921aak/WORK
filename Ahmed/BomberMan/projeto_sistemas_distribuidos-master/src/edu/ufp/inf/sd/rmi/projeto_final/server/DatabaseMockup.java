package edu.ufp.inf.sd.rmi.projeto_final.server;

import java.util.ArrayList;

public class DatabaseMockup {
    private final ArrayList<User> users;
    private final ArrayList<SubjectRI> subjects;

    public DatabaseMockup() {
        users = new ArrayList<>();
        subjects = new ArrayList<>();
        users.add(new User("guest", "ufp"));
    }

    // User Management
    public void register(String u, String p) {
        if (!exists(u, p)) {
            users.add(new User(u, p));
        }
    }

    public boolean exists(String u, String p) {
        for (User usr : users) {
            if (usr.getUname().equals(u) && usr.getPword().equals(p)) {
                return true;
            }
        }
        return false;
    }

    // Subject Management
    public void addSubject(SubjectRI subject) {
        subjects.add(subject);
    }

    public ArrayList<SubjectRI> getSubjects() {
        return subjects;
    }
}
