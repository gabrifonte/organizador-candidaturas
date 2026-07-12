<%@page import="model.Candidatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerTrack - Modo Edição</title>
    
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f2f5; color: #333; margin: 0; padding: 0; }
        .navbar { background-color: #2c3e50; color: white; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.2); }
        .navbar h2 { margin: 0; }
        .btn-nav { color: white; text-decoration: none; border: 1px solid white; padding: 8px 15px; border-radius: 3px; font-weight: bold; }
        .btn-nav:hover { background-color: white; color: #2c3e50; }
        .caixa-principal { background-color: #ffffff; width: 90%; max-width: 1200px; margin: 40px auto; padding: 40px; border-radius: 4px; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1); border-top: 4px solid #f39c12; }
        h3 { color: #f39c12; margin-top: 0; border-bottom: 1px solid #ecf0f1; padding-bottom: 15px; margin-bottom: 25px; }
        .grid-form { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .full-width { grid-column: 1 / -1; }
        .linha-form { display: flex; flex-direction: column; }
        .linha-form label { font-weight: bold; margin-bottom: 6px; color: #34495e; font-size: 0.9em; }
        .linha-form input { padding: 10px; border: 1px solid #ccc; border-radius: 3px; font-size: 1em; box-sizing: border-box; }
        .input-bloqueado { background-color: #e9ecef; color: #6c757d; cursor: not-allowed; }
        .botoes-acao { margin-top: 30px; padding-top: 20px; border-top: 1px solid #ecf0f1; }
        .btn-acao { background-color: #f39c12; color: white; border: none; padding: 12px 25px; border-radius: 3px; cursor: pointer; font-weight: bold; font-size: 1em; }
        .btn-acao:hover { background-color: #e67e22; }
        .rodape { text-align: center; margin-top: 40px; padding-bottom: 20px; font-size: 0.85em; color: #7f8c8d; }
    </style>
</head>
<body>

    <div class="navbar">
        <h2>CareerTrack | Modo Edição</h2>
        <a href="index.jsp" class="btn-nav">Cancelar Edição</a>
    </div>

    <div class="caixa-principal">
        <h3>Modificar Registro do Banco</h3>
        
        <%
            Candidatura c = (Candidatura) request.getAttribute("c");
            if (c != null) {
        %>
        
        <form action="controle_candidatura" method="POST">
            <div class="grid-form">
                
                <div class="linha-form full-width" style="max-width: 200px;">
                    <label>ID da Candidatura (Sistema):</label>
                    <input type="number" name="txtid" value="<%= c.getIdCandidatura() %>" class="input-bloqueado" readonly>
                </div>
                
                <div class="linha-form"><label>Nome da Empresa:</label><input type="text" name="txtnomeEmpresa" value="<%= c.getNomeEmpresa() != null ? c.getNomeEmpresa() : "" %>" required></div>
                <div class="linha-form"><label>Título do Cargo:</label><input type="text" name="txttituloCargo" value="<%= c.getTituloCargo() != null ? c.getTituloCargo() : "" %>" required></div>
                <div class="linha-form"><label>Plataforma de Origem:</label><input type="text" name="txtplataformaOrigem" value="<%= c.getPlataformaOrigem() != null ? c.getPlataformaOrigem() : "" %>"></div>
                <div class="linha-form"><label>Modelo de Trabalho:</label><input type="text" name="txtmodeloTrabalho" value="<%= c.getModeloTrabalho() != null ? c.getModeloTrabalho() : "" %>"></div>
                <div class="linha-form full-width"><label>Link da Vaga:</label><input type="url" name="txtlinkVaga" value="<%= c.getLinkVaga() != null ? c.getLinkVaga() : "" %>"></div>
                <div class="linha-form"><label>Salário Estimado (R$):</label><input type="number" step="0.01" name="txtsalarioEstimado" value="<%= c.getSalarioEstimado() %>" required></div>
                <div class="linha-form"><label>Data de Aplicação:</label><input type="date" name="txtdataAplicacao" value="<%= c.getDataAplicacao() %>" required></div>
                <div class="linha-form"><label>Status Atual:</label><input type="text" name="txtstatusAtual" value="<%= c.getStatusAtual() != null ? c.getStatusAtual() : "" %>"></div>
                <div class="linha-form"><label>Nível de Senioridade:</label><input type="text" name="txtnivelSenioridade" value="<%= c.getNivelSenhoridade() != null ? c.getNivelSenhoridade() : "" %>"></div>
                <div class="linha-form full-width"><label>Anotações Gerais:</label><input type="text" name="txtanotacoesGerais" value="<%= c.getAnatocoesGerais() != null ? c.getAnatocoesGerais() : "" %>"></div>
            </div>
            
            <div class="botoes-acao">
                <input type="submit" name="op" value="CONFIRMAR" class="btn-acao">
            </div>
        </form>
        
        <%
            } else {
        %>
            <h3 style="color: red;">Erro: Candidatura não encontrada no banco de dados!</h3>
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