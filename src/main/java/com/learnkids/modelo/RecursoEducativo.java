package com.learnkids.modelo;

public class RecursoEducativo {

    private int id;
    private String titulo;
    private String descripcion;
    private String tipo;
    private String categoria;
    private String edadRecomendada;
    private String archivo;

    public RecursoEducativo() {
    }

    public RecursoEducativo(String titulo, String descripcion,
            String tipo, String categoria,
            String edadRecomendada, String archivo) {

        this.titulo = titulo;
        this.descripcion = descripcion;
        this.tipo = tipo;
        this.categoria = categoria;
        this.edadRecomendada = edadRecomendada;
        this.archivo = archivo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getEdadRecomendada() {
        return edadRecomendada;
    }

    public void setEdadRecomendada(String edadRecomendada) {
        this.edadRecomendada = edadRecomendada;
    }

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }
}