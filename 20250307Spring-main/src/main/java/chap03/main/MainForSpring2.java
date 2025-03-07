package chap03.main;

import java.io.IOException;
import java.time.LocalDateTime;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import chap03.config.AppCtx;
import chap03.spring.Member;
import chap03.spring.MemberDao;

public class MainForSpring2 {

	private static ApplicationContext ctx = null;
	
	public static void main(String[] args) throws IOException {
		ctx = new AnnotationConfigApplicationContext(AppCtx.class);
		MemberDao memberDao = ctx.getBean(MemberDao.class);
		Member member = new Member("kim@gmail.com,","1234","HONG", LocalDateTime.now());
		memberDao.insert(member);
		System.out.println("입력 성공!");
		
	}
}