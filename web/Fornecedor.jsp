<%@page import="DAO.FornecedorDAO"%>
<%@page import="DTO.FornecedorDTO"%>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {

                FornecedorDTO objFornecedorDTO = new FornecedorDTO();

                objFornecedorDTO.setNome_motorista(request.getParameter("inomeMotorista"));
                objFornecedorDTO.setFornecedor(request.getParameter("iFornecedor"));
                objFornecedorDTO.setTransportadora(request.getParameter("iTransportadora"));
                objFornecedorDTO.setPlaca(request.getParameter("iPlaca"));

                FornecedorDAO objFornecedorDAO = new FornecedorDAO();
                objFornecedorDAO.CadastraCliente(objFornecedorDTO);
            } catch (Exception e) {
            }
            response.sendRedirect("status.jsp");
        %>   
    </body>

