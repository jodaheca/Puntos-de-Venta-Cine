/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.udea.fundsistemas.puntosdeventa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import co.udea.fundsistemas.puntosdeventa.dto.Login;
import co.udea.fundsistemas.puntosdeventa.dto.Persona;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO {
    private BDConexion conection;

    public UsuarioDAO() {
          this.conection = new BDConexion();
    }
    
    public Login verificacion(String user){
         Login lg = null;
        try{
             if (conection.getConnection().isClosed()) {
                conection = new BDConexion();
            }
           // conection = new BDConexion();
            Connection con = this.conection.getConnection();
            PreparedStatement st = con.prepareStatement(BDConexion.getStatement("verficarUsuario"));
            
            st.setString(1, user);
            System.out.println(st.toString());
            ResultSet rs= st.executeQuery();
            
           while(rs.next()){
               lg = new Login();
                lg.setUsuario(user);
                lg.setContrasena(rs.getString("contrasena"));
                lg.setPermiso(rs.getInt("permisos"));
           }
           
        }catch(Exception e){
            System.out.println("Error extrayendo información de usuario!");
            return null;
        } finally {
            conection.closeConnection();
        }

        return lg;
    }
    
    public Persona getEmpleadoXusuario(String user) {
        Persona e = null;

        try {
            if (conection.getConnection().isClosed()) {
                conection = new BDConexion();
            }
            Connection con = this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("empleadoXusuario"));
            ps.setString(1, user);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String nombre = rs.getString("nombres");
                String apellido = rs.getString("apellidos");
                int cedula = rs.getInt("identificacion");
                String telefono = rs.getString("telefono");
                String ud = rs.getString("usuario");
                String contrasena = rs.getString("contrasena");
                e = new Persona(nombre, apellido, cedula, telefono,ud,contrasena);
                return e;
            }
        } catch (Exception ex) {
            System.out.println("Error obteniendo Empleado " + ex);
        } finally {
            conection.closeConnection();
        }

        return e;
    }
    public int IngresarVendedor(Persona vendedor) {
        try {
            if (conection.getConnection().isClosed()) {
                conection = new BDConexion();
            }
            Connection con = this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("ingresarPersona"));
            ps.setInt(1, vendedor.getCedula());
            ps.setString(2, vendedor.getNombre());
            ps.setString(3, vendedor.getApellido());
            ps.setString(4, vendedor.getTelefono());
            ps.setInt(5, 2);
            System.out.println(ps.toString());
            ps.executeUpdate();
            System.out.println("El Vendedor se registro exitosamente en la BD");
            return 1;
        } catch (SQLException e) {
            System.out.println("Error al registrar profesor " + e.toString());
            return 2;
        } finally {
            conection.closeConnection();
        }
    }
    
     public int eliminarVendedor(int identificacion) {
         LoginDAO  managerLogin= new LoginDAO();
         int elimina = managerLogin.eliminarLogin(identificacion);
         if(elimina==1){
         try {
            if (conection.getConnection().isClosed()) {
                conection = new BDConexion();
            }
            Connection con = this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("eliminarPersona"));
            ps.setInt(1, identificacion);
            ps.executeUpdate();
            System.out.println("El vendedor con numero de indentificacion " + identificacion + " se ha elinado correctamente");
            return 1;
        } catch (SQLException e) {
            System.out.println("Error eliminando el vendedor"+ e.toString());
            return 2;
        }finally {
            conection.closeConnection();
         }
         }else{
             return 2;
         } 
    }
     
     
         public List getVendedores() {
        List vendedores = new ArrayList();
        Persona e;
        try {
            if (conection.getConnection().isClosed()) {
                conection = new BDConexion();
            }
            Connection con = this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("obtenerProfesores"));
            ps.setInt(1, 2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String nombre = rs.getString("nombres");
                String apellido = rs.getString("apellidos");
                String cedula = rs.getString("identificacion");
                String telefono = rs.getString("telefono");
                String ud = rs.getString("tipo_usuario");
                e = new Persona();
                e.setNombre(nombre);
                e.setApellido(apellido);
                e.setCedula(Integer.parseInt(cedula));
                e.setTelefono(telefono);
                vendedores.add(e);
            }
            return vendedores;
        } catch (SQLException ex) {
            System.out.println("Error obteniendo la lista de los vendedores " + ex);
            return null;
        } finally {
            conection.closeConnection();
        }
    }
         
         public int editarPersona(Persona persona) {
        try {
            if (conection.getConnection().isClosed()) {
                conection = new BDConexion();
            }
            Connection con = this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("actualizarPersona"));
            ps.setString(1, persona.getNombre());
            ps.setString(2, persona.getApellido());
            ps.setString(3, persona.getTelefono());
            ps.setInt(4, persona.getCedula());
            System.out.println(ps.toString());
            ps.executeUpdate();
            System.out.println("El VENDEDOR de cedula:" +persona.getCedula()+"Se actualizo correctamente");
            return 1;
        } catch (SQLException e) {
            System.out.println("Error al actualizar vendedor " + e.toString());
            return 2;
        } finally {
            conection.closeConnection();
        }
    }
    
}
