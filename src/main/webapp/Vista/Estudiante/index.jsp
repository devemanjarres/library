<%-- 
    Document   : Index
    Created on : Nov 6, 2026, 12:47:12 PM
    Author     : Administrator
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Proteger la página: si no hay sesión, redirigir al login
    Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
    if (usuarioLogueado == null || usuarioLogueado.getRol() != 2) {
        response.sendRedirect(request.getContextPath()+"/index.jsp?error=acceso");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Información Académica SIA | Dashboard Estudiante</title>
    </head>
    <body>
        <h1>Bienvenido  Estudiante: <%= usuarioLogueado.getNombre() %></h1>
    </body>
</html>
