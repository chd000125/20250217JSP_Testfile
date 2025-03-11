package edu.du;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import edu.du.dao.MemberDao;
import edu.du.entity.Member;

import java.util.List;
import java.util.Scanner;

@Configuration
//@ComponentScan(basePackages = "com.example")
public class Application {
	
    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(edu.du.config.DatabaseConfig.class);
		MemberDao memberDao = context.getBean(MemberDao.class);
    	
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\n=== 사용자 관리 시스템 ===");
            System.out.println("1. 사용자 등록");
            System.out.println("2. 사용자 조회");
            System.out.println("3. 전체 사용자 조회");
            System.out.println("4. 사용자 수정");
            System.out.println("5. 사용자 삭제");
            System.out.println("6. 종료");
            System.out.print("선택하세요: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // 개행 문자 처리

            switch (choice) {
                case 1:
                    System.out.print("이름: ");
                    String name = scanner.nextLine();
                    System.out.print("이메일: ");
                    String email = scanner.nextLine();
                    System.out.print("암호: ");
                    String pass = scanner.nextLine();

                    Member newUser = new Member();
                    newUser.setName(name);;
                    newUser.setEmail(email);
                    newUser.setPassword(pass);
                    memberDao.insert(newUser);
                    System.out.println("사용자가 등록되었습니다.");
                    break;

                case 2:
                    System.out.print("조회할 사용자 이메일: ");
                    String id = scanner.nextLine();
                    Member user = memberDao.selectByEmail(id);
                    if (user != null) {
                        System.out.println("ID: " + user.getId());
                        System.out.println("이름: " + user.getName());
                        System.out.println("이메일: " + user.getEmail());
                        System.out.println("암호: " + user.getPassword());
                    } else {
                        System.out.println("해당 이메일의 사용자를 찾을 수 없습니다.");
                    }
                    break;

                case 3:
                    List<Member> users = memberDao.selectAll();
                    System.out.println("\n=== 전체 사용자 목록 ===");
                    for (Member u : users) {
                        System.out.println("ID: " + u.getId());
                        System.out.println("이름: " + u.getName());
                        System.out.println("이메일: " + u.getEmail());
                        System.out.println("나이: " + u.getPassword());
                        System.out.println("-------------------");
                    }
                    break;

                case 4:
                    System.out.print("수정할 사용자 이메일: ");
//                    Long updateId = scanner.nextLong();
                    String updateId = scanner.nextLine(); // 개행 문자 처리
                    Member updateUser = memberDao.selectByEmail(updateId);
                    if (updateUser != null) {
                        System.out.print("새 이름: ");
                        updateUser.setName(scanner.nextLine());
                        System.out.print("새 이메일: ");
                        updateUser.setEmail(scanner.nextLine());
                        System.out.print("새 암호: ");
                        updateUser.setPassword(scanner.nextLine());
                        memberDao.update(updateUser);
                        System.out.println("사용자 정보가 수정되었습니다.");
                    } else {
                        System.out.println("해당 ID의 사용자를 찾을 수 없습니다.");
                    }
                    break;

                case 5:
                    System.out.print("삭제할 사용자 ID: ");
                    Long deleteId = scanner.nextLong();
//                    userDao.delete(deleteId);
                    System.out.println("사용자가 삭제되었습니다.");
                    break;

                case 6:
                    System.out.println("프로그램을 종료합니다.");
                    context.close();
                    scanner.close();
                    return;

                default:
                    System.out.println("잘못된 선택입니다. 다시 선택해주세요.");
            }
        }
    }
} 