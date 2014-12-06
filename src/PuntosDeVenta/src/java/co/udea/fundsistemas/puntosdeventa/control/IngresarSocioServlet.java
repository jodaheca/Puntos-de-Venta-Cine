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
public class IngresarSocioServlet extends HttpServlet {

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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        int cedula = 0;
        try{
            cedula = Integer.parseInt(id);
        }catch(Exception e){
            System.out.println("Error conviertiendo String a entero: " + e.toString() );
             url = "./PrincipalAdmin.jsp?cedulaError";
            response.setHeader("Location", url);
            response.sendRedirect(url);
            return;
        }
        UsuarioDAO managerUsuario = new UsuarioDAO();
        boolean existe = managerUsuario.existeSocio(cedula);
        if(existe){
             url = "./PrincipalAdmin.jsp?existeCedula";
            response.setHeader("Location", url);
            response.sendRedirect(url);
            return;
        }
        Persona socio = new Persona();
        socio.setCedula(Integer.parseInt(id));
        socio.setNombre(nombre);
        socio.setApellido(apellido);
        int resultIngreso = managerUsuario.ingresarSocio(socio);
        if (resultIngreso == 2) {
            url = "./PrincipalAdmin.jsp?errorIngresoSocio";
            response.setHeader("Location", url);
            response.sendRedirect(url);
        } else {
            url = "./PrincipalAdmin.jsp?ingresoSocioCorrecto";
            response.setHeader("Location", url);
            response.sendRedirect(url);
        }
    }

@Override
        public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
