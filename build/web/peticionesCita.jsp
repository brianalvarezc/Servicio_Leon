<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="Logica.Cita"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";
    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar",
        "listarIndividual"
    
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar 
            
            String cita_Cliente_Nombre = request.getParameter("cita_Cliente_Nombre");
            int cita_Servicio_Id = Integer.valueOf(request.getParameter("cita_Servicio_Id"));
            String cita_Fecha = request.getParameter("cita_Fecha");
            String cita_Hora = request.getParameter("cita_Hora");
            String cita_Ubicacion = request.getParameter("cita_Ubicacion");
            int cita_Estado_Id = Integer.valueOf(request.getParameter("cita_Estado_Id"));
            
            // Creando el objeto Cita
            Cita cita = new Cita();
            cita.setCita_Cliente_Nombre(cita_Cliente_Nombre);
            cita.setCita_Estado_Id(cita_Estado_Id);
            cita.setCita_Servicio_Id(cita_Servicio_Id);
            cita.setCita_Fecha(cita_Fecha);
            cita.setCita_Hora(cita_Hora);
            cita.setCita_Ubicacion(cita_Ubicacion);

            if (cita.crearCita()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            int cita_Id = Integer.valueOf(request.getParameter("cita_Id"));
            Cita cita = new Cita();
            cita.setCita_Id(cita_Id);
            
            if (cita.eliminarCita()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
                Cita cita = new Cita();
                List<Cita> lista = cita.consultarCitas();
                respuesta += "\"" + proceso + "\": true,\"Citas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Citas\":[]";
                Logger.getLogger(Cita.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("listarIndividual")) {
            
            int cita_Id = Integer.parseInt(request.getParameter("cita_Id"));
            
            Cita c = new Cita();
            
            try {
                c.setCita_Id(cita_Id);
                List<Cita> lista = c.consultarCita();
                respuesta += "\"" + proceso + "\": true,\"Citas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Citas\":[]";
                Logger.getLogger(Cita.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int cita_Id = Integer.valueOf(request.getParameter("cita_Id"));
            String cita_Cliente_Nombre = request.getParameter("cita_Cliente_Nombre");
            int cita_Servicio_Id = Integer.valueOf(request.getParameter("cita_Servicio_Id"));
            int cita_Estado_Id = Integer.valueOf(request.getParameter("cita_Estado_Id"));
            //String cita_Estado_Nombre = request.getParameter("cita_Estado_Nombre");
            String cita_Fecha = request.getParameter("cita_Fecha");
            String cita_Hora = request.getParameter("cita_Hora");
            String cita_Ubicacion = request.getParameter("cita_Ubicacion");
            
            // Creando el objeto Cita
            Cita cita = new Cita();
            cita.setCita_Cliente_Nombre(cita_Cliente_Nombre);
            cita.setCita_Id(cita_Id);
            cita.setCita_Estado_Id(cita_Estado_Id);
            //cita.setCita_Estado_Nombre(cita_Estado_Nombre);
            cita.setCita_Fecha(cita_Fecha);
            cita.setCita_Hora(cita_Hora);
            cita.setCita_Ubicacion(cita_Ubicacion);
            if (cita.actualizarCita()) {                     
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
        
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }    
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>

