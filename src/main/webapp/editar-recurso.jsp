<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.learnkids.modelo.RecursoEducativo" %>

<%
    RecursoEducativo recurso =
        (RecursoEducativo) request.getAttribute("recurso");

    if (recurso == null) {
        response.sendRedirect(request.getContextPath() + "/recursos");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>LearnKids | Editar recurso</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f7ff;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        header {
            background: #4a90e2;
            color: white;
            text-align: center;
            padding: 20px;
            border-radius: 12px;
        }

        main {
            max-width: 700px;
            margin: 30px auto;
        }

        section {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            color: #357abd;
            text-align: center;
        }

        label {
            font-weight: bold;
        }

        input, textarea, select {
            width: 100%;
            padding: 11px;
            margin: 8px 0 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        textarea {
            min-height: 100px;
            resize: vertical;
        }

        .botones {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        button, .volver {
            padding: 12px 20px;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            text-align: center;
        }

        button {
            background: #4a90e2;
            color: white;
        }

        button:hover {
            background: #357abd;
        }

        .volver {
            background: #ddd;
            color: #333;
        }

        .volver:hover {
            background: #ccc;
        }
    </style>
</head>

<body>

<header>
    <h1>LearnKids</h1>
    <p>Edición de recursos educativos</p>
</header>

<main>

    <section>

        <h2>Actualizar recurso educativo</h2>

        <form action="<%= request.getContextPath() %>/recursos"
              method="post">

            <input type="hidden" name="accion" value="actualizar">

            <input type="hidden" name="id"
                   value="<%= recurso.getId() %>">

            <label>Título:</label>
            <input type="text"
                   name="titulo"
                   value="<%= recurso.getTitulo() %>"
                   required>

            <label>Descripción:</label>
            <textarea name="descripcion"
                      required><%= recurso.getDescripcion() %></textarea>

            <label>Tipo de recurso:</label>
            <select name="tipo" required>

                <option value="Cuento"
                    <%= "Cuento".equals(recurso.getTipo()) ? "selected" : "" %>>
                    Cuento
                </option>

                <option value="Canción"
                    <%= "Canción".equals(recurso.getTipo()) ? "selected" : "" %>>
                    Canción
                </option>

                <option value="Juego"
                    <%= "Juego".equals(recurso.getTipo()) ? "selected" : "" %>>
                    Juego
                </option>

                <option value="Actividad"
                    <%= "Actividad".equals(recurso.getTipo()) ? "selected" : "" %>>
                    Actividad
                </option>

            </select>

            <label>Categoría:</label>
            <select name="categoria" required>

                <option value="Lectura"
                    <%= "Lectura".equals(recurso.getCategoria()) ? "selected" : "" %>>
                    Lectura
                </option>

                <option value="Matemáticas"
                    <%= "Matemáticas".equals(recurso.getCategoria()) ? "selected" : "" %>>
                    Matemáticas
                </option>

                <option value="Colores"
                    <%= "Colores".equals(recurso.getCategoria()) ? "selected" : "" %>>
                    Colores
                </option>

                <option value="Formas"
                    <%= "Formas".equals(recurso.getCategoria()) ? "selected" : "" %>>
                    Formas
                </option>

                <option value="Vocales"
                    <%= "Vocales".equals(recurso.getCategoria()) ? "selected" : "" %>>
                    Vocales
                </option>

            </select>

            <label>Edad recomendada:</label>
            <input type="number"
                   name="edad_recomendada"
                   min="3"
                   max="7"
                   value="<%= recurso.getEdadRecomendada() %>"
                   required>

            <label>Archivo o ruta del recurso:</label>
            <input type="text"
                   name="archivo"
                   value="<%= recurso.getArchivo() == null ? "" : recurso.getArchivo() %>">

            <div class="botones">

                <button type="submit">
                    Guardar cambios
                </button>

                <a href="<%= request.getContextPath() %>/recursos"
                   class="volver">
                    Cancelar
                </a>

            </div>

        </form>

    </section>

</main>

</body>
</html>