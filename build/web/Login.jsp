<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Font+Name">
        <link rel="stylesheet" type="text/css" href="newcssstyle.css">
        <link rel="shortcut icon" href="img/mouseicon.ico" type="image/x-icon">
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <img src="img/CyberSolutions_header.png">
            <nav>
                <ul>
                    <li><a href="index.html">home</li></a>
                    <li><a href="sobrenos.html">sobre nós</a></li>
                </ul>
            </nav>
        </header>
        <main id="mainLogin">  
            <form action="Login.jsp" method="POST" autoComplete="off">    
                <h1 style="text-align: center;">Entrar</h1>
                <h3 style="text-align: center;">Preencha o formulário e entre em sua conta</h3>
                <label id="labelLogin">Login*</label> <br>
                <input class="inputG"type="text" name="login"> <br>
                <label id="labelSenha">Senha*</label> <br>
                <input class="inputG" type="password" name="senha"> <br>
                <input type="submit" name="Entrar" value="Entrar" id="submitenviar">
                <%
                    ResultSet rs;
                    LoginDAO loginDAO = new LoginDAO();

                    String login, pass;
                    login = request.getParameter("login");
                    pass = request.getParameter("senha");

                    rs = loginDAO.autenticaLogin(login, pass);

                    if (rs.next()) {
                        response.sendRedirect("fornecedor.html");
               } else {%>
                <div class="senhaincorreta">
                    <p >Usuário ou Senha Incorretos. Contate o suporte!</p>
                </div> <br>
                <%
                    }
                %> 
            </form>
        </main>
        <footer>
            <span>© 2021 Cyber Solutions | Um produto Cyber Solutions Ltda CNPJ: 12.345.678/9101-12.</span>
        </footer>
    </body>