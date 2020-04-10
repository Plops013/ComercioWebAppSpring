<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Produto</title>
<spring:url value="/produto/deleta/" var="deleta"></spring:url>
<spring:url value="/produto/altera/" var="altera"></spring:url>
<spring:url value="/produto/salva" var="salva"></spring:url>
<spring:url value="/produto/" var="cancela"></spring:url>
<spring:url value="/" var="inicio"></spring:url>
<link href='<spring:url value="/resources/css/bootstrap.css"/>' rel="stylesheets"/>
<script type="text/javascript" src='<spring:url value="/resources/js/jquery-3.4.1.min.js"/>'></script>
<script type="text/javascript" src='<spring:url value="/resources/js/bootstrap.js"/>'></script>

</head>
<body class="bg-dark">
	<h2 class="display-4">Cadastro de Produtos</h2>
	<a href="${inicio}">Voltar</a>
	<hr />
	<form:form action="${salva}" modelAttribute="produto">

		<form:hidden path="id" />
		<label for="nome" >Nome</label>
		<br />
		<form:input path="nome" value="${produto.nome}" />
		<br />

		<label for="valorUnitario">Valor Unitario</label>
		<br />
		<form:input path="valorUnitario"  value="${produto.valorUnitario}" />

		<br />

		<form:button> ${produto.id == 0 ? 'Cadastrar' : 'Alterar'} </form:button>
		<c:if test="${produto.id != 0}"><a href="${cancela}">Cancelar</a></c:if>
	</form:form>

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
				<td><a href="${altera}${produto.id}">Alterar</a></td>
				<td><a href="${deleta}${produto.id}">Deletar</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>