 <%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Servicio"%>
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
            
            String servicio_Nombre = request.getParameter("servicio_Nombre");
//          String servicio_Estado_Nombre = request.getParameter("servicio_Estado_Nombre");
            int servicio_Precio = Integer.parseInt(request.getParameter("servicio_Precio"));
            int servicio_Estado_Id = Integer.parseInt(request.getParameter("servicio_Estado_Id"));
            
            Servicio s = new Servicio();
            s.setServicio_Nombre(servicio_Nombre);
            s.setServicio_Estado_Id(servicio_Estado_Id);
//          s.setServicio_Estado_Nombre(servicio_Estado_Nombre);
            s.setServicio_Precio(servicio_Precio);
            

            if (s.crearServicio()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            
            int servicio_Id = Integer.parseInt(request.getParameter("servicio_Id"));
            Servicio s = new Servicio();
            s.setServicio_Id(servicio_Id);
            
            if (s.eliminarServicio()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
                Servicio servicio = new Servicio();
                List<Servicio> lista = servicio.consultarServicios();
                respuesta += "\"" + proceso + "\": true,\"Servicios\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Servicios\":[]";
                Logger.getLogger(Servicio.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("listarIndividual")) {
            
            int servicio_Id = Integer.parseInt(request.getParameter("servicio_Id"));
            
            Servicio s = new Servicio();
            
            try {
                s.setServicio_Id(servicio_Id);
                List<Servicio> lista = s.consultarServicio();
                respuesta += "\"" + proceso + "\": true,\"Servicios\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Servicios\":[]";
                Logger.getLogger(Servicio.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int servicio_Id = Integer.parseInt(request.getParameter("servicio_Id"));
            String servicio_Nombre = request.getParameter("servicio_Nombre");
            int servicio_Estado_Id = Integer.parseInt(request.getParameter("servicio_Estado_Id"));
            String servicio_Estado_Nombre = request.getParameter("servicio_Estado_Nombre");
            int servicio_Precio = Integer.parseInt(request.getParameter("servicio_Precio"));
            
            Servicio s = new Servicio();
            s.setServicio_Id(servicio_Id);
            s.setServicio_Nombre(servicio_Nombre);
            s.setServicio_Estado_Id(servicio_Estado_Id);
            s.setServicio_Estado_Nombre(servicio_Estado_Nombre);
            s.setServicio_Precio(servicio_Precio);
            
            if (s.actualizarServicio()) {                     
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
                + " son invalidos. Corrijalos y vuelva a intentar por favor.\"";
    }    
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>