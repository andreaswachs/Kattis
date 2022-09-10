import java.util.Scanner;
import java.util.Map;
import java.util.LinkedHashMap;

public class DiceCup {

    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int n = 0, m = 0, c = 0;

        while(c != 2)
        {
            if (c == 0)
                n = sc.nextInt();
            else
                m = sc.nextInt();
            c++;
        }
        sc.close();

        Map<Integer, Double> propabilitiesMap = new LinkedHashMap<>();

        int sum = n + m;
        for (int i = 1; i <= sum; i++) 
            propabilitiesMap.put(i, 0.0);

        double largestProp = 0.0;
        // Fill the table with probabilities
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                sum = i + j;
                //propsBySum[i+j] += propability;
                double propBuffer = propabilitiesMap.get(sum) + 1 / (double) (n * m);
                propabilitiesMap.replace(sum, propBuffer);
                if (propBuffer > largestProp)
                    largestProp = propBuffer;
            }
        }
        final double finalProp = largestProp;
        propabilitiesMap.entrySet()
            .stream()
            .filter(x -> x.getValue() >= finalProp)
            .sorted(Map.Entry.comparingByKey())
            .forEachOrdered(x -> System.out.println(x.getKey()));
    }
}