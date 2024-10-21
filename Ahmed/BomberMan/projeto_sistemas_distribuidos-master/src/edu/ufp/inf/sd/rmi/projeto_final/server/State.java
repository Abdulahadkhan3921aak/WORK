package edu.ufp.inf.sd.rmi.projeto_final.server;

import java.io.Serializable;

public class State implements Serializable {
    private String msg;


    public State(String m) {
        this.msg = m;
    }



    /**
     *
     * @return
     */
    public String getInfo(){
        return this.msg;
    }

    /**
     *
     * @param m
     */
    public void setInfo(String m){
        this.msg = m;
    }
}

