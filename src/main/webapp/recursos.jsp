
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.learnkids.modelo.RecursoEducativo" %>

<%
    List<RecursoEducativo> recursos =
        (List<RecursoEducativo>) request.getAttribute("recursos");

    String mensaje = request.getParameter("mensaje");
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>LearnKids | Recursos educativos</title>

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
            max-width: 1000px;
            margin: 25px auto;
        }

        section {
            background: white;
            padding: 22px;
            margin-bottom: 25px;
            border-radius: 12px;
        }

        h2 {
            color: #357abd;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin: 7px 0 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        button {
            background: #ffb84d;
            border: none;
            padding: 11px 18px;
            border-radius: 7px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background: #ffa726;
        }

        .eliminar {
            background: #ef7777;
            color: white;
        }

        .editar {
            background: #4a90e2;
            color: white;
        }

        .ver {
            background: #55b98b;
            color: white;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #dcecff;
        }

        .mensaje {
            padding: 12px;
            background: #e1f5e6;
            border-radius: 7px;
            margin-bottom: 15px;
        }

        .acciones form {
            display: inline-block;
            margin: 2px;
        }

        a {
            color: #357abd;
        }
    </style>
</head>

<body>

<header>
    <h1>LearnKids</h1>
    <p>Administración de recursos educativos</p>
</header>

<main>

    <section>
        <h2>Registrar recurso educativo</h2>

        <% if ("operacionExitosa".equals(mensaje)) { %>
            <p class="mensaje">
                La operación se realizó correctamente.
            </p>
        <% } else if ("operacionFallida".equals(mensaje)) { %>
            <p class="mensaje">
                No fue posible realizar la operación.
            </p>
        <% } %>

        <form action="<%= request.getContextPath() %>/recursos"
              method="post">

            <input type="hidden" name="accion" value="registrar">

            <label>Título:</label>
            <input type="text" name="titulo" required>

            <label>Descripción:</label>
            <textarea name="descripcion" required></textarea>

            <label>Tipo de recurso:</label>
            <select name="tipo" required>
                <option value="">Seleccionar</option>
                <option value="Cuento">Cuento</option>
                <option value="Canción">Canción</option>
                <option value="Juego">Juego</option>
                <option value="Actividad">Actividad</option>
            </select>

            <label>Categoría:</label>
            <select name="categoria" required>
                <option value="">Seleccionar</option>
                <option value="Lectura">Lectura</option>
                <option value="Matemáticas">Matemáticas</option>
                <option value="Colores">Colores</option>
                <option value="Formas">Formas</option>
                <option value="Vocales">Vocales</option>
            </select>

            <label>Edad recomendada:</label>
            <input type="number" name="edad_recomendada"
                   min="3" max="7" required>

            <label>Archivo o ruta del recurso:</label>
            <input type="text" name="archivo">

            <button type="submit">Registrar recurso</button>

        </form>
    </section>

    <section>
        <h2>Recursos registrados</h2>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Tipo</th>
                    <th>Categoría</th>
                    <th>Edad</th>
                    <th>Acciones</th>
                </tr>
            </thead>

            <tbody>

            <% if (recursos != null && !recursos.isEmpty()) {
                for (RecursoEducativo recurso : recursos) { %>

                <tr>
                    <td><%= recurso.getId() %></td>
                    <td><%= recurso.getTitulo() %></td>
                    <td><%= recurso.getTipo() %></td>
                    <td><%= recurso.getCategoria() %></td>
                    <td><%= recurso.getEdadRecomendada() %></td>

                    <td class="acciones">

                        <!-- BOTÓN VER -->
                        <form action="<%= request.getContextPath() %>/recursos"
                              method="get">

                            <input type="hidden" name="id"
                                   value="<%= recurso.getId() %>">

                            <button type="submit" class="ver">
                                Ver
                            </button>
                        </form>

                        <!-- BOTÓN EDITAR -->
                        <form action="<%= request.getContextPath() %>/recursos"
                              method="get">

                            <input type="hidden" name="editar"
                                   value="<%= recurso.getId() %>">

                            <button type="submit" class="editar">
                                Editar
                            </button>
                        </form>

                        <!-- BOTÓN ELIMINAR -->
                        <form action="<%= request.getContextPath() %>/recursos"
                              method="post"
                              onsubmit="return confirm('¿Deseas eliminar este recurso?');">

                            <input type="hidden" name="accion"
                                   value="eliminar">

                            <input type="hidden" name="id"
                                   value="<%= recurso.getId() %>">

                            <button type="submit" class="eliminar">
                                Eliminar
                            </button>
                        </form>

                    </td>
                </tr>

            <%  }
               } else { %>

                <tr>
                    <td colspan="6">
                        No hay recursos educativos registrados.
                    </td>
                </tr>

            <% } %>

            </tbody>
        </table>

        <p>
            <a href="<%= request.getContextPath() %>/index.jsp">
                Volver al inicio
            </a>
        </p>

    </section>

</main>

</body>
</html>
