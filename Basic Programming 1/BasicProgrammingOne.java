
// Working program using Reader Class 
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;
import java.util.Arrays;
import java.util.List;

public class BasicProgrammingOne
{ 
	
	public static void main(String[] args) throws IOException 
	{ 
        
		Reader s = new Reader(); 
        final int n = s.nextInt();
        final int t = s.nextInt();

        // Test case 1
        if (t == 1) {
            System.out.println(7);
        } else if (t < 4 && t > 1) {
            int a0 = s.nextInt();
            int a1 = s.nextInt();
            
            if (t == 2) {
                if (a0 > a1)
                    System.out.println("Bigger");
                else if (a0 == a1)
                    System.out.println("Equal");
                else
                    System.out.println("Smaller");    
                } 
            if (t == 3) {
                int a2 = s.nextInt();
                List<Integer> list = Arrays.asList(a0, a1, a2);
				System.out.println(list.stream().sorted().toArray()[1]);
				
            }
        } else {
            int[] A = new int[n];
            for (int i = 0; i < n; i++) {
                A[i] = s.nextInt();
            }
            if (t == 4 || t == 5) {
                long sum = 0;
                for(int i = 0; i < n; i++) {
                    if (t == 4 || (t == 5 && A[i] % 2 == 0)) 
                        sum += A[i];
                }
                System.out.println(sum);
            }
            else if (t == 6) {
                for(int i = 0; i < n; i++) {
                    System.out.print((char) ((A[i] % 26)+97));
                }

            } else if (t == 7) {
                boolean[] visited = new boolean[n];
                for (int i = 0;; i = A[i]) {
					if (i >= n) {
                        System.out.println("Out");
						break;
					} else if (visited[i] == true) {
                        System.out.println("Cyclic");
                        break;
                    } else if (i == n-1) {
                        System.out.println("Done");
						break;
					}
                    
                    
                    visited[i] = true;
                }
            }
        }
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
    
    static class FastReader 
	{ 
		BufferedReader br; 
		StringTokenizer st; 

		public FastReader() 
		{ 
			br = new BufferedReader(new
					InputStreamReader(System.in)); 
		} 

		String next() 
		{ 
			while (st == null || !st.hasMoreElements()) 
			{ 
				try
				{ 
					st = new StringTokenizer(br.readLine()); 
				} 
				catch (IOException e) 
				{ 
					e.printStackTrace(); 
				} 
			} 
			return st.nextToken(); 
		} 

		int nextInt() 
		{ 
			return Integer.parseInt(next()); 
		} 

		long nextLong() 
		{ 
			return Long.parseLong(next()); 
		} 

		double nextDouble() 
		{ 
			return Double.parseDouble(next()); 
		} 

		String nextLine() 
		{ 
			String str = ""; 
			try
			{ 
				str = br.readLine(); 
			} 
			catch (IOException e) 
			{ 
				e.printStackTrace(); 
			} 
			return str; 
		} 
	} 
} 
