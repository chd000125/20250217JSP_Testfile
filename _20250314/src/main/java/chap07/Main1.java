package chap07;

import chap07.ImpeCalculator;
import chap07.RecCalculator;

public class Main1 {

	public static void main(String[] args) {
		ImpeCalculator a1 = new ImpeCalculator();
		System.out.println(a1.factorial(5));
		
		RecCalculator a2 = new RecCalculator();
		System.out.println(a2.factorial(5));
	
	}

}