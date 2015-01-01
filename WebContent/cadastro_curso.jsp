<%@page import="br.com.asfmegas.sada.dao.CursoDAO"%>
<%@page import="br.com.asfmegas.sada.beans.Curso"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Cursos</title>
</head>
	<body>
		<h1>Cadastro de Curso</h1>
		<%
			if(request.getParameter("txtId") != null && request.getParameter("txtId") != ""){
				int id = Integer.parseInt(request.getParameter("txtId"));
				String nome = request.getParameter("txtNome");
				int carga = Integer.parseInt(request.getParameter("txtCarga"));
				
				Curso curso = new Curso();
				CursoDAO dao = new CursoDAO();
				curso.setId_curso(id);
				curso.setNome(nome);
				curso.setCarga(carga);
				
				dao.set(curso);	
			}
		%>
		<form action="cadastro_curso.jsp">
			Id:<input type="test" name="txtId" /><br />
			Nome:<input type="test" name="txtNome" /><br />
			Carga:<input type="test" name="txtCarga" /><br />
			<input type="submit" value="Cadastrar" />
		</form>
	</body>
</html>