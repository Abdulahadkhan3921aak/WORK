package edu.ufp.inf.sd.rmi.projeto_final.server;

import java.io.Serializable;

public class User implements Serializable {
    private String uname;
    private String pword;

    public User(String uname, String pword) {
        this.uname = uname;
        this.pword = pword;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPword() {
        return pword;
    }

    public void setPword(String pword) {
        this.pword = pword;
    }
}

