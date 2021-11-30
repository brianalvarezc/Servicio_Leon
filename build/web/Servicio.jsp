<%-- 
    Document   : Servicio
    Created on : 17/11/2021, 08:15:46 PM
    Author     : AlvarezCuadros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    </head>
    <body>
         <!--Navbar--> 
        <jsp:include page="menu.jsp"/>
        
        <!-- Cuerpo de la pagina Citas -->
        <!-- Dividir la pagina para llenar campos y que aparezcan los mismos campos en otro lado en la misma forma -->
        <div class="container-fluid" ng-app="servicio" ng-controller="servicioController as sc">
            <div class="row">
                <div class="col-sm-2 form-group"><!--Panel izquierdo-->
                    <!--<input type="text" disabled class="form-control" name="proceso" value="listar">-->
                    <input type="text" class="form-control" name="servicio_Id" placeholder="Id" ng-model="sc.servicio_Id">
                    <input type="text" class="form-control" name="servicio_Nombre" placeholder="Servicio" ng-model="sc.servicio_Nombre">
                    <input type="text" class="form-control" name="servicio_Precio" placeholder="Precio" ng-model="sc.servicio_Precio">
                    <select class="form-control" name="servicio_Estado_Id" ng-model="sc.servicio_Estado_Id">
                        <option value="" selected disabled>Seleccione</option>
                        <option value="1">Habilitado</option>
                        <option value="2">Deshabilitado</option>
                    </select>
                    <div class="btn-group">
                        <button class="btn btn-primary btn-xs" ng-click="sc.guardar()">C</button>
                        <button class="btn btn-primary btn-xs" ng-click="sc.listar()">R</button>
                        <button class="btn btn-primary btn-xs" ng-click="sc.actualizar()">U</button>
                        <button class="btn btn-primary btn-xs" ng-click="sc.borrar()">D</button>
                    </div>
                </div>
                
                <div class="col-sm-10"><!--espacio de la tabla-->
                    <table class="table table-hover">
                        <thead>
                            <th>Id</th>
                            <th>Servicio</th>
                            <th>Precio</th>
                            <th>Estado</th>
                        </thead>
                        <tbody>
                            <tr ng-repeat="s in sc.servicios">
                                <td>{{s.servicio_Id}}</td>
                                <td>{{s.servicio_Nombre}}</td>
                                <td>{{s.servicio_Precio}}</td>
                                <td>{{s.servicio_Estado_Nombre}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('servicio', []);
            app.controller('servicioController', ['$http', controladorServicio]);
            function controladorServicio($http){
                var sc = this;
                sc.listar = function(){
                    var parametros = {
                        proceso:"listar"
                    };
                    $http({
                        method:'POST',
                        url:'peticionesServicio.jsp',
                        params:parametros                        
                    }).then(function(respuesta){
                        //alert(respuesta.data.Servicios[0].servicio_Nombre);
                        sc.servicios = respuesta.data.Servicios;
                    });
                };
                sc.guardar = function(){
                    var parametros = {
                        proceso:'guardar',
                        servicio_Id: sc.servicio_Id,
                        servicio_Nombre: sc.servicio_Nombre,
                        servicio_Precio: sc.servicio_Precio,
                        servicio_Estado_Id: sc.servicio_Estado_Id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesServicio.jsp',
                        params: parametros
                    }).then(function(respuesta){
                        if(respuesta.data.ok = true){
                            if(respuesta.data.guardar = true){
                                alert('Guardado');
                            }else{
                                alert('No Guardado');
                            }
                        }else{
                            alert(respuesta.data.errorMsg);
                        }
                    });
                    
                };
            }
        </script>
    </body>
</html>
