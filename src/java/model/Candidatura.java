/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author gabrielfontenele
 */
public class Candidatura {
    private int idCandidatura;
    private String nomeEmpresa;
    private String TituloCargo;
    private String LinkVaga;
    private String plataformaOrigem;
    private String modeloTrabalho;
    private double salarioEstimado;
    private Date dataAplicacao;
    private String statusAtual;
    private String nivelSenhoridade;
    private String anatocoesGerais;

    public int getIdCandidatura() {
        return idCandidatura;
    }

    public void setIdCandidatura(int idCandidatura) {
        this.idCandidatura = idCandidatura;
    }

    public String getNomeEmpresa() {
        return nomeEmpresa;
    }

    public void setNomeEmpresa(String nomeEmpresa) {
        this.nomeEmpresa = nomeEmpresa;
    }

    public String getTituloCargo() {
        return TituloCargo;
    }

    public void setTituloCargo(String TituloCargo) {
        this.TituloCargo = TituloCargo;
    }

    public String getLinkVaga() {
        return LinkVaga;
    }

    public void setLinkVaga(String LinkVaga) {
        this.LinkVaga = LinkVaga;
    }

    public String getPlataformaOrigem() {
        return plataformaOrigem;
    }

    public void setPlataformaOrigem(String plataformaOrigem) {
        this.plataformaOrigem = plataformaOrigem;
    }

    public String getModeloTrabalho() {
        return modeloTrabalho;
    }

    public void setModeloTrabalho(String modeloTrabalho) {
        this.modeloTrabalho = modeloTrabalho;
    }

    public double getSalarioEstimado() {
        return salarioEstimado;
    }

    public void setSalarioEstimado(double salarioEstimado) {
        this.salarioEstimado = salarioEstimado;
    }

    public Date getDataAplicacao() {
        return dataAplicacao;
    }

    public void setDataAplicacao(Date dataAplicacao) {
        this.dataAplicacao = dataAplicacao;
    }

    public String getStatusAtual() {
        return statusAtual;
    }

    public void setStatusAtual(String statusAtual) {
        this.statusAtual = statusAtual;
    }

    public String getNivelSenhoridade() {
        return nivelSenhoridade;
    }

    public void setNivelSenhoridade(String nivelSenhoridade) {
        this.nivelSenhoridade = nivelSenhoridade;
    }

    public String getAnatocoesGerais() {
        return anatocoesGerais;
    }

    public void setAnatocoesGerais(String anatocoesGerais) {
        this.anatocoesGerais = anatocoesGerais;
    }
    
    
    
}
