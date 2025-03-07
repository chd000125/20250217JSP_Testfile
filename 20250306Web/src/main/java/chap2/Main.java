package chap2;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx =
				new AnnotationConfigApplicationContext(AppContext.class);
		Greeter g = ctx.getBean("greeter",Greeter.class);
		String msg = g.greet("스프링");
		System.out.println(msg);
		ctx.close();
	}
}

//Unable to make protected final
//java.lang.Class java.lang.ClassLoader.defineClass
//(java.lang.String,byte[],int,int,java.security.ProtectionDomain)
//throws java.lang.ClassFormatError accessible: module java.base does not "opens java.lang" to unnamed module @17211155

