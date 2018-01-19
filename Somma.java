/**
 * Somma
 */
public class Somma {

  public static void main(String[] args) {
    if(args.length == 0) {
      System.out.println("Argomenti non sufficienti");
    } else {
      try {
        System.out.println(somma(args[0]));
      } catch (NumberFormatException e) {
        System.out.println("Errore nella computazione dell'input: " + e);
      }
      
    }
  }
  
  public static float somma(String myString) throws NumberFormatException {
    String[] numbers = myString.split(" ");
    float sum = 0;
    for (String current : numbers) {
      if (current.length() != 0)
        sum += Float.parseFloat(current);
    }
    return sum;
  }
  
}