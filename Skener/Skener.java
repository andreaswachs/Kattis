    import java.util.Scanner;
    import java.util.ArrayList;

    public class Skener{
        public static void main(String[] args) {
            Scanner sc = new Scanner(System.in);
            String[] input = sc.nextLine().split(" ");
            int Z_R = Integer.parseInt(input[2]); // Antal gentagelse for rows
            int Z_C= Integer.parseInt(input[3]); // Antal gentagelse for columns

            ArrayList<String> inputs = new ArrayList<>();
            while(sc.hasNextLine())
                inputs.add(sc.nextLine());

            for (String line : inputs) {
                // Konstruer hele rækken
                String lineBuffer = line;
                if (Z_C > 1) {
                    String repeatedLineBuffer = "";
                    for (char c : lineBuffer.toCharArray()) {
                        for (int i = 1; i <= Z_C; i++) {
                            repeatedLineBuffer += c;
                        }
                    }
                    lineBuffer = repeatedLineBuffer;
                }
                // Gennemløb antal gentagelser for rows
                for (int i = 1; i <= Z_R; i++) {
                    System.out.println(lineBuffer);
                }
            }
        }
    }