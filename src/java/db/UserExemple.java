/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

/**
 *
 * @author Luiz Miguel
 */
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;

public class UserExemple {

    private static final String URL = "jdbc:sqlite:fatecpg.db";
    private String email;
    private String passwordMD5;
    private String name;
    private Integer id_user;

    public static String passwordMD5(String s) throws NoSuchAlgorithmException {
        MessageDigest m = MessageDigest.getInstance("MD5");
        m.update(s.getBytes(), 0, s.length());
        String passMD5 = new BigInteger(1, m.digest()).toString(16);
        return passMD5;
    }

    public static void addUser(UserExemple user) throws Exception {
        Class.forName("org.sqlite.JDBC");
        try ( Connection con = DriverManager.getConnection(URL);  PreparedStatement stmt = con.prepareStatement(""
                + "INSERT INTO users(email, password, name)"
                + "values(?,?,?)")) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, passwordMD5(user.getPasswordMD5()));
            stmt.setString(3, user.getName());
            stmt.execute();
        }
    }

    public static void deleteUser(Integer id_user) throws Exception {
        Class.forName("org.sqlite.JDBC");
        try ( Connection con = DriverManager.getConnection(URL);  PreparedStatement stmt = con.prepareStatement("DELETE FROM users WHERE id_user=?")) {
            stmt.setInt(1, id_user);
            stmt.execute();
        }
    }

    public static void changePassword(Integer id_user, String passMD5) throws Exception {
        Class.forName("org.sqlite.JDBC");
        try ( Connection con = DriverManager.getConnection(URL);  PreparedStatement stmt = con.prepareStatement("UPDATE users SET password=? WHERE id_user=?")) {
            stmt.setString(1, passwordMD5(passMD5));
            stmt.setInt(2, id_user);
            stmt.execute();
        }
    }

    public static void changeName(Integer id_user, String name) throws Exception {
        Class.forName("org.sqlite.JDBC");
        try ( Connection con = DriverManager.getConnection(URL);  PreparedStatement stmt = con.prepareStatement("UPDATE users SET name=? WHERE id_user=?")) {
            stmt.setString(1, name);
            stmt.setInt(2, id_user);
            stmt.execute();
        }
    }

    public static void changeEmail(Integer id_user, String email) throws Exception {
        Class.forName("org.sqlite.JDBC");
        try ( Connection con = DriverManager.getConnection(URL);  PreparedStatement stmt = con.prepareStatement("UPDATE users SET email=? WHERE id_user=?")) {
            stmt.setString(1, email);
            stmt.setInt(2, id_user);
            stmt.execute();
        }
    }

    public static UserExemple getUser(String email, String password, Integer id_user) throws Exception {
        UserExemple user = null;
        Class.forName("org.sqlite.JDBC");
        try ( Connection con = DriverManager.getConnection(URL);  PreparedStatement stmt = con.prepareStatement(
                "select * from users where email = ? and password = ?"
        )) {
            stmt.setString(1, email);
            stmt.setString(2, passwordMD5(password));
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new UserExemple(
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("name"),
                            rs.getInt("id_user")
                    );
                }
            }
        }
        return user;
    }

    public static ArrayList<UserExemple> getAllUsers() throws Exception {
        ArrayList<UserExemple> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        try ( Connection con = DriverManager.getConnection(URL);  Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery("select * from users order by name")) {
            while (rs.next()) {
                list.add(new UserExemple(
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getInt("id_user")
                ));
            }
        }
        return list;
    }

    public UserExemple(String email, String passwordMD5, String name, Integer id_user) {
        this.email = email;
        this.passwordMD5 = passwordMD5;
        this.name = name;
        this.id_user = id_user;
    }

    public Integer getId() {
        return id_user;
    }

    public void setId(Integer id_user) {
        this.id_user = id_user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordMD5() {
        return passwordMD5;
    }

    public void setPasswordMD5(String passwordMD5) {
        this.passwordMD5 = passwordMD5;
    }

}