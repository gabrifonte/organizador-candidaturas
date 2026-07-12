%@page import="model.Candidatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerTrack - Detalhes do Registro</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f2f5; color: #333; margin: 0; padding: 0; }
        .navbar { background-color: #2c3e50; color: white; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.2); }
        .navbar h2 { margin: 0; }
        .btn-nav { color: white; text-decoration: none; border: 1px solid white; padding: 8px 15px; border-radius: 3px; font-weight: bold; transition: 0.2s; }
        .btn-nav:hover { background-color: white; color: #2c3e50; }
        .caixa-principal { background-color: #ffffff; width: 90%; max-width: 900px; margin: 40px auto; padding: 40px; border-radius: 4px; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1); border-top: 4px solid #8e44ad; }
        h3 { color: #8e44ad; margin-top: 0; border-bottom: 1px solid #ecf0f1; padding-bottom: 15px; margin-bottom: 25px; }
        .grid-detalhes { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .linha-dado { padding: 12px; background-color: #f9f9f9; border: 1px solid #ecf0f1; border-radius: 3px; }
        .linha-dado strong { color: #2c3e50; display: block; font-size: 0.85em; margin-bottom: 5px; text-transform: uppercase; }
        .full-width { grid-column: 1 / -1; }
        .rodape { text-align: center; margin-top: 40px; padding-bottom: 20px; font-size: 0.85em; color: #7f8c8d; }
    </style>
</head>
<body>

    <div class="navbar">
        <h2>CareerTrack | Ficha Cadastral</h2>
        <a href="index.jsp" class="btn-nav">← Voltar ao Dashboard</a>
    </div>

    <div class="caixa-principal">
        <h3>Informações Detalhadas da Vaga</h3>
        
        <%
            Candidatura c = (Candidatura) request.getAttribute("c");
            if (c != null) {
        %>
            <div class="grid-detalhes">
                <div class="linha-dado"><strong>ID Sistema:</strong> <%= c.getIdCandidatura() %></div>
                <div class="linha-dado"><strong>Data de Aplicação:</strong> <%= c.getDataAplicacao() %></div>
                <div class="linha-dado"><strong>Empresa:</strong> <%= c.getNomeEmpresa() %></div>
                <div class="linha-dado"><strong>Cargo:</strong> <%= c.getTituloCargo() %></div>
                <div class="linha-dado"><strong>Plataforma:</strong> <%= c.getPlataformaOrigem() %></div>
                <div class="linha-dado"><strong>Status:</strong> <%= c.getStatusAtual() %></div>
                <div class="linha-dado"><strong>Modelo:</strong> <%= c.getModeloTrabalho() %></div>
                <div class="linha-dado"><strong>Salário:</strong> R$ <%= String.format("%.2f", c.getSalarioEstimado()) %></div>
                <div class="linha-dado"><strong>Senioridade:</strong> <%= c.getNivelSenhoridade() %></div>
                <div class="linha-dado"><strong>Link:</strong> <a href="<%= c.getLinkVaga() %>" target="_blank" style="color: #3498db;"><%= c.getLinkVaga() %></a></div>
                <div class="linha-dado full-width"><strong>Anotações:</strong> <%= c.getAnatocoesGerais() %></div>
            </div>
        <%
            } else {
        %>
            <h3 style="color: red; text-align: center;">Erro: Registro não encontrado.</h3>
        <%
            }
        %>
    </div>

    <div class="rodape">
        <strong>CareerTrack</strong> &copy; 2026<br>
        Projeto de Engenharia - Desenvolvedores: Gabriel Fontenele e Robson Ramon
    </div>

</body>
</html>