<%-- 
    Document   : ListarProgramas
    Created on : 14-jul-2014, 9:15:24
    Author     : Usuario
--%>

<%@page import="co.udea.fundsistemas.puntosdeventa.dto.Socio"%>
<%@page import="co.udea.fundsistemas.puntosdeventa.dto.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List soc = (List) request.getAttribute("socios");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Socios</title>
        <link href="../Prueba/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="../Prueba/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
            <h1 class="text-center login-title"> Socios Registrados</h1>
            <div class="account-wall">
                <br><br>
                <%
                    if (soc == null) {
                %>
                <div class="col-sm-6 col-md-4 col-md-offset-4">              
                    <p class="bg-info">Ocurrio un erro al recuperar los Socios, intente Luego</p>
                </div>
                <%
                } else if (soc.size() == 0) {
                %>
                <div class="col-sm-6 col-md-4 col-md-offset-4">        
                    <p class="bg-info">No existen Socios registrados </p>
                </div>
                <%
                } else {
                %>
                <table class="table table-bordered">
                    <thead>
                        <tr> 
                            <th>identificacion</th> 
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>puntos</th> 
                        </tr>
                    </thead> 
                    <tbody>
                        <%
                            for (int i = 0; i < soc.size(); i++) {
                           Socio nueva=(Socio) soc.get(i);
                                int cedula=nueva.getCedula();
                                String nombre=nueva.getNombre();
                                String apellido = nueva.getApellido();
                                int puntos = nueva.getPuntos();
                                
                        %>
                        <tr class="active">
                            <td><% if (cedula != 0) {%><%=cedula%> <% } %></td> 
                            <td><% if (nombre != null) {%><%=nombre%><% } %></td>
                            <td><% if (apellido != null) {%><%=apellido%><% } %></td>
                            <td><%=puntos%></td>
                            <td><form action="PrincipalAdmin.jsp?modificarSocio" method="POST">
                                         <input type="hidden" id="identificacion" name="identificacion" value="<%=cedula%>">
                                         <input type="hidden" id="nombre" name="nombre" value="<%=nombre%>">
                                         <input type="hidden"  id="apellido" name="apellido" value="<%=apellido%>">
                                        <button class="btn btn-lg btn-primary btn-xs" type="submit">
                                     Modificar</button></form></td>
                                     <td><form action="PrincipalAdmin.jsp?eliminarSocio" method="POST">
                                         <input type="hidden" id="id" name="id" value="<%=cedula%>">
                                        <button class="btn btn-lg btn-primary btn-xs" type="submit">
                                     Eliminar</button></form></td>
                        </tr>

                        <%
                            }
                        %> 
                    </tbody>
                </table>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
