<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Produtos</title>
<spring:url value="novo/" var="novo"></spring:url>	
</head>
<body>
 <h2>Index de Produtos</h2>
 <hr />
 <a href="${novo}">Cadastrar Produto</a>
</body>
</html>