package edu.du.sb0313.service;

import edu.du.sb0313.dao.UserDao;
import edu.du.sb0313.dto.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    private final UserDao userDao; // UserDao 의존성

    @Autowired
    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    // 사용자 추가
    public int addUser(Users user) {
        // 추가 로직이 필요하면 여기서 처리할 수 있습니다.
        return userDao.addUser(user);
    }

    // 사용자 ID로 조회
    public Users getUserById(Long id) {
        // 비즈니스 로직을 추가할 수 있습니다 (예: 권한 체크)
        return userDao.getUserById(id);
    }

    // 모든 사용자 조회
    public List<Users> getAllUsers() {
        // 모든 사용자 목록을 조회하는 로직
        return userDao.getAllUsers();
    }

    // 사용자 삭제
    public int deleteUser(Long id) {
        // 삭제 전에 권한 확인이나 다른 비즈니스 로직을 추가할 수 있습니다.
        return userDao.deleteUser(id);
    }

    // 사용자 정보 수정
    public int updateUser(Users user) {
        // 수정 전에 비즈니스 로직을 추가할 수 있습니다.
        return userDao.updateUser(user);
    }
}

