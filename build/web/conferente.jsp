<%-- 
    Document   : conferente
    Created on : 28/11/2021, 20:11:45
    Author     : Felipe_Araujo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.FornecedorDTO"%>
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
    <title>Conferência</title>
</head>
<body style="overflow-x: hidden;">
    <header>
        <img src="img/CyberSolutions_header.png">
        <nav>
            <ul>
                <li><a href="status.jsp">status</a></li>
                <li><a href="fornecedor.html">Cadastro Fornecedor</a></li>
                <li><a href="cadastroDoca.jsp">Cadastro Doca</a></li>
                <li><a href="cobranca.jsp">Cobrança</a></li>
                <li><a href="conferente.jsp">Conferência</a></li>|
                <li><a href="index.html">Sair</a></li>
            </ul>
        </nav>
    </header>
    <main style="height: 85%;" id="mainLogin">
        <div style="width: 100%;" class="mc">
            <%
                try {

                    int senhas = Integer.parseInt(request.getParameter("isenhaConferir"));
                    FornecedorDAO objFornDAO = new FornecedorDAO();
                    FornecedorDTO objFornDTO = new FornecedorDTO();
                    objFornDAO.deletarFornecedor(objFornDTO, senhas);
                    response.sendRedirect("status.jsp");
                } catch (Exception e) {
                }
            %>
            <form  action="conferente.jsp" method="POST">
                <h1 style="text-align: center;">Conferência</h1>      
                <div class="muc">     
                    <table style="margin: auto;" border="1" id="tabelaConf">
                        <th style="width: 14%;" id="thSenha">Senha</th>
                        <th style="width: 14%;">Fornecedor</th>
                        <th style="width: 14%;" id="thDoca">Doca</th>
                        <th style="width: 14%;">Carga Paletizada</th>
                        <th style="width: 14%;">Paletização</th>
                        <th style="width: 14%;">Aplicação de Stretch</th>
                        <th style="width: 14%;">Total</th>
                            <%
                                for (FornecedorDTO item : Lista) {
                            %>
                        <tr>
                            <td id="tdConf" ><%= item.getSenha()%></td>
                            <td id="tdConf"><%= item.getFornecedor()%></td>
                            <td id="tdConf"><%= item.getDoca()%></td>
                            <td id="tdConf"><%= item.getCarga_paletizada()%></td>
                            <td id="tdConf"><%= item.getPaletizacao()%></td>
                            <td id="tdConf"><%= item.getAplicacao()%></td>
                            <td id="tdConf"><%= item.getTotal()%></td>
                            <% }%>
                        </tr>
                    </table>
                </div>
                <div style="margin-top: 20px;">

                    <h2 style="text-align: center; color: black; margin: 0 0 0 0;">Liberar Motorista</h2>
                    <label>Senha: </label>
                    <input class="inputG" type="text" name="isenhaConferir" id="isenhaConferir" autoComplete="off">
                    <input class="inputG" type="submit" value="Confirmar" name="ConfirmarConfere" id="submitenviar">           
                </div>
            </form>     
        </div> 
    </main>
    <footer >
        <span>© 2021 Cyber Solutions | Um produto Cyber Solutions Ltda CNPJ: 12.345.678/9101-12.</span>
    </footer>
</body>          