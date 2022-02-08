<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FornecedorDAO"%>
<%@page import="DTO.FornecedorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    FornecedorDAO fornDAO = new FornecedorDAO();
    ArrayList<FornecedorDTO> Lista = fornDAO.Listar();
%>
<head>
    <title>Cadastro Doca</title>
    <link rel="stylesheet" type="text/css" href="style.css">  
    <link rel="shortcut icon" href="img/mouseicon.ico" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="overflow: auto; margin-bottom: 0">
    <header>
        <img src="img/CyberSolutions_header.png">
        <nav>
            <ul>
                <li><a href="status.jsp">status</a></li>
                <li><a href="fornecedor.html">Cadastro Fornecedor</a></li>
                <li><a href="cobranca.jsp">Cobrança</a></li>
                <li><a href="conferente.jsp">Conferência</a></li>|  
                <li><a href="index.html">Sair</a></li>
            </ul>
        </nav>
    </header>
    <main style=" height: 87% ;  margin-bottom: 0" id="mainLogin">
        <div class="mc">
            <form action="cadastroDoca.jsp" method="POST">
                <h1 style="text-align: center; margin-bottom: auto; text-transform: none;">CADASTRO DOCA</h1>
                <div class="muc">
                    <table style="margin-bottom: auto" width="50%" border="1" id="tabelaLiberacao">
                        <th id="thForn">Fornecedor</th>
                        <th>Senha</th>
                        <th>Doca</th>
                            <%                            for (FornecedorDTO item : Lista) {
                            %>
                        <tr>
                            <td><%= item.getFornecedor()%></td>
                            <td><%= item.getSenha()%></td>
                            <td><%= item.getDoca()%></td>
                        </tr>
                        <%
                         }
                        %>
                    </table>
                </div>
                <%
                    try {

                        int senha = Integer.parseInt(request.getParameter("iSenha"));
                        int doca = Integer.parseInt(request.getParameter("iDoca"));

                        FornecedorDAO objFornDAO = new FornecedorDAO();
                        FornecedorDTO objFornDTO = new FornecedorDTO();

                        objFornDAO.updateDoca(objFornDTO, senha, doca);
                        response.sendRedirect("status.jsp");
                    } catch (Exception e) {
                    }
                %>
                <div style="margin-top: 20px;">
                    <label id="lDigitarSenha">Senha:</label>
                    <input class="inputG" type="text" name="iSenha" id="iSenha" autoComplete="off"> <br>
                    <label  id="lDigitarSenha">Doca:</label>
                    <input class="inputG" type="text" name="iDoca" id="iDoca" autoComplete="off">
                    <input class="inputG" type="submit" value="Confirmar" name="Confirmar" id="submitenviar"> 
                </div>
            </form>       
        </div>
    </main>
    <footer>
        <span>© 2021 Cyber Solutions | Um produto Cyber Solutions Ltda CNPJ: 12.345.678/9101-12.</span>
    </footer>
</body>

