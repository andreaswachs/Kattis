import java.util.Scanner;
import java.util.Stack;

public class Bijele {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Stack<Integer> piecesStack = new Stack<>();
        piecesStack.add(8);
        piecesStack.add(2);
        piecesStack.add(2);
        piecesStack.add(2);
        piecesStack.add(1);
        piecesStack.add(1);
        String output = "";
        
        while(sc.hasNextInt()) {
            output += String.format("%d", piecesStack.pop() - sc.nextInt());
            if (!piecesStack.isEmpty())
                output += " ";
        }
        sc.close();
        System.out.println(output);
        
    }
}