<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<spring:url value="/loga" var="loga"></spring:url>
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
<body class="bg-danger">
	<div class="container my-5">
		<div class="card pb-5 bg-danger">
			<div class="card-body">
				<h1 class="display-4 font-weight-bold text-center text-light mb-5">Faça Login Para
					Prosseguir</h1>
				<div class="row justify-content-md-center">
					<div class="col-sm-4 card my-5 my-auto bg-light">
						<h1 class="text-center text-dark">Login</h1>
						<form:form class="form" role="form" action="${loga}"
							modelAttribute="usuario">
							<div class="form-group">
								<input id="username" name="username" placeholder="Email"
									class="form-control form-control-sm" type="text" required>
							</div>
							<div class="form-group">
								<input id="password" name="password" placeholder="Senha"
									class="form-control form-control-sm" type="text" required>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-block">Login</button>
							</div>
							<div class="form-group text-center">
								<small><a href="${cadastrar}" class="text-primary">Cadastrar-se</a></small>
								<small><a href="${inicio}" class="text-primary">Retornar</a></small>
							</div>
						</form:form>
					</div>
				</div>
					<div class="row justify-content-md-center">
					<div class="col-sm-4 card my-3">
						<a class="btn btn-light btn-block">Retornar a pagina inicial</a>
					</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>