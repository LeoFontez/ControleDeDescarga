<%@page import="java.util.ArrayList"%>
<%@page import="DTO.FornecedorDTO"%>
<%@page import="DAO.FornecedorDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


<%

    FornecedorDAO fornDAO = new FornecedorDAO();

    ArrayList<FornecedorDTO> Lista = fornDAO.Listar();

%>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">   
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="img/mouseicon.ico" type="image/x-icon">
    <title>Cobrança</title>
</head>
<body style="overflow-x: hidden; padding:auto; padding-bottom: auto;">
    <header>
        <img src="img/CyberSolutions_header.png">
        <nav>
            <ul>
                <li><a href="status.jsp">status</a></li>
                <li><a href="fornecedor.html">Cadastro Fornecedor</a></li>
                <li><a href="cadastroDoca.jsp">Cadastro Doca</a></li>
                <li><a href="conferente.jsp">Conferência</a></li>|  
                <li><a href="index.html">Sair</a></li>
            </ul>
        </nav>
    </header>
    <main style="height: auto; width: auto"  id="mainLogin">
        <div class="mc">
            <form action="cobranca.jsp" method="POST">
                <h1 style="text-align: center; margin-bottom: 20px;">Cobrança</h1>
                <div class="muc">
                    <table style="margin-bottom: 0;" width="50%" border="1" id="tabelaLiberacao">
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
                        int carga = Integer.parseInt(request.getParameter("icargaPaletizada"));
                        int paletizado = Integer.parseInt(request.getParameter("ipaletizacao"));
                        int aplicacao = Integer.parseInt(request.getParameter("istretch"));
                        double total;

                        FornecedorDAO objFornDAO = new FornecedorDAO();
                        FornecedorDTO objFornDTO = new FornecedorDTO();

                        total = (carga * 10.50) + (paletizado * 17.30) + (aplicacao * 5.00);

                        request.setAttribute("itotal", total);

                        objFornDAO.updateServico(objFornDTO, senha, carga, paletizado, aplicacao, total);
                        response.sendRedirect("status.jsp");
                    } catch (Exception e) {
                    }

                %>
                <div style="display: flex; flex-flow: row wrap; width: border-box;padding: 20px;margin-top: 20px;">
                    <label style="width: 100%;" id="cargaPaletizada">Senha: </label> <br>
                    <input class="inputG" type="text" name="iSenha" id="iSenha" autoComplete="off"> <br>

                    <label style="width:100%;" id="cargaPaletizada">Carga Paletizada: </label> <br>
                    <div style="width: 100%; flex-flow: row nowrap">
                        <input placeholder="xR$10,50" class="inputG"  type="text" name="icargaPaletizada" id="iCargaPaletizada" autoComplete="off">
                    </div>
                    <label style="width:100%;" id="paletizacao">Paletização: </label> <br>
                    <div style="width: 100%; flex-flow: row nowrap">
                        <input placeholder="xR$17,30" class="inputG" type="text" name="ipaletizacao" id="iPaletizacao" autoComplete="off">
                    </div>
                    <label style="width:100%;" id="stretch">Aplicação de Stretch: </label> <br>
                    <div style="width: 100%; flex-flow: row nowrap">
                        <input placeholder="xR$5,00" class="inputG" type="text" name="istretch" id="istretch" autoComplete="off">
                    </div>
                    <br>
                    <input style="display: none;" class="inputG" type="text" name="iTotal" id="iTotal" value="${itotal}" readonly >
                    <input  class="inputG" type="submit" value="Confirmar" name="Confirmar" id="submitenviar">
                </div>
            </form>
        </div>
    </main>
    <footer style=  "position: inherit; border-style: hidden; width: 100%;">
        <span>© 2021 Cyber Solutions | Um produto Cyber Solutions Ltda CNPJ: 12.345.678/9101-12.</span>
    </footer>
</body>   