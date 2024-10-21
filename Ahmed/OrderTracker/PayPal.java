import java.util.Scanner;

public class PayPal extends PaymentMethod{
    protected String username, password;

    public void loginPayPal(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter paypal username:");
        this.username = sc.nextLine();
        System.out.println("Enter paypal password:");
        this.password = sc.nextLine();
    }

}
