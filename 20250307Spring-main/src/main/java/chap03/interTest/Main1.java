package chap03.interTest;

public class Main1 {
	public static void main(String[] args) {

//		interF i1 = new interF() {
//
//			// 빈 함수에 재정의를 해주면
//			@Override
//			public void method() {
//				System.out.println("method1");
//			}
//		};
//		// 사용가능.
//		i1.method();
//		
//		interF i1 = () -> {System.out.println("method2");};
//		
//		i1.method();
//		
		interF i2 = (x, y) -> {return x+","+s;};
		System.out.println(i2.method2(100,"홍길동"));
		
	}
	
}
