<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<hr />
	<table>
		<tr>
			<th>Codigo</th>
			<th>Nome</th>
			<th>Valor Unitario</th>
			<th colspan="2">Ações</th>
		</tr>
		<c:forEach var="produto" items="${produtos}">
		<tr>
			<td>${produto.id}</td>
			<td>${produto.nome}</td>
			<td>${produto.valorUnitario}</td>
			<td><a href="#">Alterar</a></td>
			<td><a href="#">Deletar</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>