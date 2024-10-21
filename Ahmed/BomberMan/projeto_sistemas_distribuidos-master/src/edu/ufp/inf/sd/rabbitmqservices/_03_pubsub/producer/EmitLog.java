package edu.ufp.inf.sd.rabbitmqservices._03_pubsub.producer;

import com.rabbitmq.client.*;
import edu.ufp.inf.sd.rabbitmqservices.util.RabbitUtils;

public class EmitLog {

    // Name of the queue
    //public final static String TASK_QUEUE_NAME = "task_queue";

    /**
     * Allow arbitrary messages to be sent from the command line.
     * @param args
     */
    public static void main(String[] args) throws Exception {

        //Read args passed via shell command
        String host=args[0];
        int port=Integer.parseInt(args[1]);
        String exchangeName=args[2];

        //try-with-resources
        try (Connection connection=RabbitUtils.newConnection2Server(host, port, "guest", "guest");
             Channel channel=RabbitUtils.createChannel2Server(connection)) {
            /* We must declare a queue to send to (this is idempotent, i.e. it will only be created if it doesn't exist;
               then we can publish a message to the queue;
               The message content is a byte array (can encode whatever we need).
               The previous queue was not Durable... persistent */
            //channel.queueDeclare(TASK_QUEUE_NAME, false, false, false, null);

            /* Declare a queue as Durable (queue won't be lost even if RabbitMQ restarts);
               RabbitMQ does not allow redefine an existing queue with different parameters (hence create a new one) */
            System.out.println(" [x] Declare exchange: '" + exchangeName + "' of type "
                + BuiltinExchangeType.FANOUT.toString());
            channel.exchangeDeclare(exchangeName, BuiltinExchangeType.FANOUT);

            //String message = "Hello...";
            //Receive message to send via argv[3]
            String message=RabbitUtils.getMessage(args, 3);

            /* To avoid loosing queues when rabbitmq crashes, mark messages as persistent by setting
             MessageProperties (which implements BasicProperties) to value PERSISTENT_TEXT_PLAIN. */
            //channel.basicPublish("", TASK_QUEUE_NAME, null, message.getBytes("UTF-8"));
            String routingKey = "";
            channel.basicPublish(exchangeName, routingKey, null,
                    message.getBytes("UTF-8"));
            System.out.println(" [x] Sent '" + message + "'");
        }
        /* Lastly, we close the channel and the connection... not anymore since try-with-resources closes resources! */
        //channel.close();
        //connection.close();
    }
}
