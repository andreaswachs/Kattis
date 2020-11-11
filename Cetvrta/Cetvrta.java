import java.util.Scanner;
import java.util.HashMap;

public class Cetvrta {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        HashMap<Integer, Integer> xCoords = new HashMap<>();
        HashMap<Integer, Integer> yCoords = new HashMap<>();

        while(sc.hasNextLine()) {    
            String[] input = sc.nextLine().split(" ");
            int x = Integer.parseInt(input[0]);            
            int y = Integer.parseInt(input[1]);
            if (xCoords.containsKey(x))
                xCoords.put(x, xCoords.get(x) + 1);
            else
                xCoords.put(x, 1);
            
            if (yCoords.containsKey(y))
                yCoords.put(y, yCoords.get(y) + 1);
            else
                yCoords.put(y, 1);
        }
        sc.close();

        xCoords.entrySet()
            .stream()
            .filter(s -> s.getValue() == 1)
            .forEach(s -> System.out.printf("%d ",s.getKey()));

        yCoords.entrySet()
            .stream()
            .filter(s -> s.getValue() == 1)
            .forEach(s -> System.out.println(s.getKey()));
    }
}