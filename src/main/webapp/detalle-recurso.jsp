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

    <title>Detalle del recurso - LearnKids</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            padding: 30px;
            background-color: #f2f6fc;
            color: #333;
        }

        .contenedor {
            max-width: 750px;
            margin: 30px auto;
            padding: 35px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        h1 {
            text-align: center;
            color: #2864b4;
            margin-bottom: 10px;
        }

        .subtitulo {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
        }

        .dato {
            padding: 15px;
            margin-bottom: 12px;
            background-color: #f5f8fd;
            border-radius: 8px;
        }

        .dato strong {
            display: block;
            color: #2864b4;
            margin-bottom: 7px;
        }

        .dato span {
            overflow-wrap: anywhere;
        }

        .botones {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .boton {
            display: inline-block;
            padding: 12px 25px;
            background-color: #2864b4;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        .boton:hover {
            background-color: #194b91;
        }
    </style>
</head>

<body>

    <div class="contenedor">

        <h1>LearnKids</h1>

        <p class="subtitulo">
            Información detallada del recurso educativo
        </p>

        <div class="dato">
            <strong>ID del recurso</strong>
            <span><%= recurso.getId() %></span>
        </div>

        <div class="dato">
            <strong>Título</strong>
            <span><%= recurso.getTitulo() %></span>
        </div>

        <div class="dato">
            <strong>Descripción</strong>
            <span><%= recurso.getDescripcion() %></span>
        </div>

        <div class="dato">
            <strong>Tipo de recurso</strong>
            <span><%= recurso.getTipo() %></span>
        </div>

        <div class="dato">
            <strong>Categoría</strong>
            <span><%= recurso.getCategoria() %></span>
        </div>

        <div class="dato">
            <strong>Edad recomendada</strong>
            <span><%= recurso.getEdadRecomendada() %></span>
        </div>

        <div class="dato">
            <strong>Archivo</strong>
            <span><%= recurso.getArchivo() %></span>
        </div>

        <div class="botones">
            <a href="<%= request.getContextPath() %>/recursos"
               class="boton">
                Volver a los recursos
            </a>
        </div>

    </div>

</body>
</html>