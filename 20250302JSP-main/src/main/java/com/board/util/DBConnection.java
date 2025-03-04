package com.board.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3309/jsp_company",
                "root",
                "1234"
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
} 