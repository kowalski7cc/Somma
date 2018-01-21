import java.math.BigDecimal;
public class Somma {

	public static void main(String[] args) {
		if(args.length == 0) {
			System.out.println("Argomenti non sufficienti");
		} else {
			try {
				System.out.println("Result: " + somma(args[0]));
			} catch (NumberFormatException e) {
				System.out.println("Error during elaboration: " + ((e.getMessage() ==null)
						? "Invalid character in list" : e.getMessage()));
			}
		}
	}

	public static BigDecimal somma(String myString) throws NumberFormatException {
		BigDecimal bigDecimal = new BigDecimal(0);
		String[] numbers = myString.split(" ");
		for (String current : numbers) {
			if (current.length() != 0) {
				bigDecimal = bigDecimal.add(new BigDecimal(current));
			}
		}
		return bigDecimal;
	}

}