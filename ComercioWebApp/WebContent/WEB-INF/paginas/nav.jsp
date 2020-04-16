
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<spring:url value="/" var="inicio"></spring:url>
<spring:url value="/produto" var="produto"></spring:url>
<spring:url value="/usuario/cadastrar" var="cadastrar"></spring:url>
<spring:url value="/loga" var="loga"></spring:url>
<spring:url value="/logout" var="logout"></spring:url>

<nav class="navbar navbar-dark bg-danger navbar-expand-lg">
	<div class="container">
		<a class="navbar-brand" href="${inicio}"> <img
			src='<spring:url value="/resources/assets/logo_transp.png"/>'
			class="d-inline-block align-top logo" alt=""> Fabio Pecora
			Lopes
		</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item" id="inicio-nav"><a class="nav-link"
					href="${inicio}">Home </a></li>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item" id="produto-nav"><a class="nav-link"
						href="${produto}">Produto </a></li>
				</sec:authorize>
			</ul>
			<sec:authorize access="isAuthenticated()">
				<ul class="nav navbar-nav flex-row justify-content-between ml-auto">
					<li class="nav-item my-auto"><span class="text-white font-weight-light">Logado:
							<sec:authentication property="principal.username" />
					</span><a class="text-white btn btn-outline-light btn-sm font-weight-light" href="${logout}">Sair</a></li>
				</ul>
				<sec:authorize access=""></sec:authorize>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<ul class="nav navbar-nav flex-row justify-content-between ml-auto">
					<li class="nav-item order-2 order-md-1"><a href="#"
						class="nav-link" title="settings"><i
							class="fa fa-cog fa-fw fa-lg"></i></a></li>
					<li class="dropdown order-1">
						<button type="button" id="dropdownMenu1" data-toggle="dropdown"
							class="btn btn-outline-light btn-sm dropdown-toggle">
							Login <span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-right mt-2">
							<li class="px-3 py-2">
							<form:form class="form" role="form"
									action="${loga}" modelAttribute="usuario">
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
										<small><a href="${cadastrar}">Cadastrar-se</a></small>
									</div>
								</form:form></li>
						</ul>
					</li>
				</ul>
			</sec:authorize>
		</div>
	</div>
	<script>
		if (document.getElementById("produto") != null) {
			document.getElementById("produto-nav").classList.add('active');
		} else if (document.getElementById("inicio") != null) {
			document.getElementById("inicio-nav").classList.add('active');
		}
	</script>
</nav>