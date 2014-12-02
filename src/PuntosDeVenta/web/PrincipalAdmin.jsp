<%-- 
    Document   : PrincipalAdmin
    Created on : 1/12/2014, 06:41:50 PM
    Author     : Joaquin David
--%>

<%@page import="co.udea.fundsistemas.puntosdeventa.dao.UsuarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="co.udea.fundsistemas.puntosdeventa.dto.Persona"%>
<%    Persona persona = null;
    int identificacion = 0;
    try {
        HttpSession sesionOk = request.getSession();
        String login = "LOGIN";
        login = (String) sesionOk.getAttribute("login");

        String tipoUsuario = (String) sesionOk.getAttribute("tipoUsuario");
        persona = (Persona) sesionOk.getAttribute("persona");
        identificacion = persona.getCedula();
        if (login == null || tipoUsuario != "1") {
            //redireccionamos a la pagina del login
%>
<jsp:forward page="login.jsp" />

<% }
} catch (Exception e) {
    System.out.println("Error leyendo el archivo Principal del Administrador " + e.toString());
%>
<jsp:forward page="login.jsp" />

<%
    }
%>
<html>
    <head>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="Internacionalizacion/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/logo-nav.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/main.css" />
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/main.js"></script>
        <script src="js/vendor/bootstrap.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/vendor/jquery-1.10.1.min.js"></script>
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <title>Principal Administrador</title>
    <center><img style="margin-top: 0px; position: relative;" src="images/banner.jpg"/></center>
</head>

<body style="margin-top: 0px; height: 100%;">
    <div align="right">
    </div>
    <!--Barra de Navegacion-->
    <div class="container" align="center" style="margin-bottom: 50px;">
        <div class="row">
            <nav class="navbar navbar-default" >
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Cambiar Navegacion</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="PrincipalAdmin.jsp" class="navbar-brand" style="font-size: 11px; font-weight: bold;">Principal</a></div>

                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Vendedores<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href='PrincipalAdmin.jsp?agregarVendedor' >Agregar</a></li>
                                <li><a href="PrincipalAdmin.jsp?eliminarVendedor" >Eliminar</a></li>
                                <li><a href="PrincipalAdmin.jsp?listarVendedores" >Listar Vendedores</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Socios<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href='PrincipalAdmin.jsp?agregarSocio' >Agregar</a></li>
                                <li><a href="PrincipalAdmin.jsp?eliminarSocio" >Eliminar</a></li>
                                <li><a href="PrincipalAdmin.jsp?ListarSocio">Listar Socios</a></li>
                            </ul>
                        </li> 

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<%= request.getContextPath() + "/LogOutServlet"%>"><%=persona.getUsuario()%> - Cerrar Sesión</a></li>

                    </ul>
                </div>
            </nav>  
            <%
                if (!(request.getParameter("agregarVendedor") == null)) {
            %>
            <%@include file="includes/RegistrarVendedor.jsp" %>
            <%
            } else if (!(request.getParameter("eliminarVendedor") == null)) {
            %>
            <%@include  file="includes/EliminarVendedor.jsp" %>
            <%
            }  else if (!(request.getParameter("EICorrectamente") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-success">El vendedor se Elimino Correctamente</p>
            </div>
            <% } else if (!(request.getParameter("EIError") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-danger">Ocurrio un error al intentar eliminar el vendedor</p>
            </div>
            <% } else if (!(request.getParameter("IICorrectamente") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-success">El vendedor agregó correctamente</p>
            </div>
            <% } else if (!(request.getParameter("IIError") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-danger">El vendedor no se pudo agregar</p>
            </div>
            <% }  else if (request.getParameter("listarVendedores") != null) {
                UsuarioDAO managerUsuario = new UsuarioDAO();
                List vendedores = managerUsuario.getVendedores();
                request.setAttribute("vendedores", vendedores);
            %>
            <%@include  file="includes/ListarVendedores.jsp" %>
            <% } else if (!(request.getParameter("agregarSocio") == null)) {
            %>
            <%@include  file="includes/RegistrarSocio.jsp" %>
            <% } else if (!(request.getParameter("INTCorrectamente") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-success">El Socio se agregó correctamente</p>
            </div>
            <% } else if (!(request.getParameter("INTError") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-danger">El Socio no se pudo Agregar</p>
            </div>
            <% } else if (!(request.getParameter("eliminarSocio") == null)) {
            %>
            <%@include  file="includes/EliminarSocio.jsp" %>
            <% } else if (!(request.getParameter("INECorrectamente") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-success">El Socio se eliminó correctamente</p>
            </div>
            <% } else if (!(request.getParameter("INError") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-danger">El Socio no se pudo Eliminar</p>
            </div>
            <% }  else if (!(request.getParameter("faltanCampos") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-danger">Ingrese Correctamente todos los campos del formulario</p>
            </div>
            <% }  else if (request.getParameter("ListarSocios") != null) {
//                ProgramaDAO nuevo = new ProgramaDAO();
//                ProfesorDAO managerProfesor = new ProfesorDAO();
//                List prog = nuevo.getProgramas();
//                List directores = managerProfesor.getDirectores(prog);
//                request.setAttribute("programas", prog);
//                request.setAttribute("directores", directores);
            %>
            <%@include  file="includes/ListarSocios.jsp" %>
            <% }else if (!(request.getParameter("modificarVendedor") == null)) {
            %>

            <%@include  file="includes/ModificarVendedor.jsp" %>
            <% }else if (!(request.getParameter("errorModificarVendedor") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-danger">Ocurrió un error modificando la información, Intente en otro momento </p>
            </div>
            <% }else if (!(request.getParameter("modificarSocio") == null)) {
            %>

            <%@include  file="includes/ModificarSocio.jsp" %>
            <% }else if (!(request.getParameter("usuarioAsignado") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-success">El usuario ya pertenece a otro Empleado, Ingrese Otro</p>
            </div>
            <% } else if (!(request.getParameter("errorIngresoLogin") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-success">Ocurrió un error ingresando el vendedor, intente luego</p>
            </div>
            <% }else if (!(request.getParameter("ingresoProfesorCorrecto") == null)) {
            %>
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <br><br><br>
                <p class="bg-success">El vendedor se agregó correctamenta</p>
            </div>
            <% }else {%>
            <div  style="height: 300px">
                
            </div>
            <% }%>
        </div>
    </div>    

    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')</script>

    <script src="js/vendor/bootstrap.js"></script>
    <script src="js/main.js"></script>
</body>
<!--<div style="width: 900px; margin: auto; bottom: 0;"><img style="position: absolute;  height: 100px; " src="images/footer.png"/></div>-->
</html>

