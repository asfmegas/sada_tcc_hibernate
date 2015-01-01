<%@page import="java.util.Calendar"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.com.asfmegas.sada.beans.Movimento"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exibir Movimento</title>
</head>
<body>
	<table width="100%">
		<tr bgcolor="c0c0c0">
			<td>Id</td>
			<td>Turma</td>
			<td>Nota1</td>
			<td>Nota2</td>
			<td>Nota3</td>
			<td>Nota4</td>
			<td>Nota5</td>
			<td>Nota6</td>
			<td>Falta</td>
			<td>Data</td>
		</tr>
		<%
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("sistema");
			EntityManager em = factory.createEntityManager();
			
			em.getTransaction().begin();
				
			Query q = em.createQuery("select object(m) from Movimento as m");
			List<Movimento> mov = q.getResultList();
			
			for(Movimento m : mov){		
		%>
			<tr>
			<td><%=m.getId() %></td>
			<td><%=m.getTurma() %></td>
			<td><%=m.getNota1() %></td>
			<td><%=m.getNota2() %></td>
			<td><%=m.getNota3() %></td>
			<td><%=m.getNota4() %></td>
			<td><%=m.getNota5() %></td>
			<td><%=m.getNota6() %></td>
			<td><%=m.getFalta() %></td>
			<td>[ m.getData() ]</td>
		</tr>
		<%
			}
			
			em.close();
			factory.close();
		%>
	</table>

</body>
</html>