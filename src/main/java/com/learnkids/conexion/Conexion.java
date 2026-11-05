package com.learnkids.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private static final String URL =
            "jdbc:mysql://localhost:3306/learnkids_db";

    private static final String USUARIO = "root";

    private static final String CONTRASENA = "";

    public static Connection conectar() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    URL, USUARIO, CONTRASENA
            );

            System.out.println("CONEXION EXITOSA CON MYSQL");

            return conexion;

        } catch (Exception e) {

            throw new RuntimeException(
                    "No se pudo conectar con la base de datos LearnKids.", e
            );
        }
    }
}