<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerTrack - Ops! Erro</title>
    <style>
        :root {
            --primary: #007aff;
            --primary-hover: #005bb5;
            --danger: #ff3b30;
            --background: #f5f5f7;
            --surface: #ffffff;
            --text-main: #1d1d1f;
            --text-muted: #86868b;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--background);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .container {
            background-color: var(--surface);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            text-align: center;
            max-width: 400px;
            width: 100%;
            border-top: 5px solid var(--danger);
        }

        .icon {
            font-size: 60px;
            margin-bottom: 10px;
        }

        h2 {
            margin: 0 0 10px 0;
            color: var(--text-main);
            font-size: 1.8rem;
        }

        p {
            color: var(--text-muted);
            margin-bottom: 30px;
            font-size: 1rem;
            line-height: 1.5;
        }

        .btn {
            background-color: var(--primary);
            color: white;
            padding: 12px 30px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.2s ease;
            display: inline-block;
        }

        .btn:hover {
            background-color: var(--primary-hover);
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="icon">⚠️</div>
        <h2>Ops! Algo deu errado.</h2>
        <p>Não foi possível processar a operação de <strong><%= request.getAttribute("message") != null ? request.getAttribute("message") : "Requisição" %></strong>. Verifique se você preencheu os campos corretamente (como o ID) e tente novamente.</p>
        
        <a href="index.jsp" class="btn">Voltar para o Início</a>
    </div>

</body>
</html>