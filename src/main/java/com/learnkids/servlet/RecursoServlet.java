
package com.learnkids.servlet;

import com.learnkids.dao.RecursoDAO;
import com.learnkids.modelo.RecursoEducativo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/recursos")
public class RecursoServlet extends HttpServlet {

    private RecursoDAO recursoDAO;

    @Override
    public void init() {
        recursoDAO = new RecursoDAO();
    }

    // MÉTODO GET: consultar, ver o editar recursos
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idParametro = request.getParameter("id");
        String editarParametro = request.getParameter("editar");

        // CONSULTAR UN RECURSO PARA EDITAR
        if (editarParametro != null
                && !editarParametro.trim().isEmpty()) {

            try {

                int id = Integer.parseInt(editarParametro);

                RecursoEducativo recurso = recursoDAO.buscarPorId(id);

                if (recurso == null) {
                    response.sendError(
                            HttpServletResponse.SC_NOT_FOUND,
                            "No se encontró el recurso que deseas editar."
                    );
                    return;
                }

                request.setAttribute("recurso", recurso);

                request.getRequestDispatcher("/editar-recurso.jsp")
                        .forward(request, response);

            } catch (NumberFormatException e) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "El identificador del recurso no es válido."
                );
            }

        // CONSULTAR UN RECURSO PARA VER SUS DETALLES
        } else if (idParametro != null
                && !idParametro.trim().isEmpty()) {

            try {

                int id = Integer.parseInt(idParametro);

                RecursoEducativo recurso = recursoDAO.buscarPorId(id);

                if (recurso == null) {
                    response.sendError(
                            HttpServletResponse.SC_NOT_FOUND,
                            "No se encontró el recurso solicitado."
                    );
                    return;
                }

                request.setAttribute("recurso", recurso);

                request.getRequestDispatcher("/detalle-recurso.jsp")
                        .forward(request, response);

            } catch (NumberFormatException e) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "El identificador del recurso no es válido."
                );
            }

        } else {

            // CONSULTAR TODOS LOS RECURSOS
            List<RecursoEducativo> lista = recursoDAO.listar();

            System.out.println(
                    "TOTAL DE RECURSOS ENCONTRADOS: " + lista.size()
            );

            request.setAttribute("recursos", lista);

            request.getRequestDispatcher("/recursos.jsp")
                    .forward(request, response);
        }
    }

    // MÉTODO POST: registrar, actualizar o eliminar
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        boolean resultado = false;

        try {

            if ("registrar".equals(accion)
                    || "actualizar".equals(accion)) {

                RecursoEducativo recurso = new RecursoEducativo();

                recurso.setTitulo(request.getParameter("titulo"));

                recurso.setDescripcion(
                        request.getParameter("descripcion")
                );

                recurso.setTipo(request.getParameter("tipo"));

                recurso.setCategoria(
                        request.getParameter("categoria")
                );

                recurso.setEdadRecomendada(
                        request.getParameter("edad_recomendada")
                );

                recurso.setArchivo(request.getParameter("archivo"));

                if ("registrar".equals(accion)) {

                    resultado = recursoDAO.registrar(recurso);

                } else {

                    recurso.setId(
                            Integer.parseInt(
                                    request.getParameter("id")
                            )
                    );

                    resultado = recursoDAO.actualizar(recurso);
                }

            } else if ("eliminar".equals(accion)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                resultado = recursoDAO.eliminar(id);
            }

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "El identificador del recurso no es válido."
            );

            return;
        }

        String mensaje = resultado
                ? "operacionExitosa"
                : "operacionFallida";

        response.sendRedirect(
                request.getContextPath()
                + "/recursos?mensaje=" + mensaje
        );
    }
}
