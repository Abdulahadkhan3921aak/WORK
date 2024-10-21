public class PaymentMethod {

    protected double customerAmt, paymentAmt;
    public void setPaymentAmt (double paymentAmt){
        this.paymentAmt=paymentAmt;
    }

    public double getPaymentAmt (){
        return this.paymentAmt;
    }

    public void setCustomerAmt (double customerAmt){
        this.customerAmt = customerAmt;
    }
    public double getCustomerAmt(){
        return this.customerAmt;
    }

    public boolean processPayment (){
        if (customerAmt == paymentAmt) return true;
        else return false;
    }


}
