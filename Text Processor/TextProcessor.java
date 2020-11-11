// Working program using Reader Class 
import java.io.DataInputStream; 
import java.io.FileInputStream; 
import java.io.IOException; 
import java.io.InputStreamReader; 
import java.util.Scanner; 
import java.util.StringTokenizer; 

import java.util.Set;
import java.util.TreeSet;

public class TextProcessor 
{ 
	
	public static void main(String[] args) throws IOException 
	{ 
        
		Reader s = new Reader(); 
		String input = s.readLine();
		int Q = s.nextInt(),
			W = s.nextInt();

		for (int j = 0; j < Q; j++) {
			int i = s.nextInt() - 1;
			int endIndex = i + W - 1;
			System.out.println(permute(input.substring(i, endIndex)).size());
		}
		
	} 

	public static Set<String> permute(String chars)
	{
		// Use sets to eliminate semantic duplicates (aab is still aab even if you switch the two 'a's)
		// Switch to HashSet for better performance
		Set<String> set = new TreeSet<String>();

		// Termination condition: only 1 permutation for a string of length 1
		if (chars.length() == 1)
		{
		set.add(chars);
		}
		else
		{
		// Give each character a chance to be the first in the permuted string
		for (int i=0; i<chars.length(); i++)
		{
			// Remove the character at index i from the string
			String pre = chars.substring(0, i);
			String post = chars.substring(i+1);
			String remaining = pre+post;

			// Recurse to find all the permutations of the remaining chars
			for (String permutation : permute(remaining))
			{
			// Concatenate the first character with the permutations of the remaining chars
			set.add(chars.charAt(i) + permutation);
			}
		}
		}
		return set;
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
} 
