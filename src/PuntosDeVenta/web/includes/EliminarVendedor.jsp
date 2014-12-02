<%-- 
    Document   : EliminarInstitucion
    Created on : 19-jun-2014, 9:15:33
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Vendedor</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
         <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <br><br>
                    <h1 class="text-center login-title">Eliminar Vendedor</h1>
                        <div class="account-wall">
                                <br>
                                <form name="eliminar" class="form-signin" action="EliminarVendedorServlet" method="post">
                                    <input type="text" class="form-control" placeholder="Identificación del Vendedor" name="id" id="id" required>
                                     <br>  
                                  <button class="btn btn-lg btn-primary btn-block" type="submit">
                                     Eliminar Vendedor</button>
                               </form>
                             </div>
                    </div>
                </div>
            </div>
    </body>
</html>
