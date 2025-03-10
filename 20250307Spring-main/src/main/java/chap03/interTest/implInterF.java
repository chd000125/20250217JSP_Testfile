package chap03.interTest;

public class implInterF implements interF {

	@Override
	public void method() {
		System.out.println("하이");
	}

	@Override
	public void method2(int x, String y) {
		System.out.println(x+","+y);
	}

}
