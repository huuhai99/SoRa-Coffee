package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    static Connection connection = null;
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnpm_03?useUnicode=true&characterEncoding=utf-8", "root", "");
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            return connection;
        }
    }
}
