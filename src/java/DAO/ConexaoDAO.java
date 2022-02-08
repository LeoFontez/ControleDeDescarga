package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {
    
    public Connection conexaoBD() throws ClassNotFoundException{
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/cybersolutions?user=root&password=";
            conn = DriverManager.getConnection(url);
            
            
        } catch (SQLException e) {
            
        }
        return conn;
    }
}
