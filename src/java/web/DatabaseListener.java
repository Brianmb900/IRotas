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
            //stmt.execute("DROP TABLE users");
            stmt.execute("CREATE TABLE IF NOT EXISTS users("
                    + "cd_user INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "ic_administrator_yes_no_user NOT NULL,"
                    + "nm_user VARCHAR NOT NULL,"
                    + "nm_last_user VARCHAR NOT NULL,"
                    + "nm_email_user VARCHAR NOT NULL,"
                    + "cd_password_user VARCHAR NOT NULL,"
                    + "cd_phone_number_user VARCHAR NOT NULL,"
                    + "dt_birthdate_user VARCHAR NOT NULL,"
                    + "ic_sex_male_female_user VARCHAR NOT NULL)");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(1, 1, 'Fulano', 'do Silvo', 'fulano@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-9999', '2000-01-01', 'M')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(2, 0, 'Fulana', 'da Silva', 'fulana@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-3333', '1999-10-21', 'F')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(3, 1, 'Fulano', 'do Silvo', 'fulano@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-9999', '2000-01-01', 'M')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(4, 0, 'Fulana', 'da Silva', 'fulana@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-3333', '1999-10-21', 'F')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(5, 1, 'Fulano', 'do Silvo', 'fulano@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-9999', '2000-01-01', 'M')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(6, 0, 'Fulana', 'da Silva', 'fulana@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-3333', '1999-10-21', 'F')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(7, 1, 'Brian', 'Bianchini', 'brian@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-9999', '2000-01-01', 'M')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(8, 0, 'Alex', 'Alves', 'alex@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-3333', '1999-10-21', 'F')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(9, 1, 'Erik', 'Faria', 'erik@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-9999', '2000-01-01', 'M')");
            stmt.execute("INSERT OR IGNORE INTO users VALUES(10, 0, 'Luan', 'Alejandro', 'luan@gmail.com', '21232f297a57a5a743894a0e4a801fc3','(19)99999-3333', '1999-10-21', 'F')");

            stmt.execute("DROP TABLE services");
            stmt.execute("CREATE TABLE IF NOT EXISTS services("
                    + "cd_service INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "cd_drivingschool_service INTEGER,"
                    + "ds_service VARCHAR NOT NULL,"
                    + "hr_start_service VARCHAR NOT NULL,"
                    + "hr_end_service VARCHAR NOT NULL,"
                    + "vl_service REAL NOT NULL,"
                    + "ic_class_theoretical_practical_service INTEGER NOT NULL,"
                    + "FOREIGN KEY (cd_drivingschool_service) REFERENCES drivingSchools (cd_drivingSchool))");
            stmt.execute("INSERT OR IGNORE INTO services VALUES(1, 2, 'Aulas Práticas para categorias A e B', '10:00', '19:00', '100.99', 1)");
            stmt.execute("INSERT OR IGNORE INTO services VALUES(2, 3, 'Aulas Práticas para categorias A e B', '10:00', '19:00', '100.99', 1)");
            stmt.execute("INSERT OR IGNORE INTO services VALUES(3, 2, 'Falou em DP? Falou em Autoescola Alex', '13:10', '22:30', '9.99', 0)");

            //stmt.execute("DROP TABLE drivingSchools");
            stmt.execute("CREATE TABLE IF NOT EXISTS drivingSchools("
                    + "cd_drivingSchool INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "nm_drivingSchool VARCHAR NOT NULL,"
                    + "ds_drivingSchool VARCHAR NOT NULL,"
                    + "nm_address_drivingSchool VARCHAR NOT NULL,"
                    + "nm_city_drivingSchool VARCHAR NOT NULL,"
                    + "nm_neighborhood_drivingSchool VARCHAR NOT NULL,"
                    + "cd_cep_drivingSchool VARCHAR NOT NULL,"
                    + "cd_phone_number_drivingSchool VARCHAR NOT NULL,"
                    + "nm_email_drivingSchool VARCHAR NOT NULL,"
                    + "cd_password_drivingSchool VARCHAR NOT NULL,"
                    + "vl_rating_drivingSchool REAL NOT NULL,"
                    + "qt_rating_drivingSchool REAL NOT NULL,"
                    + "vl_rating_final_drivingSchool REAL NOT NULL)");
            stmt.execute("INSERT OR IGNORE INTO drivingSchools VALUES(1, 'Autoescola Teste', 'Autoescola do Fulano Teste 1234567890', 'Rua 23, número 40', 'Testelândia', "
                    + "'Testezinho', '12345-060', '(19)99999-9999', 'fulanoAuto@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '5.0','2.0','2.5')");
            stmt.execute("INSERT OR IGNORE INTO drivingSchools VALUES(2, 'Autoescola Alex', 'Autoescola do Alexxxxxxx', 'Rua 23, número 40', 'São Vincente', "
                    + "'Cidade Náutica', '12345-060', '(19)99999-9999', 'alexAuto@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '8.0','2.0','4.0')");
            stmt.execute("INSERT OR IGNORE INTO drivingSchools VALUES(3, 'Autoescola Erik', 'Autoescola do Erikkkkkkkkkkkkkkk', 'Rua 23, número 40', 'Praia Grande', "
                    + "'Vila Antártica', '12345-060', '(19)99999-9999', 'erikAuto@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1.0','2.0','0.5')");
            stmt.execute("INSERT OR IGNORE INTO drivingSchools VALUES(4, 'Autoescola Luan', 'Autoescola do Luannnnnn', 'Rua 23, número 40', 'São Vincente', "
                    + "'São Vincente', '12345-060', '(19)99999-9999', 'luanAuto@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '3.0','1.0','3.0')");
            stmt.execute("INSERT OR IGNORE INTO drivingSchools VALUES(5, 'Autoescola Brian', 'Autoescola do Briannnnnnn', 'Rua 23, número 40', 'Praia Grande', "
                    + "'Boqueirão', '12345-060', '(19)99999-9999', 'brianAuto@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '3.0','2.0','1.5')");
            stmt.execute("INSERT OR IGNORE INTO drivingSchools VALUES(6, 'Autoescola Teste', 'Autoescola do Fulano Teste 1234567890', 'Rua 23, número 40', 'Testelândia', "
                    + "'Testezinho', '12345-060', '(19)99999-9999', 'fulanoAuto@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '3.0','1.0','3.0')");
            stmt.execute("INSERT OR IGNORE INTO drivingSchools VALUES(7, 'Autoescola Teste', 'Autoescola do Fulano Teste 1234567890', 'Rua 23, número 40', 'Testelândia', "
                    + "'Testezinho', '12345-060', '(19)99999-9999', 'fulanoAuto@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '3.0','1.0','3.0')");

            stmt.execute("DROP TABLE interesteds");
            stmt.execute("CREATE TABLE IF NOT EXISTS interesteds("
                    + "cd_interested INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "cd_drivingSchool_interested INTEGER NOT NULL,"
                    + "cd_user_interested INTEGER NOT NULL,"
                    + "FOREIGN KEY (cd_drivingSchool_interested) REFERENCES drivingSchools (cd_drivingSchool),"
                    + "FOREIGN KEY (cd_user_interested) REFERENCES users (cd_user))");
            stmt.execute("INSERT OR IGNORE INTO interesteds VALUES(1, 2, 7)");
            stmt.execute("INSERT OR IGNORE INTO interesteds VALUES(2, 3, 7)");

        } catch (Exception ex) {
            exception = ex;
        }
    }
}
