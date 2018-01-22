import java.math.BigDecimal;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;

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
		AtomicReference<BigDecimal> reference = new AtomicReference<BigDecimal>(new BigDecimal(0));
		Arrays.asList(myString.split(" ")).forEach(n -> reference.set(reference.get().add(new BigDecimal(n))));
		return reference.get();
	}

}