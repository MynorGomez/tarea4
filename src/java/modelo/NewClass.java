/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author J
 */

public class NewClass {
    public static void main(String[] args) {
        // Crear un objeto empleado de prueba
        Empleado emp = new Empleado(
                "E001",          // codigo
                0,               // id (no importa porque es AUTO_INCREMENT)
                1,               // id_puesto (asegúrate que exista en tu tabla "puestos")
                "Juan",          // nombres
                "Pérez",         // apellidos
                "Guatemala",     // direccion
                "12345678",      // telefono
                "2000-01-01"     // fecha_nacimiento (formato YYYY-MM-DD)
        );

        // Intentar insertar
        emp.crear();
    }
}

    