<%-- 
    Document   : ModificarProfesor
    Created on : 25-nov-2014, 9:38:05
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nombre = request.getParameter("nombre");
    String ced = request.getParameter("identificacion");
    String apellido = request.getParameter("apellido");
%>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Socio</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../css/logo-nav.css" rel="stylesheet" type="text/css" />
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="signin.css" rel="stylesheet">
    </head>

    <body>

        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Modificar Socio</h1>
                    <div class="account-wall">
                        <br>
                        <form name="formulario" class="form-signin" action="ModificarSocioServlet" method="post" >
                            
                            <input type="hidden" value="<%=ced%>" id="id">
                            
                            <input type="text" class="form-control" value="<%=nombre%>" placeholder="Nombre" name="nombre" id="nombre" required>
                            <br>
                            <input type="text" class="form-control" value="<%=apellido%>" placeholder="Apellido" name="apellido" id="apellido" required>
                            <br> 
                            
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Modificar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/Validaciones.js"></script>
    </body>
</html>
