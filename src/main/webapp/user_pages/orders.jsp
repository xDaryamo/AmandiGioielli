<%@page import="beans.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,beans.*"%>
 <%
 	Collection<?> orders = (Collection<?>) request.getAttribute("orders");
 
 	String error = (String)request.getAttribute("error");
 	
 	if(orders == null && error == null) 
 	{
 		response.sendRedirect(response.encodeRedirectURL("../OrderControl"));
 		return;
 	}

 %>   
   

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amandi Gioielli - Ordini effettuati</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
   	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/all.min.css" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel='shortcut icon' type='image/x-icon' href="<%=request.getContextPath()%>/images/favicon.ico"/>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
</head>
<body>
	<%@include file="../fragments/header.jsp" %>
	<h2>Ordini Effettuati</h2>
	<table class="product-table">
		<tr>
			<th style="width: 20%">Id ordine</th>
			<th style="width: 60%">Prezzo</th>
			<th style="width: 5%">Dettagli</th>
			<th style="width: 15%"></th>	
		</tr>
		<%
		if(orders != null && orders.size() > 0) 
		{
			Iterator<?> it = orders.iterator();
			while(it.hasNext())
			{
				OrderBean bean = (OrderBean) it.next();
				
	%>
				<tr>
					<td><%=bean.getId()%></td>
					<td><%=bean.getTotalPrice()%></td>

					<td>
						<a href="<%= request.getContextPath() + "/OrderControl?order_id=" + bean.getId() %>" class="catalogue-icons">
							<img src="<%=request.getContextPath()%>/images/product-info.png" alt="Get additional informations">
						</a>
					</td>
					<td>
				</tr>
	<%
			}
		}
	%>
	</table>
	<br>
	<%
		String message = (String)request.getAttribute("message");
		if(message != null && !message.equals("")) 
		{
	%>
			<p style="color: white; margin-left: auto; margin-right: auto; background-color: green; padding: 5px;"><%=message %></p>
	<%
		}
		if(error != null && !error.equals("")) 
		{
	%>
			<p style="color: white; margin-left: auto; margin-right: auto; background-color: red; padding: 5px;">Errore: <%= error%></p>
	<%
		}
	%>	
	
	<%@include file="../fragments/footer.jsp" %>
		
</body>
</html>