import java.util.Scanner;

public class SodaSlurper
{
  public static void main(String[] args)
  {
    Scanner sc = new Scanner(System.in);
    int e = 0, 
        f = 0, 
        c = 0, 
        counter = 0;

    while(sc.hasNext())
    {
      int buffer = sc.nextInt();
      if (counter == 0)
        e = buffer;
      else if (counter == 1)
        f = buffer;
      else if (counter == 2)
        c = buffer;

      counter++;
    }
    sc.close();

    int emptied = e + f;
    int drank = 0;
    while(emptied >= c)
    {
      emptied -= c;
      drank += 1;
      emptied += 1;
    }

    System.out.println(drank);

  }
}