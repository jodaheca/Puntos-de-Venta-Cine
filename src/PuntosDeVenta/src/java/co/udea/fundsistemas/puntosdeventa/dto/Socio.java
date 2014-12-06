/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.udea.fundsistemas.puntosdeventa.dto;

/**
 *
 * @author Joaquin David
 */
public class Socio {
    
    private String nombre;
    private String apellido;
    private int cedula;
    private int puntos;

    public Socio() {
    }
    
   
    public Socio(String nombre, String apellido, int cedula, int puntos) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.cedula = cedula;
        this.puntos = puntos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }
    
    
    
    
}
