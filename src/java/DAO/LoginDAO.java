package DAO;

import DTO.LoginDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDAO {
        
        Statement st;
        ResultSet rs;
        Connection conn;
        PreparedStatement pstm;
        
    public void CadastraLogin(LoginDTO objLoginDTO) throws ClassNotFoundException{
        
        String sql = "insert into login (user_login,pass_login) values (?,?)";
        conn = new ConexaoDAO().conexaoBD();
        
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, objLoginDTO.getUser_login());
            pstm.setString(2, objLoginDTO.getPass_login());
            
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            
        }
    }
    
    public ResultSet autenticaLogin(String login, String pass) throws ClassNotFoundException, SQLException {
           
           conn = new ConexaoDAO().conexaoBD();

            LoginDTO loginDTO = new LoginDTO();
            loginDTO.setPass_login(login);
            loginDTO.setUser_login(pass);

            st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
            rs = st.executeQuery("select * from login where user_login ='"+login+"' and pass_login ='"+pass+"'");

        return rs;
    }
}
