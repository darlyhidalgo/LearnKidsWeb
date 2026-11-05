<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LearnKids | Inicio</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff;
            margin: 0;
            text-align: center;
        }

        header {
            background-color: #4a90e2;
            color: white;
            padding: 25px;
        }

        main {
            margin: 60px auto;
            max-width: 650px;
            padding: 30px;
            background-color: white;
            border-radius: 15px;
        }

        h2 {
            color: #357abd;
        }

        p {
            color: #555;
            line-height: 1.6;
        }

        a {
            display: inline-block;
            background-color: #ffb84d;
            color: #333;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        a:hover {
            background-color: #ffa726;
        }
    </style>
</head>

<body>

    <header>
        <h1>LearnKids</h1>
        <p>Aprender jugando es más divertido</p>
    </header>

    <main>
        <h2>¡Bienvenido a LearnKids!</h2>

        <p>
            Una plataforma educativa diseñada para que los niños
            aprendan mediante cuentos, canciones, juegos y actividades
            interactivas.
        </p>

        <a href="${pageContext.request.contextPath}/recursos">
            Gestionar recursos educativos
        </a>
    </main>