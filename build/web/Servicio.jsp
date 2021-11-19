<%-- 
    Document   : Servicio
    Created on : 17/11/2021, 08:15:46 PM
    Author     : AlvarezCuadros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style> .row .col-sm-6 {border:2px} </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="#">Servicio Leon</a>
              </div>
              <ul class="nav navbar-nav">
                <li class="active"><a href="Servicio.jsp">Servicios</a></li>
                <li><a href="Cita.jsp">Citas</a></li>
              </ul>
            </div>
         </nav>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <form action="#" method="POST">
                        <div class="row">
                            <input type="text" class="form-control" name="servicio_Nombre" placeholder="Nombre" required=""><br>
                            <input type="number" class="form-control" name="servicio_Precio" placeholder="Precio" min="1" max="99999" required=""><br>
                            <select class="form-control" name="servicio_Estado_Id" placeholder="Precio" required="">
                                <option selected="" disabled="">Elija un estado</option>
                                <option value="1">Habilitado</option>
                                <option value="2">Deshabilitado</option>
                            </select><br>
                            <input type="submit" value="Enviar"><br>
                        </div>
                        
                    </form>
                </div>
                <div class="col-sm-6">
                    a todos
                </div>
            </div>
        </div>
    </body>
</html>
