
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
    
    // Metodos adicionales

    @Override
    public String toString() {
        return "Cita{" + "cita_Id=" + cita_Id + ", cita_Cliente_Nombre=" + cita_Cliente_Nombre + ", cita_Estado_Id=" + cita_Estado_Id + ", cita_Fecha=" + cita_Fecha + ", cita_Hora=" + cita_Hora + ", cita_Ubicacion=" + cita_Ubicacion + ", cita_Estado_Nombre=" + cita_Estado_Nombre + '}';
    }
        // ######################### Conexion a la BD desde la clase #########################
    // ---------------------------- C de CRUD para Citas --------------------
    public boolean crearCita(){
        ConexionBD conexion = new ConexionBD();
        if(this.cita_Estado_Nombre == "Habilitado") this.cita_Estado_Id = 1;
        if(this.cita_Estado_Nombre == "Deshabilitado") this.cita_Estado_Id = 2;
        String sql = "INSERT INTO `cita`(`cita_Cliente_Nombre`, `cita_Fecha`, `cita_Hora`, `cita_Ubicacion`, `cita_Estado_Id`) VALUES ('"+ this.cita_Cliente_Nombre +"','"+ this.cita_Fecha +"','"+ this.cita_Hora +"','"+ this.cita_Ubicacion +"','"+ this.cita_Estado_Id +"')";
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
        String sql = "SELECT c.cita_Id, c.cita_Cliente_Nombre, c.cita_Fecha, c.cita_Hora, c.cita_Ubicacion, e.estado_Nombre FROM cita c JOIN estados e ON (cita_Estado_Id = estado_Id);";
        
        // Bloque TryCatch para obtener los errores e identificarlos
        try {
            ResultSet rs = conexion.consultarBD(sql);
            while(rs.next()){
                this.cita_Id = rs.getInt("cita_Id");
                this.cita_Cliente_Nombre = rs.getString("cita_Cliente_Nombre");
                this.cita_Fecha = rs.getString("cita_Fecha");
                this.cita_Hora = rs.getString("cita_Hora");
                this.cita_Ubicacion = rs.getString("cita_Ubicacion");
                this.cita_Estado_Nombre = rs.getString("estado_Nombre");
                
                // Creando el objeto
                Cita cita = new Cita();
                cita.setCita_Id(cita_Id);
                cita.setCita_Cliente_Nombre(cita_Cliente_Nombre);
                cita.setCita_Estado_Nombre(cita_Estado_Nombre);
                cita.setCita_Fecha(cita_Fecha);
                cita.setCita_Hora(cita_Hora);
                cita.setCita_Ubicacion(cita_Ubicacion);
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
    
    // ---------------------------- U de CRUD para Citas --------------------
    public boolean actualizarCita(){
        ConexionBD conexion = new ConexionBD();
        // Condiciones para validar la actualizacion de cita_Estado_Id
        if(this.cita_Estado_Nombre == "Habilitado") this.cita_Estado_Id = 1;
        if(this.cita_Estado_Nombre == "Deshabilitado") this.cita_Estado_Id = 2;
        // Se pepara el query para actualizar con los datos del objeto
        String sql = "UPDATE `cita` SET `cita_Cliente_Nombre`='"+ this.cita_Cliente_Nombre +"',`cita_Fecha`='"+ this.cita_Fecha +"',`cita_Hora`='"+ this.cita_Hora +"',`cita_Ubicacion`='"+ this.cita_Ubicacion +"',`cita_Estado_Id`='"+ this.cita_Estado_Id +"' WHERE `cita_Id`='"+ this.cita_Id +"';";
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
    public static void main(String[] args) {
//        ArrayList<Cita> lista = new ArrayList<>();
//        Cita c = new Cita();
//        c.setCita_Id(4);
//        c.setCita_Cliente_Nombre("Kezia Mercado");
//        c.setCita_Estado_Nombre("Habilitado");
//        c.setCita_Fecha("21/11/2021");
//        c.setCita_Hora("15:50");
//        c.setCita_Ubicacion("https://www.google.com/maps/place/Comuna+1,+Santa+Marta,+Magdalena/@11.2226874,-74.2232033,14z/data=!3m1!4b1!4m12!1m6!3m5!1s0x8ef4f5a4c8487a55:0xde033284ae991bb7!2sEdificio+Beyreca+Calle15%23+3-36!8m2!3d11.2443486!4d-74.2122943!3m4!1s0x8ef4f59ab6580d83:0x66899463359bdae7!8m2!3d11.2243734!4d-74.209128?hl=es");
//        System.out.println(c.actualizarCita());
//        
//        lista = c.consultarCitas();
//        for(Cita cita: lista){
//            System.out.println(cita.toString());
//        }
    }
}
