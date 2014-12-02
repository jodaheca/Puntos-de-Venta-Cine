/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.udea.fundsistemas.puntosdeventa.control;

import co.udea.fundsistemas.puntosdeventa.dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joaquin David
 */
public class EliminarVendedorServlet extends HttpServlet {


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
        String cedula = request.getParameter("id");
        int cod = 0;
        try {
            cod = Integer.parseInt(cedula);
        } catch (NumberFormatException e) {
            System.out.println("Error al convertir el codigo a entero" + e.toString());
           
                url = "./PrincipalAdmin.jsp?faltanCampos";
                response.setHeader("Location", url);
                response.sendRedirect(url);
                return;
        }
        UsuarioDAO managerUsuario = new UsuarioDAO();
        int result = managerUsuario.eliminarVendedor(cod);
        if (result == 1) {
                url = "./PrincipalAdmin.jsp?EICorrectamente";
                response.setHeader("Location", url);
                response.sendRedirect(url);
        } else {
                url = "./PrincipalAdmin.jsp?EIError";
                response.setHeader("Location", url);
                response.sendRedirect(url);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
