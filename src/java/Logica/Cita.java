/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author AlvarezCuadros
 */
public class Cita {
    // Atributos
    private int cita_Id;
    private int cita_Cliente_Id;
    private int cita_Cliente_Nombre;
    private int cita_Tecnico_Id;
    private int cita_Tecnico_Nombre;
    private int cita_Estado_Id;
    private String cita_Fecha;
    private String cita_Hora;
    private String cita_Ubicacion;
    private String cita_Estado_Nombre;
    
    // Constructor
    public Cita(){}
    
    // get y set

    public int getCita_Id() {
        return cita_Id;
    }

    public void setCita_Id(int cita_Id) {
        this.cita_Id = cita_Id;
    }

    public int getCita_Cliente_Id() {
        return cita_Cliente_Id;
    }

    public void setCita_Cliente_Id(int cita_Cliente_Id) {
        this.cita_Cliente_Id = cita_Cliente_Id;
    }

    public int getCita_Cliente_Nombre() {
        return cita_Cliente_Nombre;
    }

    public void setCita_Cliente_Nombre(int cita_Cliente_Nombre) {
        this.cita_Cliente_Nombre = cita_Cliente_Nombre;
    }

    public int getCita_Tecnico_Id() {
        return cita_Tecnico_Id;
    }

    public void setCita_Tecnico_Id(int cita_Tecnico_Id) {
        this.cita_Tecnico_Id = cita_Tecnico_Id;
    }

    public int getCita_Tecnico_Nombre() {
        return cita_Tecnico_Nombre;
    }

    public void setCita_Tecnico_Nombre(int cita_Tecnico_Nombre) {
        this.cita_Tecnico_Nombre = cita_Tecnico_Nombre;
    }

    public int getCita_Estado_Id() {
        return cita_Estado_Id;
    }

    public void setCita_Estado_Id(int cita_Estado_Id) {
        this.cita_Estado_Id = cita_Estado_Id;
    }

    public String getCita_Fecha() {
        return cita_Fecha;
    }

    public void setCita_Fecha(String cita_Fecha) {
        this.cita_Fecha = cita_Fecha;
    }

    public String getCita_Hora() {
        return cita_Hora;
    }

    public void setCita_Hora(String cita_Hora) {
        this.cita_Hora = cita_Hora;
    }

    public String getCita_Ubicacion() {
        return cita_Ubicacion;
    }

    public void setCita_Ubicacion(String cita_Ubicacion) {
        this.cita_Ubicacion = cita_Ubicacion;
    }

    public String getCita_Estado_Nombre() {
        return cita_Estado_Nombre;
    }

    public void setCita_Estado_Nombre(String cita_Estado_Nombre) {
        this.cita_Estado_Nombre = cita_Estado_Nombre;
    }
    
    // Metodos adicionales

    @Override
    public String toString() {
        return "Cita{" + "cita_Id=" + cita_Id + ", cita_Cliente_Id=" + cita_Cliente_Id + ", cita_Cliente_Nombre=" + cita_Cliente_Nombre + ", cita_Tecnico_Id=" + cita_Tecnico_Id + ", cita_Tecnico_Nombre=" + cita_Tecnico_Nombre + ", cita_Estado_Id=" + cita_Estado_Id + ", cita_Fecha=" + cita_Fecha + ", cita_Hora=" + cita_Hora + ", cita_Ubicacion=" + cita_Ubicacion + ", cita_Estado_Nombre=" + cita_Estado_Nombre + '}';
    }
    
}
