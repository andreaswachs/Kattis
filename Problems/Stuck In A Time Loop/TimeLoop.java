import java.util.Scanner;

public class TimeLoop
{
  public static void main(String[] args)
  {
    Scanner sc = new Scanner(System.in);
    while (sc.hasNextLong()) 
    {
      int n = sc.nextInt();
    
      if ((1 <= n) && (n <= 100))
      {
        for(int i = 1; i <= n; i++)
        {
          System.out.println(i + " Abracadabra");
        }
      }
    }
  }
}
