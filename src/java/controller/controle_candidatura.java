/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.CandidaturaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Candidatura;

/**
 *
 * @author gabrielfontenele
 */
@WebServlet(name = "controle_candidatura", urlPatterns = {"/controle_candidatura"})
public class controle_candidatura extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String op = request.getParameter("op");
            CandidaturaDAO cdao = new CandidaturaDAO();
            Candidatura c = new Candidatura();

            if (op.equals("CADASTRAR")) {
                String nomeEmpresa = request.getParameter("txtnomeEmpresa");
                String tituloCargo = request.getParameter("txttituloCargo");
                String linkVaga = request.getParameter("txtlinkVaga");
                String plataformaOrigem = request.getParameter("txtplataformaOrigem");
                String modeloTrabalho = request.getParameter("txtmodeloTrabalho");
                double salarioEstimado = Double.parseDouble(request.getParameter("txtsalarioEstimado"));
                Date dataAplicacao = Date.valueOf(request.getParameter("txtdataAplicacao"));
                String statusAtual = request.getParameter("txtstatusAtual");
                String nivelSenioridade = request.getParameter("txtnivelSenioridade");
                String anotacoesGerais = request.getParameter("txtanotacoesGerais");

                c.setNomeEmpresa(nomeEmpresa);
                c.setTituloCargo(tituloCargo);
                c.setLinkVaga(linkVaga);
                c.setPlataformaOrigem(plataformaOrigem);
                c.setModeloTrabalho(modeloTrabalho);
                c.setSalarioEstimado(salarioEstimado);
                c.setDataAplicacao(dataAplicacao);
                c.setStatusAtual(statusAtual);
                c.setNivelSenhoridade(nivelSenioridade);
                c.setAnatocoesGerais(anotacoesGerais);

                String msg = "Cadastrar";
                try {
                    cdao.inserir(c);
                    System.out.println("Cadastrado com sucesso!!");
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("resultado.jsp").forward(request, response);
                } catch (IOException | ClassNotFoundException | SQLException | ServletException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                }

            } else if (op.equals("DELETAR")) {
                int id = Integer.parseInt(request.getParameter("txtid"));
                c.setIdCandidatura(id); 
                String msg = "Deletar";
                try {
                    cdao.deletar(c); 
                    List<Candidatura> lcand = cdao.consultarTodos();
                    request.setAttribute("lcand", lcand);
                    request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);
                } catch (IOException | ClassNotFoundException | SQLException | ServletException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                }

            } else if (op.equals("CONSULTAR BY ID")) {
                int id = Integer.parseInt(request.getParameter("txtid"));
                c.setIdCandidatura(id); 
                try {
                    c = cdao.consultarPorId(c); 
                    request.setAttribute("c", c);
                    request.getRequestDispatcher("resultadocosultarbyid.jsp").forward(request, response);
                } catch (IOException | ClassNotFoundException | SQLException | ServletException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }

            } else if (op.equals("CONSULTAR TODOS")) {
                try {
                    List<Candidatura> lcand = cdao.consultarTodos();
                    request.setAttribute("lcand", lcand);
                    request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);
                } catch (IOException | ClassNotFoundException | SQLException | ServletException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }

            } else if (op.equals("ATUALIZAR")) {
                int id = Integer.parseInt(request.getParameter("txtid"));
                c.setIdCandidatura(id); 
                try {
                    c = cdao.consultarPorId(c); 
                    request.setAttribute("c", c);
                    request.getRequestDispatcher("resultadocosultaratualizar.jsp").forward(request, response);
                } catch (IOException | ClassNotFoundException | SQLException | ServletException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }

            } else if (op.equals("CONFIRMAR")) {
                int id = Integer.parseInt(request.getParameter("txtid"));
                String nomeEmpresa = request.getParameter("txtnomeEmpresa");
                String tituloCargo = request.getParameter("txttituloCargo");
                String linkVaga = request.getParameter("txtlinkVaga");
                String plataformaOrigem = request.getParameter("txtplataformaOrigem");
                String modeloTrabalho = request.getParameter("txtmodeloTrabalho");
                double salarioEstimado = Double.parseDouble(request.getParameter("txtsalarioEstimado"));
                Date dataAplicacao = Date.valueOf(request.getParameter("txtdataAplicacao"));
                String statusAtual = request.getParameter("txtstatusAtual");
                String nivelSenioridade = request.getParameter("txtnivelSenioridade");
                String anotacoesGerais = request.getParameter("txtanotacoesGerais");

                c.setIdCandidatura(id);
                c.setNomeEmpresa(nomeEmpresa);
                c.setTituloCargo(tituloCargo);
                c.setLinkVaga(linkVaga);
                c.setPlataformaOrigem(plataformaOrigem);
                c.setModeloTrabalho(modeloTrabalho);
                c.setSalarioEstimado(salarioEstimado);
                c.setDataAplicacao(dataAplicacao);
                c.setStatusAtual(statusAtual);
                c.setNivelSenhoridade(nivelSenioridade);
                c.setAnatocoesGerais(anotacoesGerais);

                String msg = "Atualizar";
                try {
                    cdao.atualizar(c); 
                    System.out.println("Atualizado com sucesso!!");
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("resultado.jsp").forward(request, response);
                } catch (IOException | ClassNotFoundException | SQLException | ServletException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controller para a entidade Candidatura - Sistema de Vagas";
    }
}