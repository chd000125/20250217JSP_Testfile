package chap07;

public class Main2 {
	public static void main(String[] args) {
		ExeTimeCalculator e1 = new ExeTimeCalculator(new ImpeCalculator());
		System.out.println(e1.factorial(5));
	}
}
