/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package web;

import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.sqlite.SQLiteConfig;

/**
 *
 * @author user
 */
public class DatabaseListener implements ServletContextListener {

    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:iRotas.db";
    public static Exception exception = null;

    public static Connection getConnection() throws Exception {
        Class.forName(CLASS_NAME);
        Connection connection = null;
        SQLiteConfig config = new SQLiteConfig();
        config.enforceForeignKeys(true);
        connection = DriverManager.getConnection(URL, config.toProperties());
        return connection;

    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute("DROP TABLE users");
            stmt.execute("CREATE TABLE IF NOT EXISTS users("
                    + "cd_user INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "ic_client_yes_no_user INTEGER NOT NULL,"
                    + "ic_collaborator_yes_no_user INTEGER NOT NULL,"
                    + "nm_user VARCHAR NOT NULL,"
                    + "nm_email_user VARCHAR NOT NULL,"
                    + "cd_password_user VARCHAR NOT NULL,"
                    + "cd_phone_number_user VARCHAR NOT NULL,"
                    + "dt_birthdate_user VARCHAR NOT NULL,"
                    + "ic_sex_male_female_user VARCHAR NOT NULL,"
                    + "im_curriculum_user BLOB)");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(1, 1, 0, 'Fulano', 'fulano@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19) 9999-9999', '2000-01-01', 'M', NULL)");

            stmt.execute("CREATE TABLE IF NOT EXISTS drivingSchools("
                    + "cd_drivingSchool INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "nm_drivingSchool VARCHAR NOT NULL,"
                    + "ds_drivingSchool VARCHAR NOT NULL,"
                    + "nm_address_drivingSchool VARCHAR NOT NULL,"
                    + "nm_city_drivingSchool VARCHAR NOT NULL,"
                    + "nm_neighbordhood_drivingSchool VARCHAR NOT NULL,"
                    + "cd_cep_drivingSchool INTEGER NOT NULL,"
                    + "im_photo_drivingSchool BLOB NOT NULL,"
                    + "cd_phone_number_drivingSchool VARCHAR NOT NULL,"
                    + "nm_email_drivingSchool VARCHAR NOT NULL,"
                    + "cd_service_drivingschool INTEGER,"
                    + "cd_opportunities_drivingschool INTEGER"
                    + "vl_rating_drivingSchool INTEGER NOT NULL,"
                    + "FOREIGN KEY (cd_service_drivingschool) REFERENCES services (cd_service),"
                    + "FOREIGN KEY (cd_opportunities_drivingschool) REFERENCES opportunities (cd_opportunities))");

            stmt.execute("CREATE TABLE IF NOT EXISTS services("
                    + "cd_services INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "ds_services VARCHAR NOT NULL,"
                    + "hr_start_services VARCHAR NOT NULL,"
                    + "hr_end_services VARCHAR NOT NULL,"
                    + "vl_services VARCHAR NOT NULL,"
                    + "ic_class_theoretical_practical_services INTEGER NOT NULL)");

            stmt.execute("CREATE TABLE IF NOT EXISTS opportunities("
                    + "cd_opportunities INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "nm_role_opportunities VARCHAR NOT NULL,"
                    + "ds_opportunities VARCHAR NOT NULL,"
                    + "vl_salary_opportunities REAL NOT NULL,"
                    + "hr_shift_start_opportunities VARCHAR NOT NULL,"
                    + "hr_shift_end_opportunities VARCHAR NOT NULL)");

            stmt.execute("CREATE TABLE IF NOT EXISTS candidates("
                    + "cd_candidates INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "cd_user_candidates INTEGER NOT NULL,"
                    + "cd_opportunities_candidates INTEGER NOT NULL,"
                    + "FOREIGN KEY (cd_user_candidates) REFERENCES users (cd_user),"
                    + "FOREIGN KEY (cd_opportunities_candidates) REFERENCES opportunities (cd_opportunities))");
            stmt.execute("PRAGMA foreign_keys = ON");

        } catch (Exception ex) {
            exception = ex;
        }
    }
}
