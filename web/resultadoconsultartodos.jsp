<%@page import="model.Candidatura"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerTrack - Lista Completa</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f2f5; color: #333; margin: 0; padding: 0; }
        .navbar { background-color: #2c3e50; color: white; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.2); }
        .navbar h2 { margin: 0; }
        .btn-nav { color: white; text-decoration: none; border: 1px solid white; padding: 8px 15px; border-radius: 3px; font-weight: bold; transition: 0.2s; }
        .btn-nav:hover { background-color: white; color: #2c3e50; }
        .caixa-principal { background-color: #ffffff; width: 90%; max-width: 1200px; margin: 40px auto; padding: 40px; border-radius: 4px; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1); border-top: 4px solid #3498db; }
        h3 { color: #3498db; margin-top: 0; border-bottom: 1px solid #ecf0f1; padding-bottom: 15px; margin-bottom: 25px; }
        table { width: 100%; border-collapse: collapse; font-size: 0.95em; }
        table, th, td { border: 1px solid #bdc3c7; }
        th { background-color: #ecf0f1; color: #2c3e50; padding: 12px; text-align: left; }
        td { padding: 10px; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:hover { background-color: #f1f8ff; }
        .rodape { text-align: center; margin-top: 40px; padding-bottom: 20px; font-size: 0.85em; color: #7f8c8d; }
    </style>
</head>
<body>

    <div class="navbar">
        <h2>CareerTrack | Base de Dados</h2>
        <a href="index.jsp" class="btn-nav">← Voltar ao Dashboard</a>
    </div>

    <div class="caixa-principal">
        <h3>Todas as Candidaturas Registradas</h3>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Empresa</th>
                    <th>Cargo</th>
                    <th>Salário (R$)</th>
                    <th>Data Aplicação</th>
                    <th>Status</th>
                    <th>Senioridade</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Candidatura> lista = (List<Candidatura>) request.getAttribute("lcand");
                    if (lista != null && !lista.isEmpty()) {
                        for (Candidatura c : lista) {
                %>
                <tr>
                    <td><%= c.getIdCandidatura() %></td>
                    <td><%= c.getNomeEmpresa() %></td>
                    <td><%= c.getTituloCargo() %></td>
                    <td><%= String.format("%.2f", c.getSalarioEstimado()) %></td>
                    <td><%= c.getDataAplicacao() %></td>
                    <td><%= c.getStatusAtual() %></td>
                    <td><%= c.getNivelSenhoridade() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" style="text-align: center; padding: 20px; color: #7f8c8d;">Nenhum registro encontrado no banco de dados.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="rodape">
        <strong>CareerTrack</strong> &copy; 2026<br>
        Projeto de Engenharia - Desenvolvedores: Gabriel Fontenele e Robson Ramon
    </div>

</body>
</html>