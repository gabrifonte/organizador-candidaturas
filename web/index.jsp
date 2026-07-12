<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerTrack - Dashboard</title>
    
    <style>
        body { font-family: Arial, Helvetica, sans-serif; background-color: #f0f2f5; color: #333; margin: 0; padding: 0; }
        .navbar { background-color: #2c3e50; color: white; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.2); }
        .navbar h2 { margin: 0; font-size: 1.5em; letter-spacing: 1px; }
        .menu-opcoes { display: flex; gap: 15px; }
        .menu-opcoes button { background-color: transparent; color: white; border: 1px solid #bdc3c7; padding: 8px 16px; border-radius: 3px; cursor: pointer; font-weight: bold; transition: 0.2s; }
        .menu-opcoes button:hover { background-color: #ecf0f1; color: #2c3e50; }
        .caixa-principal { background-color: #ffffff; width: 90%; max-width: 1200px; margin: 40px auto; padding: 40px; border-radius: 4px; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1); border-top: 4px solid #3498db; }
        h3 { color: #2c3e50; margin-top: 0; border-bottom: 1px solid #ecf0f1; padding-bottom: 15px; margin-bottom: 25px; }
        .grid-form { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .full-width { grid-column: 1 / -1; }
        .linha-form { display: flex; flex-direction: column; }
        .linha-form label { font-weight: bold; margin-bottom: 6px; color: #34495e; font-size: 0.9em; }
        .linha-form input { padding: 10px; border: 1px solid #ccc; border-radius: 3px; font-size: 1em; box-sizing: border-box; }
        .linha-form input:focus { outline: none; border-color: #3498db; }
        .botoes-acao { margin-top: 30px; padding-top: 20px; border-top: 1px solid #ecf0f1; display: flex; gap: 10px; }
        .btn-acao { background-color: #27ae60; color: white; border: none; padding: 12px 25px; border-radius: 3px; cursor: pointer; font-weight: bold; font-size: 1em; }
        .btn-acao:hover { background-color: #2ecc71; }
        .btn-azul { background-color: #3498db; }
        .btn-azul:hover { background-color: #2980b9; }
        .btn-amarelo { background-color: #f39c12; }
        .btn-deletar { background-color: #e74c3c; }
        .rodape { text-align: center; margin-top: 40px; padding-bottom: 20px; font-size: 0.85em; color: #7f8c8d; }
    </style>
</head>
<body>

    <div class="navbar">
        <h2>CareerTrack</h2>
        <div class="menu-opcoes">
            <button onclick="mudarTela('blocoMenu')">Início</button>
            <button onclick="mudarTela('blocoCadastro')">Nova Vaga</button>
            <button onclick="mudarTela('blocoGerenciar')">Gerenciar / Buscar</button>
            <form action="controle_candidatura" method="POST" style="margin: 0;">
                <input type="hidden" name="op" value="CONSULTAR TODOS">
                <button type="submit" style="background-color: #3498db; border-color: #3498db;">Lista Completa</button>
            </form>
        </div>
    </div>

    <div class="caixa-principal">
        
        <div id="blocoMenu" style="display: block;">
            <h3>Painel de Controle - Candidaturas</h3>
            <p>Bem-vindo ao sistema de organização de vagas desenvolvido pela equipe de Engenharia.</p>
            <p>Utilize a barra de navegação superior para incluir novos registros ou pesquisar a base de dados do CareerTrack.</p>
        </div>

        <div id="blocoCadastro" style="display: none;">
            <h3>Inserir Novo Registro no Banco de Dados</h3>
            
            <form action="controle_candidatura" method="POST">
                <div class="grid-form">
                    <div class="linha-form"><label>Nome da Empresa:</label><input type="text" name="txtnomeEmpresa" required></div>
                    <div class="linha-form"><label>Título do Cargo:</label><input type="text" name="txttituloCargo" required></div>
                    <div class="linha-form"><label>Plataforma de Origem:</label><input type="text" name="txtplataformaOrigem"></div>
                    <div class="linha-form"><label>Modelo de Trabalho:</label><input type="text" name="txtmodeloTrabalho"></div>
                    <div class="linha-form full-width"><label>Link da Vaga:</label><input type="url" name="txtlinkVaga" placeholder="https://..."></div>
                    <div class="linha-form"><label>Salário Estimado (R$):</label><input type="number" step="0.01" name="txtsalarioEstimado" required></div>
                    <div class="linha-form"><label>Data de Aplicação:</label><input type="date" name="txtdataAplicacao" required></div>
                    <div class="linha-form"><label>Status Atual:</label><input type="text" name="txtstatusAtual"></div>
                    <div class="linha-form"><label>Nível de Senioridade:</label><input type="text" name="txtnivelSenioridade"></div>
                    <div class="linha-form full-width"><label>Anotações Gerais:</label><input type="text" name="txtanotacoesGerais"></div>
                </div>
                
                <div class="botoes-acao">
                    <input type="submit" name="op" value="CADASTRAR" class="btn-acao">
                </div>
            </form>
        </div>

        <div id="blocoGerenciar" style="display: none;">
            <h3>Localizar ou Modificar Registro</h3>
            <p>Informe o código identificador (ID) da vaga que deseja manipular:</p>
            
            <form action="controle_candidatura" method="POST">
                <div class="linha-form" style="max-width: 300px; margin-bottom: 20px;">
                    <label>ID da Candidatura:</label>
                    <input type="number" name="txtid" required>
                </div>
                
                <div class="botoes-acao">
                    <input type="submit" name="op" value="CONSULTAR BY ID" class="btn-acao btn-azul">
                    <input type="submit" name="op" value="ATUALIZAR" class="btn-acao btn-amarelo">
                    <input type="submit" name="op" value="DELETAR" class="btn-acao btn-deletar" onclick="return confirm('ATENÇÃO: Deseja realmente excluir esta vaga do banco de dados?')">
                </div>
            </form>
        </div>
        
    </div>

    <div class="rodape">
        <strong>CareerTrack</strong> &copy; 2026<br>
        Projeto de Engenharia - Desenvolvedores: Gabriel Fontenele e Robson Ramon
    </div>

    <script>
        function mudarTela(idTela) {
            document.getElementById('blocoMenu').style.display = 'none';
            document.getElementById('blocoCadastro').style.display = 'none';
            document.getElementById('blocoGerenciar').style.display = 'none';
            document.getElementById(idTela).style.display = 'block';
        }
    </script>
</body>
</html>