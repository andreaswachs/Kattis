// Working program using Reader Class 
import java.io.DataInputStream; 
import java.io.FileInputStream; 
import java.io.IOException; 
import java.io.InputStreamReader; 
import java.util.Scanner; 
import java.util.StringTokenizer;

import java.io.OutputStreamWriter;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.OutputStream;


import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

public class catalan 
{ 
	final static BigInteger ONE = BigInteger.ONE;
	public static void main(String[] args) throws IOException 
	{ 
		Reader s = new Reader(); 
		OutputWriter o = new OutputWriter();

		int n = s.nextInt();
		String[] outputs = new String[n];
		for(int i = 0; i < n; i++) {
			outputs[i] = cn(s.nextInt()).toString() + "\n";
		}
		for(String b : outputs)
			o.writer.write(b);
		o.writer.close();
	} 

	public static BigInteger factorial(int n) {
		BigInteger acc = ONE;
		BigInteger inc = ONE;

		for(long i = 1; i <= n; i++) {
			acc = acc.multiply(inc);
			inc = inc.add(ONE);
		}
		return acc;
	}
	
	public static BigInteger cn(int n) {
		return factorial(2*n).divide(factorial(n+1).multiply(factorial(n)));
	}

    
    /**
     * Her kommer den hurtige IO klasse.
     * Tak til https://www.geeksforgeeks.org/fast-io-in-java-in-competitive-programming/
    */
    static class Reader 
	{ 
		final private int BUFFER_SIZE = 1 << 16; 
		private DataInputStream din; 
		private byte[] buffer; 
		private int bufferPointer, bytesRead; 

		public Reader() 
		{ 
			din = new DataInputStream(System.in); 
			buffer = new byte[BUFFER_SIZE]; 
			bufferPointer = bytesRead = 0; 
		} 

		public Reader(String file_name) throws IOException 
		{ 
			din = new DataInputStream(new FileInputStream(file_name)); 
			buffer = new byte[BUFFER_SIZE]; 
			bufferPointer = bytesRead = 0; 
		} 

		public String readLine() throws IOException 
		{ 
			byte[] buf = new byte[64]; // line length 
			int cnt = 0, c; 
			while ((c = read()) != -1) 
			{ 
				if (c == '\n') 
					break; 
				buf[cnt++] = (byte) c; 
			} 
			return new String(buf, 0, cnt); 
		} 

		public int nextInt() throws IOException 
		{ 
			int ret = 0; 
			byte c = read(); 
			while (c <= ' ') 
				c = read(); 
			boolean neg = (c == '-'); 
			if (neg) 
				c = read(); 
			do
			{ 
				ret = ret * 10 + c - '0'; 
			} while ((c = read()) >= '0' && c <= '9'); 

			if (neg) 
				return -ret; 
			return ret; 
		} 

		public long nextLong() throws IOException 
		{ 
			long ret = 0; 
			byte c = read(); 
			while (c <= ' ') 
				c = read(); 
			boolean neg = (c == '-'); 
			if (neg) 
				c = read(); 
			do { 
				ret = ret * 10 + c - '0'; 
			} 
			while ((c = read()) >= '0' && c <= '9'); 
			if (neg) 
				return -ret; 
			return ret; 
		} 

		public double nextDouble() throws IOException 
		{ 
			double ret = 0, div = 1; 
			byte c = read(); 
			while (c <= ' ') 
				c = read(); 
			boolean neg = (c == '-'); 
			if (neg) 
				c = read(); 

			do { 
				ret = ret * 10 + c - '0'; 
			} 
			while ((c = read()) >= '0' && c <= '9'); 

			if (c == '.') 
			{ 
				while ((c = read()) >= '0' && c <= '9') 
				{ 
					ret += (c - '0') / (div *= 10); 
				} 
			} 

			if (neg) 
				return -ret; 
			return ret; 
		} 

		private void fillBuffer() throws IOException 
		{ 
			bytesRead = din.read(buffer, bufferPointer = 0, BUFFER_SIZE); 
			if (bytesRead == -1) 
				buffer[0] = -1; 
		} 

		private byte read() throws IOException 
		{ 
			if (bufferPointer == bytesRead) 
				fillBuffer(); 
			return buffer[bufferPointer++]; 
		} 

		public void close() throws IOException 
		{ 
			if (din == null) 
				return; 
			din.close(); 
		} 
	} 

	static class OutputWriter{
		BufferedWriter writer;
	  
		public OutputWriter(){
			writer = new BufferedWriter(new OutputStreamWriter(System.out));
		}
	  
		public void print(int i) throws IOException {
		  writer.write(i);
		}
	  
		public void print(String s) throws IOException {
		  writer.write(s);
		}
	  
		public void print(char []c) throws IOException {
		  writer.write(c);
		}
		public  void close() throws IOException {
		  writer.close();
		}
	}
} 
