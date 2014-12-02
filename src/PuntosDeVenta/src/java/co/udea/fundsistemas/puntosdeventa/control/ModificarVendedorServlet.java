/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.udea.fundsistemas.puntosdeventa.control;

import co.udea.fundsistemas.puntosdeventa.dao.UsuarioDAO;
import co.udea.fundsistemas.puntosdeventa.dto.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joaquin David
 */
public class ModificarVendedorServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = "";
         String nombre = request.getParameter("nombre");
         String apellido = request.getParameter("apellido");
         String cedula = request.getParameter("id");
         String telefono = request.getParameter("telefono");
         Persona vendedor = new Persona();
         vendedor.setCedula(Integer.parseInt(cedula));
         vendedor.setNombre(nombre);
         vendedor.setApellido(apellido);
         vendedor.setTelefono(telefono);
         UsuarioDAO managerUsuario = new UsuarioDAO();
         int resultado = managerUsuario.editarPersona(vendedor);
         if(resultado == 1){
             url = "./PrincipalAdmin.jsp?listarVendedores";
                response.setHeader("Location", url);
                response.sendRedirect(url);
         }else{
             url = "./PrincipalAdmin.jsp?errorModificarVendedor";
                response.setHeader("Location", url);
                response.sendRedirect(url);
         }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
