<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Produto</title>
</head>
<body>
	<h2>Cadastro de Produtos</h2>
	<hr />
	<form:form action="salva" modelAttribute="produto">
		
		<form:hidden path="id"/>
		<label for="nome">Nome</label> <br/>
		<form:input path="nome"/> <br/>
		
		<label for="valorUnitario">Valor Unitario</label> <br/>
		<form:input path="valorUnitario"/>
		
		<br/>
		
		<form:button>Cadastrar</form:button>
		
	</form:form>
</body>
</html>