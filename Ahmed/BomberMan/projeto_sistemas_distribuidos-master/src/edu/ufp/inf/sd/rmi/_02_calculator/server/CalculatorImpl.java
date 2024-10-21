package edu.ufp.inf.sd.rmi._02_calculator.server;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CalculatorImpl extends UnicastRemoteObject implements CalculatorRI {
    protected CalculatorImpl() throws RemoteException {
        super();
    }

    @Override
    public double add(double a, double b) throws RemoteException {
        double soma = a + b;
        Logger.getLogger(this.getClass().getName()).log(Level.INFO, "Soma = "+soma);
        return soma;
    }

    @Override
    public double add(ArrayList<Double> list) throws RemoteException {
        return 0;
    }

    @Override
    public double div(double a, double b) throws RemoteException {
        if(b == 0){
            throw new RemoteArithmeticException("Erro ao dividir por zero!");
        }
        double div = a + b;
        Logger.getLogger(this.getClass().getName()).log(Level.INFO, "Div = "+div);
        return div;
    }
}
