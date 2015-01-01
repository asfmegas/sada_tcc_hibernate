<%@page import="br.com.asfmegas.sada.beans.Curso"%>
<%@page import="br.com.asfmegas.sada.dao.DisciplinaDAO"%>
<%@page import="br.com.asfmegas.sada.beans.Disciplina"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Disciplinas</title>
</head>
<body>
	<%
		Disciplina disc = new Disciplina();
		DisciplinaDAO dao = new DisciplinaDAO();
		disc.setId_disc(1);
		disc.setNome("Banco de Dados");
		disc.setCarga(80);
		
		Curso curso = new Curso();
		curso.setId_curso(1);
		
		disc.setId_curso(curso);
		
		dao.set(disc);
	%>
</body>
</html>