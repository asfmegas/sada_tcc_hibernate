package br.com.asfmegas.sada.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.asfmegas.sada.beans.Aluno;
import br.com.asfmegas.sada.beans.Curso;
import br.com.asfmegas.sada.beans.Disciplina;
import br.com.asfmegas.sada.beans.Movimento;

@WebServlet("/CriarMovimento")
public class CriarMovimento extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CriarMovimento() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try{
			EntityManagerFactory factory = 
					Persistence.createEntityManagerFactory("sistema");
			
			
			EntityManager em = factory.createEntityManager();
			
			Movimento mov = new Movimento();
			mov.setNota1(9.2f);
			mov.setNota2(10.0f);
			mov.setFalta(2);
			mov.setData(Calendar.getInstance());
			mov.setTurma("Lascados da ADS");
			
			Aluno aluno = new Aluno();
			Disciplina disc = new Disciplina();
			Curso curso = new Curso();
			
			try{
				em.getTransaction().begin();
				
				aluno = em.find(Aluno.class, 1L);
				disc = em.find(Disciplina.class, 1L);
				curso = em.find(Curso.class, 1L);
				
				mov.setAluno(aluno);
				mov.setCurso(curso);
				mov.setDisc(disc);
				
				em.persist(mov);
				
				em.getTransaction().commit();
				out.println("Tabelas criadas com sucesso!");
			}catch(Exception e){
				em.getTransaction().rollback();
				out.println("Erro ao salvar dados<br />"+e.getMessage());
			}
			em.close();
			
			factory.close();
		}catch(Exception e){
			out.println("Erro ao criar tabelas<br />"+e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
