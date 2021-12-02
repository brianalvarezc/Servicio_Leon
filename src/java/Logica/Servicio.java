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
public class Servicio {
    // Atributos
    private int servicio_Id;
    private String servicio_Nombre;
    private int servicio_Precio;
    private int servicio_Estado_Id;
    private String servicio_Estado_Nombre;
    
    // Constructor
    public Servicio(){}
    
    // Metodos get y set

    public int getServicio_Id() {
        return servicio_Id;
    }

    public void setServicio_Id(int servicio_Id) {
        this.servicio_Id = servicio_Id;
    }

    public String getServicio_Nombre() {
        return servicio_Nombre;
    }

    public void setServicio_Nombre(String servicio_Nombre) {
        this.servicio_Nombre = servicio_Nombre;
    }

    public int getServicio_Precio() {
        return servicio_Precio;
    }

    public void setServicio_Precio(int servicio_Precio) {
        this.servicio_Precio = servicio_Precio;
    }

    public int getServicio_Estado_Id() {
        return servicio_Estado_Id;
    }

    public void setServicio_Estado_Id(int servicio_Estado_Id) {
        this.servicio_Estado_Id = servicio_Estado_Id;
    }

    public String getServicio_Estado_Nombre() {
        return servicio_Estado_Nombre;
    }

    public void setServicio_Estado_Nombre(String servicio_Estado_Nombre) {
        this.servicio_Estado_Nombre = servicio_Estado_Nombre;
    }
    
    
    // Metodos adicionales

    @Override
    public String toString() {
        return "Servicio{" + "servicio_Id=" + servicio_Id + ", servicio_Nombre=" + servicio_Nombre + ", servicio_Precio=" + servicio_Precio + ", servicio_Estado_Id=" + servicio_Estado_Id + ", servicio_Estado_Nombre=" + servicio_Estado_Nombre + '}';
    }
    
