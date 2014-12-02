/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.udea.fundsistemas.puntosdeventa.dao;

import co.udea.fundsistemas.puntosdeventa.dto.Login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class LoginDAO {

    private BDConexion conexion;

    public LoginDAO() {
        this.conexion = new BDConexion();
    }

    public int IngresarUsuario(String user, String password, int tipo, String propietario) {
        try {
            if (conexion.getConnection().isClosed()) {
                conexion = new BDConexion();
            }
            Connection con = this.conexion.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("ingresarUsuarioLogin"));
            ps.setString(1, user);
            ps.setString(2, password);
            ps.setInt(3, tipo);
            ps.setInt(4, Integer.parseInt(propietario));
            ps.executeUpdate();
            System.out.println("Se registro Correctamente el UserPassword en el sistema");
            return 1;

        } catch (Exception ex) {
            System.out.println("Error al ingresar el UserPassword al sistema Error: " + ex);
            return 2;
        } finally {
            conexion.closeConnection();
        }
    }

    public int modificarContraseña(String usuario, String nuevaContrasena) {
        try {
            if (conexion.getConnection().isClosed()) {
                conexion = new BDConexion();
            }
            Connection con = this.conexion.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("ModificarContrasena"));
            ps.setString(1, nuevaContrasena);
            ps.setString(2, usuario);
            System.out.println(ps.toString());
            ps.executeUpdate();
            return 1;
        } catch (SQLException e) {
            System.out.println("Error modificando la contraseña en la DB");
            return 0;
        } finally {
            conexion.closeConnection();
        }
    }

    public Login obtenerLoginPorUsuario(String usuario) {
        Login log = null;
        try {
            if (conexion.getConnection().isClosed()) {
                conexion = new BDConexion();
            }
            Connection con = this.conexion.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("obtenerLoginxUsuario"));
            ps.setString(1, usuario);
            System.out.println(ps.toString());
            ResultSet logi = ps.executeQuery();
            if (logi.next()) {
                log = new Login();
                log.setContrasena(logi.getString("contrasena"));
                log.setPermiso(logi.getInt("permisos"));
                log.setUsuario(usuario);
            }
            return log;
        } catch (SQLException e) {

            return null;
        } finally {
            conexion.closeConnection();
        }
    }

    public boolean cambiarPass(String user, String pass) {
        try {
            if (conexion.getConnection().isClosed()) {
                conexion = new BDConexion();
            }
            Connection con = this.conexion.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("cambiarPass"));
            ps.setString(1, pass);
            ps.setString(2, user);
            int logi = ps.executeUpdate();
            if (logi == 1) {
                System.out.println("Modificación de contraseña realizada satisfactoriamente!");
                return true;
            }

        } catch (SQLException e) {
            System.out.println("Error modificando contraseña: " + e);
            return false;
        } finally {
            conexion.closeConnection();
        }
        return false;
    }
    
     public int eliminarLogin(int identificacion) {
        try {
            if (conexion.getConnection().isClosed()) {
                conexion = new BDConexion();
            }
            Connection con = this.conexion.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("eliminarLogin"));
            ps.setInt(1, identificacion);
            ps.executeUpdate();
            System.out.println("El Login con numero de indentificacion " + identificacion + " se ha elinado correctamente");
            return 1;
        } catch (SQLException e) {
            System.out.println("Error eliminando el Login: "+ e.toString());
            return 2;
        } finally {
            conexion.closeConnection();
        }
    }
}
