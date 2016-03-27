package droneFunctionnalities;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.logging.Logger;

public class Server extends Thread {
	
	private static final Logger log = Logger.getLogger(Server.class.getName());

	protected static String IPADDR = "192.168.200.22";
	protected static final int SIZEMSG = 1024;
	protected static final int PORT = 5556;

	protected String ipAddr;
	protected InetAddress inetAddr;
	protected DatagramSocket socket;
	private DatagramPacket in;
	private byte[] buf;
	
	public Server() {
		this(IPADDR);
	}
	
	public Server(String ipAddr) {
		this.buf = new byte[SIZEMSG];
		this.ipAddr = ipAddr;
		try {
			this.inetAddr = InetAddress.getByName(this.ipAddr);
			this.socket = new DatagramSocket(PORT, inetAddr);
		} catch (UnknownHostException e) {
			log.warning("Error: Unknowned Host.");
			e.printStackTrace();
		} catch (SocketException e) {
			log.warning("Error: Socket creation failed.");
			e.printStackTrace();
		}
		this.in = new DatagramPacket(buf, SIZEMSG);
	}

	public void receive() {
		try {
			this.socket.receive(this.in);
		} catch (IOException e) {
			log.warning("Error: Receive message failed.");
			e.printStackTrace();
		}
	}
	
	public void printCommand() {
		log.info(new String(this.buf));
	}
	
	public void run() {
		while(true) {
			this.receive();
			this.printCommand();
		}
	}
}
