/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;


import Persistencia.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
    private String cita_Cliente_Nombre;
    private int cita_Estado_Id;
    private int cita_Servicio_Id;
    private String cita_Servicio_Nombre;
    private String cita_Estado_Nombre;
    private String cita_Fecha;
    private String cita_Hora;
    private String cita_Ubicacion;
    
    // Constructor
    public Cita(){}
    
    // get y set

    public int getCita_Id() {
        return cita_Id;
    }

    public void setCita_Id(int cita_Id) {
        this.cita_Id = cita_Id;
    }

    public String getCita_Cliente_Nombre() {
        return cita_Cliente_Nombre;
    }

    public void setCita_Cliente_Nombre(String cita_Cliente_Nombre) {
        this.cita_Cliente_Nombre = cita_Cliente_Nombre;
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

    public int getCita_Servicio_Id() {
        return cita_Servicio_Id;
    }

    public void setCita_Servicio_Id(int cita_Servicio_Id) {
        this.cita_Servicio_Id = cita_Servicio_Id;
    }

    public String getCita_Servicio_Nombre() {
        return cita_Servicio_Nombre;
    }

    public void setCita_Servicio_Nombre(String cita_Servicio_Nombre) {
        this.cita_Servicio_Nombre = cita_Servicio_Nombre;
    }
    
    
    
    // Metodos adicionales
    @Override
    public String toString(){
        return "Cita{" + "cita_Id=" + cita_Id + ", cita_Cliente_Nombre=" + cita_Cliente_Nombre + ", cita_Estado_Id=" + cita_Estado_Id + ", cita_Servicio_Id=" + cita_Servicio_Id + ", cita_Estado_Nombre=" + cita_Estado_Nombre + ", cita_Fecha=" + cita_Fecha + ", cita_Hora=" + cita_Hora + ", cita_Ubicacion=" + cita_Ubicacion + '}';
    }

    // ######################### Conexion a la BD desde la clase #########################
    // ---------------------------- C de CRUD para Citas --------------------
    public boolean crearCita() {
        ConexionBD conexion = new ConexionBD();
        if(this.cita_Estado_Nombre == "Habilitado") this.cita_Estado_Id = 1;
        if(this.cita_Estado_Nombre == "Deshabilitado") this.cita_Estado_Id = 2;
        String sql = "INSERT INTO `cita`(`cita_Cliente_Nombre`, `cita_Servicio_Id`, `cita_Fecha`, `cita_Hora`, `cita_Ubicacion`, `cita_Estado_Id`) VALUES ('"+ this.cita_Cliente_Nombre +"','"+ this.cita_Servicio_Id +"','"+ this.cita_Fecha +"','"+ this.cita_Hora +"','"+ this.cita_Ubicacion +"','"+ this.cita_Estado_Id +"')";
        try {
            conexion.insertarBD(sql);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            System.out.println("No se creo la cita");
            return false;
        } finally{
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        return true;
    }
    // ---------------------------- R de CRUD para Citas --------------------
    public ArrayList<Cita> consultarCitas(){
        // Lista con los objetos tipo "Cita" que se va a devolver al front
        ArrayList<Cita> lista = new ArrayList<>();
        
        // Llenar la lista
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT c.cita_Id, c.cita_Cliente_Nombre, c.cita_Servicio_Id, s.servicio_Nombre, c.cita_Fecha, c.cita_Hora, c.cita_Ubicacion, c.cita_Estado_Id, e.estado_Nombre FROM cita c JOIN estados e ON (cita_Estado_Id = estado_Id) JOIN servicio s ON (cita_Servicio_Id = servicio_Id);";
        
        // Bloque TryCatch para obtener los errores e identificarlos
        try {
            ResultSet rs = conexion.consultarBD(sql);
            while(rs.next()){
                this.cita_Id = rs.getInt("cita_Id");
                this.cita_Cliente_Nombre = rs.getString("cita_Cliente_Nombre");
                this.cita_Servicio_Id = rs.getInt("cita_Servicio_Id");
                this.cita_Servicio_Nombre = rs.getString("servicio_Nombre");
                this.cita_Fecha = rs.getString("cita_Fecha");
                this.cita_Hora = rs.getString("cita_Hora");
                this.cita_Ubicacion = rs.getString("cita_Ubicacion");
                this.cita_Estado_Id = rs.getInt("cita_Estado_Id");
                this.cita_Estado_Nombre = rs.getString("estado_Nombre");
                
                // Creando el objeto
                Cita cita = new Cita();
                cita.setCita_Id(cita_Id);
                cita.setCita_Cliente_Nombre(cita_Cliente_Nombre);
                cita.setCita_Servicio_Id(cita_Servicio_Id);
                cita.setCita_Servicio_Nombre(cita_Servicio_Nombre);
                cita.setCita_Estado_Nombre(cita_Estado_Nombre);
                cita.setCita_Fecha(cita_Fecha);
                cita.setCita_Hora(cita_Hora);
                cita.setCita_Ubicacion(cita_Ubicacion);
                cita.setCita_Estado_Id(cita_Estado_Id);
                cita.setCita_Estado_Nombre(cita_Estado_Nombre);
                
                // Agregando el objeto creado a la lista
                lista.add(cita);
            }
            
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        return lista;
    }
    // ---------------------------- R de CRUD para Servicios individuales --------------------
    public ArrayList<Cita> consultarCita(){
        
        ArrayList<Cita> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT c.cita_Id, c.cita_Cliente_Nombre, c.cita_Servicio_Id, s.servicio_Nombre, c.cita_Fecha, c.cita_Hora, c.cita_Ubicacion, c.cita_Estado_Id, e.estado_Nombre FROM cita c JOIN estados e ON (cita_Estado_Id = estado_Id) JOIN servicio s ON (cita_Servicio_Id = servicio_Id)";
        
        if(this.cita_Id != 0){
            sql += " WHERE c.cita_Id = "+ this.cita_Id +";";
        }
        else if(this.cita_Fecha != null){
            sql += " WHERE s.cita_Fecha LIKE '%"+ this.cita_Fecha +"%';";
        }
        else if(this.cita_Cliente_Nombre != null){
            sql += " WHERE s.cita_Cliente_Nombre LIKE '%"+ this.cita_Cliente_Nombre +"%';";
        }else{
            sql += ";";
        }
        
        System.out.println(sql);
        
        
        // Bloque TryCatch para obtener los errores e identificarlos
        try {
            ResultSet rs = conexion.consultarBD(sql);
            while(rs.next()){
                this.cita_Id = rs.getInt("cita_Id");
                this.cita_Cliente_Nombre = rs.getString("cita_Cliente_Nombre");
                this.cita_Servicio_Id = rs.getInt("cita_Servicio_Id");
                this.cita_Servicio_Nombre = rs.getString("servicio_Nombre");
                this.cita_Fecha = rs.getString("cita_Fecha");
                this.cita_Hora = rs.getString("cita_Hora");
                this.cita_Ubicacion = rs.getString("cita_Ubicacion");
                this.cita_Estado_Id = rs.getInt("cita_Estado_Id");
                this.cita_Estado_Nombre = rs.getString("estado_Nombre");
            
                // Creando el objeto
                Cita c = new Cita();
                c.setCita_Id(cita_Id);
                c.setCita_Cliente_Nombre(cita_Cliente_Nombre);
                c.setCita_Servicio_Id(cita_Servicio_Id);
                c.setCita_Servicio_Nombre(cita_Servicio_Nombre);
                c.setCita_Fecha(cita_Fecha);
                c.setCita_Hora(cita_Hora);
                c.setCita_Ubicacion(cita_Ubicacion);
                c.setCita_Estado_Id(cita_Estado_Id);
                c.setCita_Estado_Nombre(cita_Estado_Nombre);
                
                // Agregando el objeto creado a la lista
                lista.add(c);
            }
            
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        if(lista.size()>0){
            System.out.println("Lista encontrada");
            return lista;
        }else{
            System.out.println("No se encontro");
            return null;
        }
    }
    
    
    // ---------------------------- U de CRUD para Citas --------------------
    public boolean actualizarCita(){
        ConexionBD conexion = new ConexionBD();
        // Condiciones para validar la actualizacion de cita_Estado_Id
        if(this.cita_Estado_Nombre == "Habilitado") this.cita_Estado_Id = 1;
        if(this.cita_Estado_Nombre == "Deshabilitado") this.cita_Estado_Id = 2;
        if(this.cita_Estado_Id == 1) this.cita_Estado_Nombre = "Habilitado" ;
        if(this.cita_Estado_Id == 2){ this.cita_Estado_Nombre = "Deshabilitado";}
        else{this.cita_Estado_Id = 1;}
        // Se pepara el query para actualizar con los datos del objeto
        String sql = "UPDATE `cita` SET `cita_Cliente_Nombre`='"+ this.cita_Cliente_Nombre +"', `cita_Servicio_Id`='"+ this.cita_Servicio_Id +"',`cita_Fecha`='"+ this.cita_Fecha +"',`cita_Hora`='"+ this.cita_Hora +"',`cita_Ubicacion`='"+ this.cita_Ubicacion +"',`cita_Estado_Id`='"+ this.cita_Estado_Id +"' WHERE `cita_Id`='"+ this.cita_Id +"';";
        try {
            conexion.actualizarBD(sql);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        } finally{
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        return true;
    }
    // ---------------------------- D de CRUD para Citas --------------------
        public boolean eliminarCita(){
        ConexionBD conexion = new ConexionBD();
        // Se pepara el query para eliminar con los datos del objeto
        String sql = "DELETE FROM `cita` WHERE cita_Id=" + this.cita_Id + ";";
        try {
            conexion.borrarBD(sql);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        } finally{
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        return true;
    }
    
    
    
    
    public static void main(String[] args) {
        ArrayList<Cita> lista = new ArrayList<>();
        Cita c = new Cita();
        c.setCita_Id(10);
        lista = c.consultarCita();
        for(Cita cita: lista){
            System.out.println(cita.toString());
        }
    }
}