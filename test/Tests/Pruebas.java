/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tests;

import Logica.Servicio;
import java.util.ArrayList;

/**
 *
 * @author AlvarezCuadros
 */
public class Pruebas {
    public static void main(String[] args) {
        ArrayList<Servicio> lista = new ArrayList<>();
        Servicio se = new Servicio();
        se.setServicio_Id(12);
        lista = se.consultarServicio();
        for(Servicio servicio: lista){
            System.out.println(servicio.toString());
        }
    }
}
