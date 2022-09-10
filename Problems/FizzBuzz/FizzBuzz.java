import java.util.Scanner;

public class FizzBuzz {
    public static void main(String[] args) {
        // Setup
        Scanner sc = new Scanner(System.in);
        int X = 0,
            Y = 0,
            N = 0;
        
        // Get the numbers
        while(sc.hasNext()) {
            int buffer = sc.nextInt();
            if (X == 0)
                X = buffer;
            else if (Y == 0)
                Y = buffer;
            else if (N == 0)
                N = buffer;
            else
                break;
        }
        sc.close();

        for (int i = 1; i <= N; i++) {
            if (i % X == 0 && i % Y == 0)
                System.out.println("FizzBuzz");
            else if (i % X == 0)
                System.out.println("Fizz");
            else if (i % Y == 0 )
                System.out.println("Buzz");
            else
                System.out.println(i);
        }


    }
}