<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/produto/" var="showProduto"></spring:url>
<link href='<spring:url value="/resources/css/bootstrap.css"/>'
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link href='<spring:url value="/resources/css/style.css"/>'
	rel="stylesheet" />
<script type="text/javascript"
	src='<spring:url value="/resources/js/jquery-3.4.1.min.js"/>'></script>
<script type="text/javascript"
	src='<spring:url value="/resources/js/bootstrap.js"/>'></script>
<meta charset="UTF-8">
<title>Comercio Online</title>
</head>
<body class="bg-dark" id="inicio">
	<jsp:include page="${request.contextPath}/nav"></jsp:include>
	<div class="container my-3">
		<div class="row">
			<div class="col-lg-3" id="lateral">
				<div class="card mx-auto">
					<div class="card-body">
						<p>Aqui estamos en lo lateralo menudo ${usuario.nome} ${usuario.username}</p>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="card mb-3">
					<h1 class="display-4 text-center my-3">Compre Aqui</h1>
					<p class="text-center">A melhor loja desse país</p>
				</div>

				<c:if test="${empty produtos}">
					<div class="card mb-3">
						<h2 class="text-center mt-3 text-warning">
							<span title="chama o icone da net do google" class="material-icons"> alarm </span> 
							Nenhum produto disponível atualmente 
							<span class="material-icons"> alarm
							</span>
						</h2>
						<p class="text-center text-warning">volte mais tarde :(</p>
					</div>
				</c:if>
				<div class="row">
					<c:forEach var="produto" items="${produtos}">
						<div class="col-sm-4">
							<div class="card mb-3">
								<img class="mx-auto"
									src="data:image/jpge;base64,${produto.imagemEncoded}"
									style="width: 100px; weight: 100px" class="card-img-top"
									alt="...">
								<div class="card-body">
									<h5 class="card-title mx-auto text-center">
									<a class="text-center" href="${showProduto}${produto.id}">${produto.nome}</a></h5>
									<p class="card-text text-center">
										Preço: <span class="text-success"><strong>R$:
												${produto.valorUnitario}</strong></span>
									</p>
									<a href="${showProduto}${produto.id}" class="mx-auto text-center btn btn-primary btn-sm btn-block">Ver mais</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>