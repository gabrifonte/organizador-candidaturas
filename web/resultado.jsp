<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerTrack - Sucesso</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f2f5; color: #333; margin: 0; padding: 0; }
        .navbar { background-color: #2c3e50; color: white; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.2); }
        .navbar h2 { margin: 0; }
        .caixa-principal { background-color: #ffffff; width: 90%; max-width: 600px; margin: 60px auto; padding: 40px; border-radius: 4px; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1); border-top: 4px solid #27ae60; text-align: center; }
        h3 { color: #27ae60; margin-top: 0; margin-bottom: 20px; }
        .aviso { background-color: #e8f8f5; border: 1px solid #2ecc71; color: #27ae60; padding: 20px; border-radius: 4px; font-weight: bold; margin-bottom: 30px; }
        .btn-voltar { background-color: #3498db; color: white; text-decoration: none; padding: 12px 25px; border-radius: 3px; font-weight: bold; transition: 0.2s; display: inline-block; }
        .btn-voltar:hover { background-color: #2980b9; }
        .rodape { text-align: center; margin-top: 40px; padding-bottom: 20px; font-size: 0.85em; color: #7f8c8d; }
    </style>
</head>
<body>

    <div class="navbar">
        <h2>CareerTrack | Confirmação</h2>
    </div>

    <div class="caixa-principal">
        <h3>Transação Concluída</h3>
        
        <div class="aviso">
            A ação de <%= request.getAttribute("message") %> foi processada e salva no banco de dados com sucesso.
        </div>
        
        <a href="index.jsp" class="btn-voltar">Retornar ao Painel de Controle</a>
    </div>

    <div class="rodape">
        <strong>CareerTrack</strong> &copy; 2026<br>
        Projeto de Engenharia - Desenvolvedores: Gabriel Fontenele e Robson Ramon
    </div>

</body>
</html>