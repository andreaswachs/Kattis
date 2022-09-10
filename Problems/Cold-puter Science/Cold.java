import java.util.Scanner;

public class Cold
{
  public static void main(String[] args)
  {
    Scanner sc = new Scanner(System.in);

    int n = 0;
    int daysBelowZero = 0;
    while(sc.hasNextInt())
    {
      int input = sc.nextInt();

      // If n is zero, then this is the first scanned value
      if (n == 0)
      {
        n = input;
      }
        // else this is one of the theemperatures
      else
      {
        if (input < 0)
          daysBelowZero++;
      }
    }
    
    System.out.println(daysBelowZero);

  }
}
