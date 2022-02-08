package DAO;

import DTO.FornecedorDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FornecedorDAO {
    static String corzinha= null;
   
    Connection conn;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<FornecedorDTO> lista = new ArrayList<>();

    public void CadastraCliente(FornecedorDTO objFornecedorDTO) throws ClassNotFoundException {

        String sql = "insert into fornecedores (nome_motorista,transportadora,fornecedor,placa) values (?,?,?,?)";
        conn = new ConexaoDAO().conexaoBD();

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, objFornecedorDTO.getNome_motorista());
            pstm.setString(2, objFornecedorDTO.getTransportadora());
            pstm.setString(3, objFornecedorDTO.getFornecedor());
            pstm.setString(4, objFornecedorDTO.getPlaca());

            pstm.execute();

        } catch (SQLException e) {

        }

    }

    public ArrayList<FornecedorDTO> Listar() throws ClassNotFoundException {

        List<FornecedorDTO> Fornecedor = new ArrayList<>();
        conn = new ConexaoDAO().conexaoBD();

        try {
            pstm = conn.prepareStatement("select * from fornecedores;");
            rs = pstm.executeQuery();

            while (rs.next()) {

                FornecedorDTO fornDTO = new FornecedorDTO();

                fornDTO.setSenha(rs.getInt("senha"));
                fornDTO.setFornecedor(rs.getString("fornecedor"));
                fornDTO.setDoca(rs.getInt("doca"));
                fornDTO.setCarga_paletizada(rs.getInt("carga_paletizada"));
                fornDTO.setPaletizacao(rs.getInt("paletizacao"));
                fornDTO.setAplicacao(rs.getInt("aplicacao"));
                fornDTO.setTotal(rs.getDouble("total"));
                lista.add(fornDTO);

            }

        } catch (SQLException ex) {

        }
        return lista;

    }

    public ArrayList<FornecedorDTO> ListarDoca() throws ClassNotFoundException {

        List<FornecedorDTO> Fornecedor = new ArrayList<>();
        conn = new ConexaoDAO().conexaoBD();

        try {
            pstm = conn.prepareStatement("select * from fornecedores;");
            rs = pstm.executeQuery();

            while (rs.next()) {

                FornecedorDTO fornDTO = new FornecedorDTO();

                fornDTO.setSenha(rs.getInt("senha"));
                fornDTO.setDoca(rs.getInt("doca"));

                lista.add(fornDTO);

            }

        } catch (SQLException ex) {

        }
        return lista;

    }

    public int statusDoca(int doca) throws SQLException, ClassNotFoundException {

        ConexaoDAO conexao = new ConexaoDAO();
        int result =0;
       
        
        try {
            
        String sql = "SELECT doca FROM fornecedores WHERE doca = "+"'"+doca+"'";
        conn = conexao.conexaoBD();

        Statement s = conn.createStatement();
        rs = s.executeQuery(sql);

        rs.next();
        
        
        result = rs.getInt("doca");

        } catch (ClassNotFoundException | SQLException e) {
             return result;
        }
       return result;

    }
    
        public int statusDocaYellow(int doca) throws SQLException, ClassNotFoundException {

        ConexaoDAO conexao = new ConexaoDAO();
        int result =0;
                
        try {

        String sql = "SELECT total FROM fornecedores WHERE doca = "+"'"+doca+"'";
        conn = conexao.conexaoBD();

        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);

        rs.next();
        
        
        result = (int) rs.getDouble("total");

        } catch (ClassNotFoundException | SQLException e) {
             return result;
        }
       return result;

    }
    
    

    public ArrayList<FornecedorDTO> ListarServico() throws ClassNotFoundException {

        List<FornecedorDTO> Fornecedor = new ArrayList<>();
        conn = new ConexaoDAO().conexaoBD();

        try {
            pstm = conn.prepareStatement("select * from fornecedores;");
            rs = pstm.executeQuery();

            while (rs.next()) {

                FornecedorDTO fornDTO = new FornecedorDTO();

                fornDTO.setSenha(rs.getInt("senha"));
                fornDTO.setFornecedor(rs.getString("fornecedor"));
                fornDTO.setDoca(rs.getInt("doca"));
                fornDTO.setTotal(rs.getDouble("total"));

                lista.add(fornDTO);

            }

        } catch (SQLException ex) {

        }
        return lista;

    }

    public void updateDoca(FornecedorDTO fornecedordto, Integer senha, Integer doca) throws ClassNotFoundException {

        String sql = "update fornecedores set doca = ? where senha = ?";
        conn = new ConexaoDAO().conexaoBD();
        try {

            pstm = conn.prepareStatement(sql);

            pstm.setInt(1, doca);
            pstm.setInt(2, senha);

            pstm.execute();

        } catch (SQLException erro) {

        }
    }

    public void updateServico(FornecedorDTO fornecedordto, Integer senha, Integer cargaPaletizada, Integer paletizacao, Integer aplicacao, Double total) throws ClassNotFoundException {

        String sql = "update fornecedores set carga_paletizada = ?, paletizacao = ?, aplicacao = ?, total = ? where senha = ?";
        conn = new ConexaoDAO().conexaoBD();
        try {

            pstm = conn.prepareStatement(sql);

            pstm.setInt(1, cargaPaletizada);
            pstm.setInt(2, paletizacao);
            pstm.setInt(3, aplicacao);
            pstm.setDouble(4, total);
            pstm.setInt(5, senha);

            pstm.execute();

        } catch (SQLException erro) {

        }
    }

    public void deletarFornecedor(FornecedorDTO fornecedordto, Integer senha) throws ClassNotFoundException {

        String sql = "delete from fornecedores where senha = ?";
        conn = new ConexaoDAO().conexaoBD();
        try {

            pstm = conn.prepareStatement(sql);

            pstm.setInt(1, senha);

            pstm.execute();

        } catch (SQLException erro) {

        }

    }

}
