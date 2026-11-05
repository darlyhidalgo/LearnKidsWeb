package com.learnkids.dao;

import com.learnkids.conexion.Conexion;
import com.learnkids.modelo.RecursoEducativo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RecursoDAO {

    // REGISTRAR RECURSO
    public boolean registrar(RecursoEducativo recurso) {

        String sql = "INSERT INTO recursos_educativos "
                + "(titulo, descripcion, tipo, categoria, "
                + "edad_recomendada, archivo) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = Conexion.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, recurso.getTitulo());
            ps.setString(2, recurso.getDescripcion());
            ps.setString(3, recurso.getTipo());
            ps.setString(4, recurso.getCategoria());
            ps.setString(5, recurso.getEdadRecomendada());
            ps.setString(6, recurso.getArchivo());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error al registrar: " + e.getMessage());
            return false;
        }
    }

    // CONSULTAR TODOS LOS RECURSOS
    public List<RecursoEducativo> listar() {

        List<RecursoEducativo> recursos = new ArrayList<>();

        String sql = "SELECT * FROM recursos_educativos";

        try (Connection con = Conexion.conectar();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                RecursoEducativo recurso = new RecursoEducativo();

                recurso.setId(rs.getInt("id_recurso"));
                recurso.setTitulo(rs.getString("titulo"));
                recurso.setDescripcion(rs.getString("descripcion"));
                recurso.setTipo(rs.getString("tipo"));
                recurso.setCategoria(rs.getString("categoria"));

                recurso.setEdadRecomendada(
                        rs.getString("edad_recomendada")
                );

                recurso.setArchivo(rs.getString("archivo"));

                recursos.add(recurso);
            }

        } catch (SQLException e) {
            System.out.println("Error al consultar: " + e.getMessage());
        }

        return recursos;
    }

    // CONSULTAR UN RECURSO POR SU ID
    public RecursoEducativo buscarPorId(int id) {

        String sql = "SELECT * FROM recursos_educativos "
                + "WHERE id_recurso = ?";

        try (Connection con = Conexion.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    RecursoEducativo recurso = new RecursoEducativo();

                    recurso.setId(rs.getInt("id_recurso"));
                    recurso.setTitulo(rs.getString("titulo"));
                    recurso.setDescripcion(rs.getString("descripcion"));
                    recurso.setTipo(rs.getString("tipo"));
                    recurso.setCategoria(rs.getString("categoria"));

                    recurso.setEdadRecomendada(
                            rs.getString("edad_recomendada")
                    );

                    recurso.setArchivo(rs.getString("archivo"));

                    return recurso;
                }
            }

        } catch (SQLException e) {
            System.out.println(
                    "Error al buscar recurso: " + e.getMessage()
            );
        }

        return null;
    }

    // ACTUALIZAR RECURSO
    public boolean actualizar(RecursoEducativo recurso) {

        String sql = "UPDATE recursos_educativos SET "
                + "titulo=?, descripcion=?, tipo=?, categoria=?, "
                + "edad_recomendada=?, archivo=? "
                + "WHERE id_recurso=?";

        try (Connection con = Conexion.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, recurso.getTitulo());
            ps.setString(2, recurso.getDescripcion());
            ps.setString(3, recurso.getTipo());
            ps.setString(4, recurso.getCategoria());
            ps.setString(5, recurso.getEdadRecomendada());
            ps.setString(6, recurso.getArchivo());
            ps.setInt(7, recurso.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error al actualizar: " + e.getMessage());
            return false;
        }
    }

    // ELIMINAR RECURSO
    public boolean eliminar(int id) {

        String sql = "DELETE FROM recursos_educativos "
                + "WHERE id_recurso=?";

        try (Connection con = Conexion.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error al eliminar: " + e.getMessage());
            return false;
        }
    }
}