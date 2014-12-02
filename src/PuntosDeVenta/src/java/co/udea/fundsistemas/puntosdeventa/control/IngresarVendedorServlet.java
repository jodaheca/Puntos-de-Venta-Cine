/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.udea.fundsistemas.puntosdeventa.control;

import co.udea.fundsistemas.puntosdeventa.dao.LoginDAO;
import co.udea.fundsistemas.puntosdeventa.dao.UsuarioDAO;
import co.udea.fundsistemas.puntosdeventa.dto.Login;
import co.udea.fundsistemas.puntosdeventa.dto.Persona;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joaquin David
 */
public class IngresarVendedorServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        processRequest(request, response);

        String url = "./PrincipalAdmin.jsp";
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String id = request.getParameter("id");
        String telefono = request.getParameter("telefono");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("contrasena");
        LoginDAO managerLogin = new LoginDAO();
        Login existe = managerLogin.obtenerLoginPorUsuario(usuario);
        if (existe != null) {
            url = "./PrincipalAdmin.jsp?usuarioAsignado";
            response.setHeader("Location", url);
            response.sendRedirect(url);
            return;
        }
         UsuarioDAO managerUsuario = new UsuarioDAO();
        Persona vendedor = new Persona();
        vendedor.setCedula(Integer.parseInt(id));
        vendedor.setNombre(nombre);
        vendedor.setApellido(apellido);
        vendedor.setUsuario(usuario);
        vendedor.setTelefono(telefono);
        vendedor.setContrasena(password);
        int resultIngreso = managerUsuario.IngresarVendedor(vendedor);
        // guardamos el usuario que utilizara el Vendedor
        int result = managerLogin.IngresarUsuario(usuario, password, 2,id);
        if (result == 2) {
            url = "./PrincipalAdmin.jsp?errorIngresoLogin";
            response.setHeader("Location", url);
            response.sendRedirect(url);
            return;
        }
        if (resultIngreso == 2) {
            url = "./PrincipalAdmin.jsp?errorIngresoLogin";
            response.setHeader("Location", url);
            response.sendRedirect(url);
        } else {
            url = "./PrincipalAdmin.jsp?ingresoProfesorCorrecto";
            response.setHeader("Location", url);
            response.sendRedirect(url);
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
