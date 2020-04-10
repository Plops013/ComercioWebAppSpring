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
<link href='<spring:url value="/resources/css/bootstrap.css"/>'
	rel="stylesheet" />
<link href='<spring:url value="/resources/css/style.css"/>'
	rel="stylesheet" />
<script type="text/javascript"
	src='<spring:url value="/resources/js/jquery-3.4.1.min.js"/>'></script>
<script type="text/javascript"
	src='<spring:url value="/resources/js/bootstrap.js"/>'></script>
</head>
<body class="bg-dark">
	<nav class="navbar navbar-dark bg-danger navbar-expand-lg">
		<a class="navbar-brand" href="/"> <img
			src='<spring:url value="/resources/assets/logo_transp.png"/>'
			class="d-inline-block align-top logo" alt=""> Fabio Pecora
			Lopes
		</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${inicio}">Home
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="#">Produto
						<span class="sr-only">(current)</span>
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="mx-auto text-center">
			<br />
			<h2 class="display-4 text-center text-light">Cadastro de
				Produtos</h2>
		</div>
		<form:form class="form-horizontal" action="${salva}"
			modelAttribute="produto" enctype="multipart/form-data">
			<div class="card mx-auto bg-secondary">
				<div class="card-body">
					<c:if test="${not empty mensagemErro}">
						<div id="divMensagem" class="alert alert-danger" role="alert">
							${mensagemErro}</div>
					</c:if>
					<c:if test="${not empty mensagemSucesso}">
						<div id="divMensagem" class="alert alert-success" role="alert">
							${mensagemSucesso}</div>
					</c:if>
					<div class="">
						<form:hidden path="id" />
						<form:hidden path="imagemProd" />
						<div class="form-group form-row">
							<label for="nome"
								class="text-light col-sm-2 col-form-label text-right">Nome</label>
							<div class="col-sm-4">
								<form:input class="form-control" path="nome"
									value="${produto.nome}" />
							</div>
						</div>
						<div class="form-group form-row">
							<label class="text-light col-sm-2 col-form-label text-right"
								for="valorUnitario">Valor Unitario</label>
							<div class="col-sm-4">
								<form:input cssClass="form-control" path="valorUnitario"
									value="${produto.valorUnitario}" />
							</div>
						</div>
						<div class="form-group form-row">
							<label class="text-light col-sm-2 text-right col-form-label"
								for="valorUnitario">Foto:</label>
							<div class="arquivo col-sm-6">
								<input type="file" name="imagem" class="form-control" id="customFile" value="${imagemProd}">
								<label class="custom-file-label" for="customFile">Escolha seu arquivo...</label>
							</div>
						</div>
						<c:if test="${produto.id ne 0}">
						<div class="form-row ">
						<div class="offset-sm-2 col-sm-6">
						<img class="rounded h-auto w-50" alt="" src="data:image/jpge;base64,${imagemProd}">
						</div>
						</div>
						</c:if>
						<div class="form-row">
							<div class="offset-sm-2 col-sm-1">
								<form:button class="btn btn-success"> ${produto.id == 0 ? 'Cadastrar' : 'Alterar'} </form:button>
							</div>
							<div class="col-sm-1">
								<c:if test="${produto.id ne 0}">
									<a class="btn btn-danger" href="${cancela}">Cancelar</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
		<br />
		<c:if test="${empty produtos }">
			<div class="card">
				<div class="card-body mx-auto">
					<h1 class="text-danger">Não há produtos cadastrados</h1>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty produtos}">
			<div class="card mx-auto">
				<table class="table table-striped table-sm">
					<thead class="thead-danger">
						<tr>
							<th>Codigo</th>
							<th>Nome</th>
							<th>Valor Unitario</th>
							<th colspan="2">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="produto" items="${produtos}">
							<tr>
								<td>${produto.id}</td>
								<td>${produto.nome}</td>
								<td>${produto.valorUnitario}</td>
								<td><a class="btn btn-sm btn-warning"
									href="${altera}${produto.id}">Alterar</a></td>
								<td><a class="btn btn-sm btn-danger"
									href="${deleta}${produto.id}"
									onclick="return confirm('Deseja realmente deletar o produto: ${produto.nome} ?')">Deletar</a></td>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#divMensagem').delay(5000).fadeOut('slow');
			});
		</script>
	</div>
</body>
</html>