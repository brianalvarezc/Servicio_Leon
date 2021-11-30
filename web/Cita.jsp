<%-- 
    Document   : Cita
    Created on : 17/11/2021, 08:15:58 PM
    Author     : AlvarezCuadros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas</title>
        <script src="ng/angular.min.js"></script>
    </head>
    <body>
         <!--Navbar--> 
        <jsp:include page="menu.jsp"/>

        <!-- Cuerpo de la pagina Citas -->
        <!-- Dividir la pagina para llenar campos y que aparezcan los mismos campos en otro lado en la misma forma -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2 form-group"><!--Panel izquierdo-->
                    <!--<input type="text" disabled class="form-control" name="proceso" value="listar">-->
                    <input type="text" class="form-control" name="cita_Id" placeholder="Id">
                    <input type="text" class="form-control" name="cita_Cliente" placeholder="Cliente">
                    <input type="text" class="form-control" name="cita_Servicio" placeholder="Servicio">
                    <input type="text" class="form-control" name="cita_Fecha" placeholder="Fecha">
                    <input type="text" class="form-control" name="cita_Hora" placeholder="Hora">
                    <input type="text" class="form-control" name="cita_Ubicacion" placeholder="Ubicaci&oacute;n">
                    <select class="form-control" name="cita_Estado" ng-model="sc.estado">
                        <option value="" selected disabled>Seleccione</option>
                        <option value="1">Habilitado</option>
                        <option value="2">Deshabilitado</option>
                    </select>
                    <div class="btn-group">
                        <button class="btn btn-primary btn-xs">C</button>
                        <button class="btn btn-primary btn-xs">R</button>
                        <button class="btn btn-primary btn-xs">U</button>
                        <button class="btn btn-primary btn-xs">D</button>
                    </div>
                </div>
                
                <div class="col-sm-10"><!--espacio de la tabla-->
                    <table class="table table-hover">
                        <thead>
                            <th>Id</th>
                            <th>Cliente</th>
                            <th>Servicio</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Ubicaci&oacute;n</th>
                            <th>Estado</th>
                        </thead>
                        <tbody>
                            <%
                                // codigo para que muestre los datos que trae de la tabla de la BD
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
