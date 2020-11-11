// Working program using Reader Class 
import java.io.DataInputStream; 
import java.io.FileInputStream; 
import java.io.IOException; 
import java.io.InputStreamReader; 
import java.util.Scanner; 
import java.util.StringTokenizer; 
import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedList;

public class TowersOfPowersTwo 
{ 
	// https://www.devglan.com/corejava/pros-and-cons-collection-java
	// linkedhaashset for numbers??
	public static void main(String[] args) throws IOException 
	{ 
        
		Reader s = new Reader(); 

		// read the number of entries
		int M = s.nextInt();

		// Print out the case number.. this is always case 1.
		System.out.println("Case 1:");

		// Create a Number array and read stdin for numbers. Add them with the index saved

		LinkedList<Number> nums = new LinkedList<>();

		Number[] numbers = new Number[M];
		for(int i = 0; i < M; i++) {
			// numbers[i] = new Number(s.readLine(), i);		
			Number n = new Number(s.readLine(), i);
			if (i > 0) {

			} else if (i == 1) {
				if (nums.peekLast().getValue() > n.getValue()) {

				}
			} else {
				nums.add(n);
			}
		}



		// First sort by their computed value
		Arrays.sort(numbers, new SortNumbersByValue());

		// Then sort each block of equal values by their indexes
		// this is not really an OO like function but it gets the job done
		sortNumbersByIndex(numbers);

		// Output the numbers now, by their original input
		for (Number n : numbers) {
			System.out.println(n.getRawNumber());
		}	
	} 

	public static void sortNumbersByIndex(Number[] numbers) {
		// Go through the array
		for (int i = 0; i < numbers.length -1; i++) {
			if (numbers[i].eval() == numbers[i+1].eval()) {
				// Found the beginning of equal values, lets see if there are more elements than 2 that are the same here

				int j = i + 1;
				while(j < numbers.length) {
					if (numbers[j].eval() == numbers[i].eval()) {
						j++;
					}
				}

				// j should now be the value of the last index with the same eval value as numbers[i]
				// Create a new buffer and sort it by their index
				Number[] numbersBuffer = new Number[(j-i)];
				// Copy the slice out of the numbers array
				System.arraycopy(numbers, i, numbersBuffer, 0, (j-i));
				// Sort the numbers by their indices
				Arrays.sort(numbersBuffer, new SortNumbersByIndex());
				// Copy the value back. This will work as replacing the slice we took out before
				System.arraycopy(numbersBuffer, 0, numbers, i, numbersBuffer.length);
			}
		}
	}

	static class SortNumbersByIndex implements Comparator<Number> 
	{
		public int compare(Number a, Number b) {
			return a.getIndex() - b.getIndex();
		}
	}

	static class SortNumbersByValue implements Comparator<Number>
	{
		public int compare(Number a, Number b) {
			return ((int)a.getValue()) - ((int) b.getValue());
		}
	}


	static class Number
	{
		String rawNumber;
		int inputIndex;
		long value;

		public Number(String number, int inputIndex)
		{
			this.rawNumber = number;
			this.inputIndex = inputIndex;
			this.value = this.eval();
		}

		public String toString() {
			return String.format("%l", this.value);
		}

		public long getValue() {
			return this.value;
		}

		public String getRawNumber() {
			return this.rawNumber;
		}

		public int getIndex() {
			return this.inputIndex;
		}

		public long eval()
		{
			if (this.rawNumber.contains("^"))
			{

				// This should be faster than the code below it
				long sum = 1;
				String[] parts = this.rawNumber.split("\\^");
				for (int i = parts.length -1; i >= 0; i--) {
					sum = (long) Math.pow(Integer.parseInt(parts[i]), sum);
				}
				return sum;

				/*
				// Create a linked list - its going to have constant insertion speed
				LinkedList<Long> numbers = new LinkedList<>();
				
				// Split the exponents from the raw number, add them to the list in reverse order
				Arrays.stream(this.rawNumber.split("\\^"))
					.forEach(str -> numbers.add(0, Long.parseLong(str)));

				// Calculate the number, when computing the components and stuff. Working from the top and down. 
				return numbers.stream()
					.reduce(1L, (total, part) -> (long) Math.pow(part, total));
				*/
			} else {
				return Integer.parseInt(this.rawNumber);
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
} 
