<%-- 
    Document   : RegistrarPrograma
    Created on : 26-jun-2014, 9:20:47
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Registrar Socio</title>
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
                    <h1 class="text-center login-title">Registrar Socio</h1>
                        <div class="account-wall">
                                <br>
                                <form name="formulario" class="form-signin" action="IngresarSocioServlet" method="POST">
                                    <input type="text" class="form-control" placeholder="Identificación" name="id" id="id" required>
                                     <br>
                                     <input type="text" class="form-control" placeholder="Nombres" name="nombre" id="nombre" required>
                                     <br>
                                     <input type="text" class="form-control" placeholder="Apellidos" name="apellido" id="apellido" required>
                                     <br>
                                  <button class="btn btn-lg btn-primary btn-block" type="submit">
                                     Agregar Socio</button>
                               </form>
                             </div>
                    </div>
                </div>
            </div>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="js/Validaciones.js"></script>
    </body>
</html>

