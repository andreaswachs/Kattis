import java.util.Scanner;

public class Solving {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while(sc.hasNextLine()) {
            String[] input = sc.nextLine().split(" ");
            System.out.println(input[1]);
            break;
        }
        sc.close();
    }
}