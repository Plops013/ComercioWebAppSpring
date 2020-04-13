<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/" var="index"></spring:url>
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
<body class="bg-dark">

	<jsp:include page="${request.contextPath}/nav"></jsp:include>
	<div class="container my-3">
		<div class="card">
			<div class="card-body">
				<div class="row">
				<a class="text-primary btn-block ml-4" href="${index}">Voltar</a>
					<div class="col-sm-6">
						<img class="mx-auto"
							src="data:image/jpge;base64,${produto.imagemEncoded}"
							style="width: 500px; weight: 500px" class="card-img-top"
							alt="...">
					</div>
					<div class="col-sm-6">
						<h1 class="display-2 text-left">${produto.nome}</h1>
						<h1 class="display-4 text-success text-left"><strong>R$: ${produto.valorUnitario}</strong></h1>
						<a class="btn btn-primary text-white btn-block	">Comprar</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>