import java.util.Scanner;
import java.util.HashMap;

public class Bela {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // HashMap<String, Integer[]> values = new HashMap<>();
        HashMap<Character, Integer> pointIndex = new HashMap<>();
        HashMap<Character, Integer> cardMap = new HashMap<>();

        int[][] vals = new int[][] {
            {11, 11},   // A
            {4, 4},     // K
            {3, 3},     // Q
            {20, 2},    // J
            {10, 10},   // T
            {14, 0},    // 9
            {0, 0},     // 8
            {0, 0}      // 7
        };

        char[] cards = new char[] {'A', 'K', 'Q', 'J', 'T', '9', '8', '7'};
        for (int i = 0; i < cards.length; i++)
            cardMap.put(Character.valueOf(cards[i]), i);

        pointIndex.put(Character.valueOf('S'), 1);
        pointIndex.put(Character.valueOf('H'), 1);
        pointIndex.put(Character.valueOf('D'), 1);
        pointIndex.put(Character.valueOf('C'), 1);

        char[] c = sc.nextLine().toCharArray();
        pointIndex.replace(Character.valueOf(c[c.length-1]), 0);

        int sum = 0;
        while(sc.hasNextLine()) {
            char[] in = sc.nextLine().toCharArray();
            int sumBuffer = vals
                    [cardMap.get(Character.valueOf(in[0]))]
                    [pointIndex.get(Character.valueOf(in[1]))];

            sum += sumBuffer;
        }
        System.out.println(sum);


       
    }
}