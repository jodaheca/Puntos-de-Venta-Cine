<%-- 
    Document   : index
    Created on : 1/12/2014, 05:33:19 PM
    Author     : Joaquin David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <center><img style="margin-top: 0px; position: relative;" src="images/banner.jpg"/></center>
        <link rel="shortcut icon" href="../../assets/ico/favicon.ico" />
        <title>Información Personal</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/logo-nav.css" rel="stylesheet" type="text/css" />
        <% String ms = (String) request.getAttribute("mensaje");
        %> 


    </head>
    <body style="margin-top: 0px; height: 100%; ">

        <div class="container">

            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Login</h1>
                    <div class="account-wall">
                        <br>
                            <%
                                if (ms != null) {
                            %>
                            <p> <%=ms%></p>
                            <%
                                }
                            %>
                            <form class="form-signin" action="LoginServlet" method="POST">
                                <input type="text" class="form-control" placeholder="Usuario" name="usuario" id="usuario" value="" required autofocus>
                                    <br>
                                        <input type="password" class="form-control" placeholder="Contraseña" name="contrasena" id="contrasena" value=""  required>
                                            <br>
                                                <button class="btn btn-lg btn-primary btn-block" type="submit">
                                                    Enviar</button>
                                                </form>
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                                </body>

                                                <!--<div style=" width: 900px; margin: auto; "><img style=" position: absolute; height: 100px; bottom: 0; " src="images/footer.jpg"/></div>-->
                                                </html>

