package co.udea.fundsistemas.puntosdeventa.control;

import co.udea.fundsistemas.puntosdeventa.dao.UsuarioDAO;
import co.udea.fundsistemas.puntosdeventa.dto.Login;
import co.udea.fundsistemas.puntosdeventa.dto.Persona;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joaquin David
 */
public class LoginServlet extends HttpServlet {

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
        String url = "";
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String usuario = request.getParameter("usuario");
        String contrasena = (String) request.getParameter("contrasena");
        UsuarioDAO us = new UsuarioDAO();
        if (usuario == null || contrasena == null) {
            request.setAttribute("mensaje", "Usuario y/o contraseña incorrecta");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }
        Login lg = us.verificacion(usuario);
        if (lg != null && lg.getContrasena().equals(contrasena)) {
            UsuarioDAO managerUsuario =  new UsuarioDAO();
            Persona e = managerUsuario.getEmpleadoXusuario(usuario);
            HttpSession session = request.getSession();
            session.setAttribute("persona", e);
            session.setAttribute("login", "true");
           
            // verificamos si es administrador

            if (lg.getPermiso() == 1) {
                session.setAttribute("tipoUsuario", "1");
                url = "./PrincipalAdmin.jsp";
                //verificamos si es cajero
            } else if (lg.getPermiso() == 2) {
                session.setAttribute("tipoUsuario", "2");
                url = "./PrincipalVendendor.jsp";
            } else {
                request.setAttribute("mensaje", "Usuario y/o contraseña incorrecta");
                url = "./login.jsp";
            }

        } else {
            url = "./login.jsp";
            request.setAttribute("mensaje", "Usuario y/o contraseña incorrecta");
        }
        response.setHeader("Location", url);
        response.sendRedirect(url);
    }


@Override
        public String getServletInfo() {
        return "Short description";
    }

}
