<%-- 
    Document   : index
    Created on : Nov 6, 2026, 12:47:28 PM
    Author     : Administrator
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Proteger la página: si no hay sesión, redirigir al login
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
    if (usuarioLogueado == null || usuarioLogueado.getRol() != 4) {
        response.sendRedirect(request.getContextPath()+"/index.jsp?error=acceso");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Información Académica SIA | Dashboard Funcionario</title>
    </head>
    <body>
         Bienvenido, Funcionario: <%= usuarioLogueado.getNombre() %>
          <a  href="<%= request.getContextPath() %>/LogoutServlet">Cerrar Sesión</a>
    </body>
</html>
