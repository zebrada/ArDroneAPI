package drone;

import droneFunctionnalities.Client;
import droneFunctionnalities.Server;

public class Drone {
	
	//0 = SERVER + CLIENT, 1 = SERVER, 2 = CLIENT
	private static int STATUS = 2;
	
	public static void main(String[] args) {
		Server server;
		Client client;
		
		if(args.length >= 1) {
			server = new Server(args[0]);
			client = new Client(args[0]);
		} else {
			server = new Server();
			client = new Client();
		}
		
		if (STATUS == 0) {
			server.start();
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			client.start();
		} else if (STATUS == 1) {
			server.start();
		} else if (STATUS == 2) {
			client.start();
		}
	}
}
