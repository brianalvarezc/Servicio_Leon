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
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    </head>
    <body>
         <!--Navbar--> 
        <jsp:include page="menu.jsp"/>

        <!-- Cuerpo de la pagina Citas -->
        <!-- Dividir la pagina para llenar campos y que aparezcan los mismos campos en otro lado en la misma forma -->
        <div class="container-fluid" ng-app="cita" ng-controller="citaController as cc">
            <div class="row">
                <div class="col-sm-2 form-group"><!--Panel izquierdo-->
                    <!--<input type="text" disabled class="form-control" name="proceso" value="listar">-->
                    <input type="text" class="form-control" name="cita_Id" placeholder="Id" ng-model="cc.cita_Id">
                    <input type="text" class="form-control" name="cita_Cliente" placeholder="Cliente" ng-model="cc.cita_Cliente_Nombre">
                    <input type="text" class="form-control" name="cita_Servicio_Id" placeholder="Servicio" ng-model="cc.cita_Servicio_Id">
                    <input type="text" class="form-control" name="cita_Fecha" placeholder="Fecha" ng-model="cc.cita_Fecha">
                    <input type="text" class="form-control" name="cita_Hora" placeholder="Hora" ng-model="cc.cita_Hora">
                    <input type="text" class="form-control" name="cita_Ubicacion" placeholder="Ubicaci&oacute;n" ng-model="cc.cita_Ubicacion">
                    <select class="form-control" name="cita_Estado" ng-model="cc.cita_Estado_Id">
                        <option value="" selected disabled>Seleccione</option>
                        <option value="1">Habilitado</option>
                        <option value="2">Deshabilitado</option>
                    </select>
                    <div class="btn-group">
                        <button class="btn btn-primary btn-xs" ng-click="cc.guardar()">C</button>
                        <button class="btn btn-primary btn-xs" ng-click="cc.listar()">R</button>
                        <button class="btn btn-primary btn-xs" ng-click="cc.actualizar()">U</button>
                        <button class="btn btn-primary btn-xs" ng-click="cc.eliminar()">D</button>
                    </div>
                </div>
                
                <div class="col-sm-10"><!--espacio de la tabla-->
                    <table class="table table-hover">
                        <thead>
                            <th>Id</th>
                            <th>Cliente</th>
                            <th>Servicio</th>
                            <th>Servicio Id</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Ubicaci&oacute;n</th>
                            <th>Estado</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </thead>
                        <tbody>
                            <tr ng-repeat="c in cc.citas">
                                <td>{{c.cita_Id}}</td>
                                <td>{{c.cita_Cliente_Nombre}}</td>
                                <td>{{c.cita_Servicio_Nombre}}</td>
                                <td>{{c.cita_Servicio_Id}}</td>
                                <td>{{c.cita_Fecha}}</td>
                                <td>{{c.cita_Hora}}</td>
                                <td><a href="{{c.cita_Ubicacion}}" target="_blank">Ver Mapa</a></td>
                                <td>{{c.cita_Estado_Nombre}}</td>
                                <td><button class="btn btn-primary btn-xs" ng-click="cc.consultarIndividual(c.cita_Id)">Editar</button></td>
                                <td><button class="btn btn-danger btn-xs" ng-click="cc.eliminar(c.cita_Id)">Eliminar</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--######################## Script para las funcionalidades ###################################-->
        <script>
            var app = angular.module('cita', []);
            app.controller('citaController', ['$http', controladorCita]);
            function controladorCita($http){
                var cc = this;
                cc.listar = function(){
                    var parametros = {
                        proceso:"listar"
                    };
                    $http({
                        method:'POST',
                        url:'peticionesCita.jsp',
                        params:parametros                        
                    }).then(function(respuesta){
                        cc.citas = respuesta.data.Citas;
                    });
                };
                cc.guardar = function(){
                    var parametros = {
                        proceso:'guardar',
                        cita_Cliente_Nombre: cc.cita_Cliente_Nombre,
                        cita_Servicio_Id: cc.cita_Servicio_Id,
                        cita_Fecha: cc.cita_Fecha,
                        cita_Hora: cc.cita_Hora,
                        cita_Ubicacion: cc.cita_Ubicacion,
                        cita_Estado_Id: cc.cita_Estado_Id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCita.jsp',
                        params: parametros
                    }).then(function(respuesta){
                        if(respuesta.data.ok === true){
                            if(respuesta.data.guardar === true){
                                alert('Guardado');
                            }else{
                                alert('No Guardado');
                            }
                        }else{
                            alert(respuesta.data.errorMsg);
                        }
                    });
                    
                };
                cc.actualizar = function(){
                    var parametros = {
                        proceso: 'actualizar',
                        cita_Id: cc.cita_Id,
                        cita_Cliente_Nombre: cc.cita_Cliente_Nombre,
                        cita_Servicio_Id: cc.cita_Servicio_Id,
                        cita_Fecha: cc.cita_Fecha,
                        cita_Hora: cc.cita_Hora,
                        cita_Ubicacion: cc.cita_Ubicacion,
                        cita_Estado_Id: cc.cita_Estado_Id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCita.jsp',
                        params: parametros
                    }).then(function(respuesta){
                        if(respuesta.data.ok === true){
                            if(respuesta.data.actualizar === true){
                                alert('Servicio actualizado');
                            }else{
                                alert('Servicio no actualizado');
                            }
                        }else{
                            alert(respuesta.data.errorMesg)
                        }
                    });
                };
                cc.eliminar = function(id){
                    var parametros = {
                        proceso: 'eliminar',
                        cita_Id: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCita.jsp',
                        params: parametros
                    }).then(function(respuesta){
                        if(respuesta.data.ok === true){
                            if(respuesta.data.eliminar === true){
                                alert('Eliminado');
                            }else{
                                alert('No Eliminado');
                            }
                        }else{
                            alert(respuesta.data.errorMsg);
                        }
                    });
                };
                cc.consultarIndividual = function(id){
//                    alert('El id seleccionado es: ' + id);
                    var parametros = {
                        proceso: 'listarIndividual',
                        cita_Id: id                        
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCita.jsp',
                        params: parametros
                    }).then(function(respuesta){
                        if(respuesta.data.ok === true){
                            if(respuesta.data.listarIndividual === true){
                                cc.cita_Id = respuesta.data.Citas[0].cita_Id
                                cc.cita_Cliente_Nombre = respuesta.data.Citas[0].cita_Cliente_Nombre,
                                cc.cita_Servicio_Id = respuesta.data.Citas[0].cita_Servicio_Id,
                                cc.cita_Servicio_Nombre = respuesta.data.Citas[0].cita_Servicio_Nombre,
                                cc.cita_Fecha = respuesta.data.Citas[0].cita_Fecha,
                                cc.cita_Hora = respuesta.data.Citas[0].cita_Hora,
                                cc.cita_Ubicacion = respuesta.data.Citas[0].cita_Ubicacion,
                                cc.cita_Estado_Id = respuesta.data.Citas[0].cita_Estado_Id,
                                cc.cita_Estado_Nombre = respuesta.data.Citas[0].cita_Estado_Nombre
                            }else{
                                alert('No se pudo cargar el registro');
                            };
                        }else{
                            alert(respuesta.data.errorMsg);
                        };
                    });
                };
                init = function(){
                    cc.listar();
                };
                init();
            }
        </script>
    </body>
</html>
