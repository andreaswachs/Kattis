import java.util.Scanner;
import java.util.HashMap;
import java.util.HashSet;

public class Everywhere {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        HashMap<Integer, HashSet<String>> places = new HashMap<>();

        int cursor = -1;
        sc.nextLine();
        while(sc.hasNextLine()) {
            String in = sc.nextLine();
            if (isNumeric(in)) {
                cursor++;
            } else {
                if (!places.containsKey(cursor)) {
                    places.put(cursor, new HashSet<String>());
                }
                places.get(cursor).add(in);
            }
        }
        sc.close();

        places.entrySet()
            .stream()
            .forEach(s -> System.out.println(s.getValue().size()));

    }

    public static boolean isNumeric(String strNum) {
	    if (strNum == null) {
	        return false;
	    }
	    try {
	        double d = Double.parseDouble(strNum);
	    } catch (NumberFormatException nfe) {
	        return false;
	    }
	    return true;
	}
}