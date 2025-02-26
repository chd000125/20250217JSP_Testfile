package util;

import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/jspBoard";
        String user = "root";
        String password = "1234";
        return DriverManager.getConnection(url, user, password);
    }
} 