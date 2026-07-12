/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Candidatura;
import util.Conexao;

/**
 * @author gabrielfontenele
 */
public class CandidaturaDAO {

    public void inserir(Candidatura c) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("insert into candidatura (nome_empresa, titulo_cargo, link_vaga, plataforma_origem, modelo_trabalho, salario_estimado, data_aplicacao, status_atual, nivel_senioridade, anotacoes_gerais) values (?,?,?,?,?,?,?,?,?,?)");
        comando.setString(1, c.getNomeEmpresa());
        comando.setString(2, c.getTituloCargo());
        comando.setString(3, c.getLinkVaga());
        comando.setString(4, c.getPlataformaOrigem());
        comando.setString(5, c.getModeloTrabalho());
        comando.setDouble(6, c.getSalarioEstimado());
        comando.setDate(7, c.getDataAplicacao());
        comando.setString(8, c.getStatusAtual());
        comando.setString(9, c.getNivelSenhoridade());
        comando.setString(10, c.getAnatocoesGerais());
        comando.execute();
        con.close();
    }
    
    public void deletar(Candidatura c) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("delete from candidatura where id_candidatura = ?");
        comando.setInt(1, c.getIdCandidatura());
        comando.execute();
        con.close();
    }
    
    public void atualizar(Candidatura c) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("update candidatura set nome_empresa = ?, titulo_cargo = ?, link_vaga = ?, plataforma_origem = ?, modelo_trabalho = ?, salario_estimado = ?, data_aplicacao = ?, status_atual = ?, nivel_senioridade = ?, anotacoes_gerais = ? where id_candidatura = ?");
        comando.setString(1, c.getNomeEmpresa());
        comando.setString(2, c.getTituloCargo());
        comando.setString(3, c.getLinkVaga());
        comando.setString(4, c.getPlataformaOrigem());
        comando.setString(5, c.getModeloTrabalho());
        comando.setDouble(6, c.getSalarioEstimado());
        comando.setDate(7, c.getDataAplicacao());
        comando.setString(8, c.getStatusAtual());
        comando.setString(9, c.getNivelSenhoridade());
        comando.setString(10, c.getAnatocoesGerais());
        comando.setInt(11, c.getIdCandidatura());
        comando.execute();
        con.close();
    }

    public Candidatura consultarPorId(Candidatura c) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from candidatura where id_candidatura = ?");
        comando.setInt(1, c.getIdCandidatura());
        ResultSet rs = comando.executeQuery();
        
        Candidatura cand = new Candidatura();
        if (rs.next()){
            cand.setIdCandidatura(rs.getInt("id_candidatura"));
            cand.setNomeEmpresa(rs.getString("nome_empresa"));
            cand.setTituloCargo(rs.getString("titulo_cargo"));
            cand.setLinkVaga(rs.getString("link_vaga"));
            cand.setPlataformaOrigem(rs.getString("plataforma_origem"));
            cand.setModeloTrabalho(rs.getString("modelo_trabalho"));
            cand.setSalarioEstimado(rs.getDouble("salario_estimado"));
            cand.setDataAplicacao(rs.getDate("data_aplicacao"));
            cand.setStatusAtual(rs.getString("status_atual"));
            cand.setNivelSenhoridade(rs.getString("nivel_senioridade"));
            cand.setAnatocoesGerais(rs.getString("anotacoes_gerais"));
        }        
        return cand;
    }
    
    public List<Candidatura> consultarTodos() throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from candidatura");
        ResultSet rs = comando.executeQuery();
        
        List<Candidatura> lcand = new ArrayList<Candidatura>();
        while(rs.next()){
            Candidatura cand = new Candidatura();
            cand.setIdCandidatura(rs.getInt("id_candidatura"));
            cand.setNomeEmpresa(rs.getString("nome_empresa"));
            cand.setTituloCargo(rs.getString("titulo_cargo"));
            cand.setLinkVaga(rs.getString("link_vaga"));
            cand.setPlataformaOrigem(rs.getString("plataforma_origem"));
            cand.setModeloTrabalho(rs.getString("modelo_trabalho"));
            cand.setSalarioEstimado(rs.getDouble("salario_estimado"));
            cand.setDataAplicacao(rs.getDate("data_aplicacao"));
            cand.setStatusAtual(rs.getString("status_atual"));
            cand.setNivelSenhoridade(rs.getString("nivel_senioridade"));
            cand.setAnatocoesGerais(rs.getString("anotacoes_gerais"));
            lcand.add(cand);
        }        
        return lcand;
    }
}