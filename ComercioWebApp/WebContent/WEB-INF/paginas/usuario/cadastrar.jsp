<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Usuário</title>
<spring:url value="/produto/deleta/" var="deleta"></spring:url>
<spring:url value="/produto/altera/" var="altera"></spring:url>
<spring:url value="/usuario/salvar" var="salvar"></spring:url>
<spring:url value="/produto/" var="cancela"></spring:url>
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
	<jsp:include page="${request.contextPath}/nav"></jsp:include>
	<div class="container" id="usuario">
		<div class="row">
			<div class="col-lg-12 my-3">
				<div class="card">
					<div class="card-body">
						<h1 class="display-4 text-center">Cadastro de Usuario</h1>
						<form:form action="${salvar}" modelAttribute="usuario"
							cssClass="form-horizontal">
							<form:hidden path="id" />
							<div class="form-group">
								<label for="nome" class="text-right">Nome</label>
								<form:input class="form-control" path="nome"
									value="${usuario.nome}" />
							</div>
							<div class="form-group">
								<label for="email" class="text-right">Email</label>
								<form:input class="form-control" path="email"
									value="${usuario.nome}" />
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="senha" class="text-right">Senha:</label>
									<form:input path="senha" type="password"
										cssClass="form-control" />
								</div>
								<div class="form-group col-md-6">
									<label for="senha" class="text-right">Confirme sua
										senha:</label> <input id="confirmarSenha" class="form-control"
										name="confirmarSenha" id="confirmarSenha" type="password" />
								</div>
							</div>
							<div class="form-group">
								<div class="form-check text-center">
									<input class="form-check-input" type="checkbox" id="gridCheck">
									<label class="form-check-label" for="gridCheck">
										Concordo com <a href="#modalTermos" data-toggle="modal"
										data-target="#modalTermos">termos de uso.</a>
									</label>
								</div>
							</div>
							<div class="mx-auto text-center">
								<button type="submit" class="btn btn-success">Cadastrar-se</button>
								<button type="reset" class="btn btn-danger">Limpar
									Formulario</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modalTermos" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3>Termos de Uso</h3>
					<button type="button" class="close font-weight-light"
						data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<jsp:include page="${request.contextPath}/usuario/termos"></jsp:include>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>