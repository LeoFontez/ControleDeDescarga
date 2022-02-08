<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.ConexaoDAO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.FornecedorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.FornecedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    FornecedorDAO fornDAO = new FornecedorDAO();
    ArrayList<FornecedorDTO> Lista = fornDAO.Listar();
%>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/mouseicon.ico" type="image/x-icon">
        <title>Status</title>
    </head>
    <body style="overflow: hidden;">
        <header>
            <img src="img/CyberSolutions_header.png">
            <nav>
                <ul>
                    <li><a href="fornecedor.html">Cadastro Fornecedor</a></li>
                    <li><a href="cadastroDoca.jsp">Cadastro Doca</a></li>
                    <li><a href="cobranca.jsp">Cobrança</a></li>
                    <li><a href="conferente.jsp">Conferência</a></li>|  
                    <li><a href="index.html">Sair</a></li>
                </ul>
            </nav>
        </header>
        <main style="height: 70%;" class="text-center" id="mainLogin">
            <div class="mc">
                <h1 style="text-align: center;">status</h1>
                <div class="muc">
                    <table style="margin-bottom: 0;" cellspacing="0" cellpadding="1" width="300" border="1" id="tabelaLiberacao">
                        <th id="thForn">Fornecedor</th>
                        <th>Senha</th>
                        <th>Doca</th>
                            <%             
                            for (FornecedorDTO item : Lista) {
                            %>
                        <tr>
                            <td><%= item.getFornecedor()%></td>
                            <td id="iSen" ><%= item.getSenha()%></td>
                            <td><%= item.getDoca()%></td>
                        </tr>
                        <%
                         }
                        %>
                    </table>
                </div>
                <div style="margin-top: 40px;" class="statuses">
                    <%
                        String cor1 = "background: #10de09";
                        String cor2 = "background: #10de09";
                        String cor3 = "background: #10de09";
                        String cor4 = "background: #10de09";
                        String cor5 = "background: #10de09";
                        String cor6 = "background: #10de09";
                        String cor7 = "background: #10de09";
                        String cor8 = "background: #10de09";

                        int doca1 = 1;
                        int doca2 = 2;
                        int doca3 = 3;
                        int doca4 = 4;
                        int doca5 = 5;
                        int doca6 = 6;
                        int doca7 = 7;
                        int doca8 = 8;
                        
                        int resultTotal1;
                        int resultTotal2;
                        int resultTotal3;
                        int resultTotal4;
                        int resultTotal5;
                        int resultTotal6;
                        int resultTotal7;
                        int resultTotal8;
                        
                        int result1;
                        int result2;
                        int result3;
                        int result4;
                        int result5;
                        int result6;
                        int result7;
                        int result8;

                        try {
                            
                            resultTotal1 = fornDAO.statusDocaYellow(doca1);
                            result1 = fornDAO.statusDoca(doca1);
                            
                            if (result1 == 1) {
                                cor1 = "background: #f01313";
                            }if(resultTotal1 > 0){
                                cor1 = "background: #FFFF00";
                            }
                            
                            resultTotal2 = fornDAO.statusDocaYellow(doca2);
                            result2 = fornDAO.statusDoca(doca2);
                            if (result2 == 2) {
                                cor2 = "background: #f01313";
                            }if(resultTotal2 > 0){
                                cor2 = "background: #FFFF00";
                            }
                            resultTotal3 = fornDAO.statusDocaYellow(doca3);
                            result3 = fornDAO.statusDoca(doca3);
                            if (result3 == 3) {
                                cor3 = "background: #f01313";
                            }if(resultTotal3 > 0){
                                cor3 = "background: #FFFF00";
                            }
                            
                            resultTotal4 = fornDAO.statusDocaYellow(doca4);
                            result4 = fornDAO.statusDoca(doca4);
                            if (result4 == 4) {
                                cor4 = "background: #f01313";
                            }if(resultTotal4 > 0){
                                cor4 = "background: #FFFF00";
                            }
                            
                            resultTotal5 = fornDAO.statusDocaYellow(doca5);
                            result5 = fornDAO.statusDoca(doca5);
                            if (result5 == 5) {
                                cor5 = "background: #f01313";
                            }if(resultTotal5 > 0){
                                cor5 = "background: #FFFF00";
                            }
                            
                            resultTotal6 = fornDAO.statusDocaYellow(doca6);
                            result6 = fornDAO.statusDoca(doca6);
                            if (result6 == 6) {
                                cor6 = "background: #f01313";
                            }if(resultTotal6 > 0){
                                cor6 = "background: #FFFF00";
                            }
                            
                            resultTotal7 = fornDAO.statusDocaYellow(doca7);
                            result7 = fornDAO.statusDoca(doca7);
                            if (result7 == 7) {
                                cor7 = "background: #f01313";
                            }if(resultTotal7 > 0){
                                cor7 = "background: #FFFF00";
                            }
                            
                            resultTotal8 = fornDAO.statusDocaYellow(doca8);
                            result8 = fornDAO.statusDoca(doca8);
                            if (result8 == 8) {
                                cor8 = "background: #f01313";
                            }if(resultTotal8 > 0){
                                cor8 = "background: #FFFF00";
                            }

                        } catch (SQLException erro) {
                        }
                    %>
                    <input type="submit" value="Doca 1" name="Doca1" id="Doca1" style=" <%=cor1%> ">
                    <input type="submit" value="Doca 2" name="Doca2" id="Doca2" style=" <%=cor2%> ">
                    <input type="submit" value="Doca 3" name="Doca3" id="Doca3" style=" <%=cor3%> ">
                    <input type="submit" value="Doca 4" name="Doca4" id="Doca4" style=" <%=cor4%> ">
                    <input type="submit" value="Doca 5" name="Doca5" id="Doca5" style=" <%=cor5%> ">
                    <input type="submit" value="Doca 6" name="Doca6" id="Doca6" style=" <%=cor6%> ">
                    <input type="submit" value="Doca 7" name="Doca7" id="Doca7" style=" <%=cor7%> ">
                    <input type="submit" value="Doca 8" name="Doca8" id="Doca8" style=" <%=cor8%> ">
                </div>
            </div>
            <div class="mc">
            </div>
        </main>
        <footer>
            <span>© 2021 Cyber Solutions | Um produto Cyber Solutions Ltda CNPJ: 12.345.678/9101-12.</span>
        </footer>
    </body>
