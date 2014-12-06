<%-- 
    Document   : ListarProgramasAdmin
    Created on : 13-ago-2014, 15:43:30
    Author     : Usuario
--%>
<%@page import="co.udea.fundsistemas.puntosdeventa.dto.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%     
    List vende=(List) request.getAttribute("vendedores");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Vendedores</title>
        <link href="../Prueba/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="../Prueba/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
                        <h1 class="text-center login-title"> Vendedores Registrados</h1>
                                <div class="account-wall">
                        <br><br>
                     <% 
                            if(vende==null){
                                %>
                                <div class="col-sm-6 col-md-4 col-md-offset-4">      
                                 <p class="bg-info">Ocurrió un error al recuperar la lista de los vendedores, intente Luego </p>
                                 </div>
                            <%
                            } else  if(vende.size()==0){
                                %>
                                 <div class="col-sm-6 col-md-4 col-md-offset-4">    
                                     <p class="bg-info">No existen vendedores registrados </p>
                                 </div>
                        <%
                            }else{
                        %>   
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th>Identificación</th> 
                                <th>Nombre</th> 
                                <th>Apellido</th> 
                                <th>telefono</th>
                            </tr>
                        </thead> 
                        <tbody>
                            <%
                              for(int i=0;i<vende.size();i++){
                                Persona nuevo=(Persona) vende.get(i);
                                int id=nuevo.getCedula();
                                String nombre=nuevo.getNombre();
                                String apellido=nuevo.getApellido();
                                String telefono=nuevo.getTelefono();

                            %>
                             <tr class="active">
                                <td><%  %><%=id%> <%%></td> 
                                <td><% if(nombre != null){ %><%=nombre%><% } %></td> 
                                <td><% if(apellido != null){ %><%=apellido%><% } %></td> 
                                <td><% if(telefono != null){ %><%=telefono%><% } %></td>
                                <td><form action="PrincipalAdmin.jsp?modificarVendedor" method="POST">
                                         <input type="hidden" id="identificacion" name="identificacion" value="<%=id%>">
                                         <input type="hidden" id="nombre" name="nombre" value="<%=nombre%>">
                                         <input type="hidden"  id="apellido" name="apellido" value="<%=apellido%>">
                                         <input type="hidden" id="telefono" name="telefono" value="<%=telefono%>">
                                        <button class="btn btn-lg btn-primary btn-xs" type="submit">
                                     Modificar</button></form></td>
                                     <td><form action="PrincipalAdmin.jsp?eliminarVendedor" method="POST">
                                         <input type="hidden" id="id" name="id" value="<%=id%>">
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
