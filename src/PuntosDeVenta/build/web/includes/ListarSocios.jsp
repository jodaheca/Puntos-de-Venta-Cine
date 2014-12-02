<%-- 
    Document   : ListarProgramas
    Created on : 14-jul-2014, 9:15:24
    Author     : Usuario
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%     
    List programas=(List) request.getAttribute("programas");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Programas</title>
        <link href="../Prueba/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="../Prueba/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
                        <h1 class="text-center login-title"> Programas Registrados</h1>
                                <div class="account-wall">
                        <br><br>
                        <% 
                            if(programas==null){
                                %>
                        <div class="col-sm-6 col-md-4 col-md-offset-4">              
                             <p class="bg-info">Ocurrio un erro al recuperar los Programas, intente Luego</p>
                        </div>
                             <%
                            }else  if(programas.size()==0){
                                %>
                                <div class="col-sm-6 col-md-4 col-md-offset-4">        
                                    <p class="bg-info">No existen Programas registrados </p>
                                    </div>
                            <%
                            }else{
                        %>
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th>Codigo</th> 
                                <th>Nombre</th> 
                            </tr>
                        </thead> 
                        <tbody>
                            <%
                              for(int i=0;i<programas.size();i++){
                              // Programa nueva=(Programa) programas.get(i);
                               // String codigo=nueva.getCodigo();
                               // String nombre=nueva.getNombre();
                                  String codigo ="";
                                  String nombre = "";

                            %>
                             <tr class="active">
                                <td><% if(codigo != null){ %><%=codigo%> <% } %></td> 
                                <td><% if(nombre != null){ %><%=nombre%><% } %></td> 
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
