package droneFunctionnalities;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.logging.Logger;

public class Client extends Thread {
	
	private static final Logger log = Logger.getLogger( Client.class.getName() );

	protected static String IPADDR = "192.168.200.32";
	protected static final int SIZEMSG = 1024;
	protected static final int PORT = 5554;

	protected String ipAddr;
	protected InetAddress inetAddr;
	protected DatagramSocket socket;
	private DatagramPacket out;
	
	public Client() {
		this(IPADDR);
	}
	
	public Client(String ipAddr) {
		this.ipAddr = ipAddr;
		try {
			this.inetAddr = InetAddress.getByName(this.ipAddr);
			this.socket = new DatagramSocket();
		} catch (UnknownHostException e) {
			log.warning("Error: Unknowned Host.");
			e.printStackTrace();
		} catch (SocketException e) {
			log.warning("Error: Socket creation failed.");
			e.printStackTrace();
		}
	}

	public void send() {
		byte[] buf = "Hello".getBytes();
		try {
			out = new DatagramPacket(buf, 0, buf.length, inetAddr, PORT);
			this.socket.send(this.out);
			log.info("Send: "+new String(buf));
		} catch (IOException e) {
			log.warning("Error: Receive message failed.");
			e.printStackTrace();
		}
	}
	
	public void run() {
		while(true) {
			this.send();
			try {
				sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
