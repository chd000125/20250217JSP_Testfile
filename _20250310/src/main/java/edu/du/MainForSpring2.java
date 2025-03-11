package edu.du;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.LocalDateTime;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import edu.du.dao.MemberDao;
import edu.du.entity.Member;

public class MainForSpring2 {

	private static ApplicationContext ctx = null;
	
	public static void main(String[] args) throws IOException {
		ctx = new AnnotationConfigApplicationContext(edu.du.config.DatabaseConfig.class);
		MemberDao memberDao = ctx.getBean(MemberDao.class);
//		Member member = new Member("hong@korea.com", "1234", "홍길동", LocalDateTime.now());
//		memberDao.insert(member);
//		System.out.println("입력 성공!");
		for (Member member : memberDao.selectAll()) {
			System.out.println(member);
		}
		
	}

	
}