    // ######################### Conexion a la BD desde la clase #########################
    // ---------------------------- C de CRUD para Servicios --------------------
    public boolean crearServicio(){
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO `servicio`(`servicio_Nombre`, `servicio_Precio`, `servicio_Estado_Id`) VALUES ('"+ this.servicio_Nombre +"','"+ this.servicio_Precio +"','"+ this.servicio_Estado_Id +"')";
        try {
            conexion.insertarBD(sql);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        } finally{
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        return true;
    }
    // ---------------------------- R de CRUD para Servicios --------------------
    public ArrayList<Servicio> consultarServicios(){
        // Lista con los objetos tipo "Servicio" que se va a devolver al front
        ArrayList<Servicio> lista = new ArrayList<>();
        
        // Llenar la lista
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT s.servicio_Id, s.servicio_Nombre, s.servicio_Precio, s.servicio_Estado_Id, e.estado_Nombre FROM `servicio` s JOIN `estados` e ON (servicio_Estado_Id = estado_id);";
        
        // Bloque TryCatch para obtener los errores e identificarlos
        try {
            ResultSet rs = conexion.consultarBD(sql);
            while(rs.next()){
                this.servicio_Id = rs.getInt("servicio_Id");
                this.servicio_Nombre = rs.getString("servicio_Nombre");
                this.servicio_Precio = rs.getInt("servicio_Precio");
                this.servicio_Estado_Id = rs.getInt("servicio_Estado_Id");
                this.servicio_Estado_Nombre = rs.getString("estado_Nombre");
                
                // Creando el objeto
                Servicio servicio = new Servicio();
                servicio.setServicio_Id(servicio_Id);
                servicio.setServicio_Nombre(servicio_Nombre);
                servicio.setServicio_Precio(servicio_Precio);
                servicio.setServicio_Estado_Id(servicio_Estado_Id);
                servicio.setServicio_Estado_Nombre(servicio_Estado_Nombre);
                
                // Agregando el objeto creado a la lista
                lista.add(servicio);
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
    public ArrayList<Servicio> consultarServicio(){
        
        ArrayList<Servicio> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT s.servicio_Id, s.servicio_Nombre, s.servicio_Precio, s.servicio_Estado_Id, e.estado_Nombre FROM `servicio` s JOIN `estados` e ON (servicio_Estado_Id = estado_id)";
        
        if(this.servicio_Id != 0){
            sql += " WHERE s.servicio_Id = "+ this.servicio_Id +";";
        }
        else if(this.servicio_Nombre != null){
            sql += " WHERE s.servicio_Nombre LIKE '%"+ this.servicio_Nombre +"%';";
        }
        else if(this.servicio_Precio != 0){
            sql += " WHERE s.servicio_Precio = "+ this.servicio_Precio +";";
        }
        else if(this.servicio_Estado_Id != 0){
            sql += " WHERE s.servicio_Estado_Id = "+ this.servicio_Estado_Id +";";
        }else{
            sql += ";";
        }
//        System.out.println(sql);
        
        // Bloque TryCatch para obtener los errores e identificarlos
        try {
            ResultSet rs = conexion.consultarBD(sql);
            while(rs.next()){
                this.servicio_Id = rs.getInt("servicio_Id");
                this.servicio_Nombre = rs.getString("servicio_Nombre");
                this.servicio_Precio = rs.getInt("servicio_Precio");
                this.servicio_Estado_Id = rs.getInt("servicio_Estado_Id");
                this.servicio_Estado_Nombre = rs.getString("estado_Nombre");
            
                // Creando el objeto
                Servicio servicio = new Servicio();
                servicio.setServicio_Id(servicio_Id);
                servicio.setServicio_Nombre(servicio_Nombre);
                servicio.setServicio_Precio(servicio_Precio);
                servicio.setServicio_Estado_Id(servicio_Estado_Id);
                servicio.setServicio_Estado_Nombre(servicio_Estado_Nombre);
                
                // Agregando el objeto creado a la lista
                lista.add(servicio);
            }
            
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        if(lista.size()>0){
            return lista;
        }else{
            return null;
        }
    }
    
    // ---------------------------- U de CRUD para Servicios --------------------
    public boolean actualizarServicio(){
        ConexionBD conexion = new ConexionBD();
        // Condiciones para validar la actualizacion de servicio_Estado_Id
        if(this.servicio_Estado_Nombre == "Habilitado") this.servicio_Estado_Id = 1;
        if(this.servicio_Estado_Nombre == "Deshabilitado")this.servicio_Estado_Id = 2;
        if(this.servicio_Estado_Id == 1) this.servicio_Estado_Nombre = "Habilitado";
        if(this.servicio_Estado_Id == 2) this.servicio_Estado_Nombre = "Deshabilitado";
        // Se pepara el query para actualizar con los datos del objeto
        String sql = "UPDATE `servicio` SET `servicio_Nombre`='" + this.servicio_Nombre + "',`servicio_Precio`='" + this.servicio_Precio + "',`servicio_Estado_Id`='" + this.servicio_Estado_Id + "' WHERE `servicio_Id`='" + this.servicio_Id + "';";
        try {
            conexion.actualizarBD(sql);
            System.out.println("Servicio actualizado");
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        } finally{
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        return true;
    }
    // ---------------------------- D de CRUD para Servicios --------------------
        public boolean eliminarServicio(){
        ConexionBD conexion = new ConexionBD();
        // Se pepara el query para eliminar con los datos del objeto
        String sql = "DELETE FROM `servicio` WHERE servicio_Id=" + this.servicio_Id + ";";
        try {
            conexion.borrarBD(sql);
            System.out.println("Servicio eliminado");
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        } finally{
            conexion.cerrarConexion();
            System.out.println("Conexion cerrada");
        }
        return true;
    }
//    metodo public void main para verificar el funcionamiento de los metodos   
    public static void main(String[] args) {
//        ArrayList<Servicio> lista = new ArrayList<>();
//        Servicio se = new Servicio();
//        se.setServicio_Nombre("Instalacion de Software");
//        se.setServicio_Precio(30000);
//        se.setServicio_Estado_Id(1);
//        se.crearServicio();
//        lista = se.consultarServicios();
//        for(Servicio servicio: lista){
//            System.out.println(servicio.toString());
//        }
    }
}
