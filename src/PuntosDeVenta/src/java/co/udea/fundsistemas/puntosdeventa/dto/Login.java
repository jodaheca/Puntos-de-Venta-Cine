/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.udea.fundsistemas.puntosdeventa.dto;

/**
 *
 * @author Usuario
 */
public class Login {
    private String usuario;
    private String contrasena;
    private int permiso;

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the contrasena
     */
    public String getContrasena() {
        return contrasena;
    }

    /**
     * @param contrasena the contrasena to set
     */
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    /**
     * @return the permiso
     */
    public int getPermiso() {
        return permiso;
    }

    /**
     * @param permiso the permiso to set
     */
    public void setPermiso(int permiso) {
        this.permiso = permiso;
    }
    
}
