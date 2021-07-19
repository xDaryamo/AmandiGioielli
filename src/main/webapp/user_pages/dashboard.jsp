<%@page import="beans.AddressBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	UserBean user = (UserBean) session.getAttribute("user");
	Collection<?> addresses = (Collection<?>) request.getAttribute("addresses");

	String error = (String)request.getAttribute("error");
	if(addresses == null) 
	{
		response.sendRedirect(request.getContextPath() + "/DashBoard?action=");
		return;
	}

%>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amandi Gioielli - Dashboard account</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
   	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/all.min.css" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel='shortcut icon' type='image/x-icon' href="<%=request.getContextPath()%>/images/favicon.ico"/>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
</head>

<body>
	<%@ include file="../fragments/header.jsp"%>
	<h3>Informazioni Account</h3>
	
	<p>Nome:<%=user.getFirstName()%> </p> <br>
	<p>Cognome:<%=user.getLastName()%></p><br>
	<p>Email:<%=user.getEmail()%></p><br>
	<p>Cellulare:<%=user.getPhone()%>
	<h3>Indirizzi:</h3>
	<%

			Iterator<?> it = addresses.iterator();
			while(it.hasNext()) {
			AddressBean address = (AddressBean) it.next();
		
			
				
	%>	
		<div id ="displayResult">
				<p> <%=address.getStreetAddress() + " " + address.getAddressNumber() + " " + address.getCity() + " " + address.getProvince() + " " + address.getPhone() %> </p> 
					<% 		

			}
	%>

	<%@ include file="../fragments/footer.jsp"%>
</body>
</html>