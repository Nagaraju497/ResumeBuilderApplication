package DatabaseDemo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBase {
	
    private static final String URL = "jdbc:mysql://localhost:3306/resumeBuilder";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        // ✅ Always return a new connection, do not reuse static one
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
