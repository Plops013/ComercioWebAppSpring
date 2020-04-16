
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url value="/" var="inicio"></spring:url>
<spring:url value="/produto" var="produto"></spring:url>
<spring:url value="/usuario/cadastrar" var="cadastrar"></spring:url>

<nav class="navbar navbar-dark bg-danger navbar-expand-lg">
	<div class="container">
		<a class="navbar-brand" href="${inicio}"> 
		<img src='<spring:url value="/resources/assets/logo_transp.png"/>'
			class="d-inline-block align-top logo" alt=""> Fabio Pecora
			Lopes
		</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item" id="inicio-nav"><a class="nav-link"
					href="${inicio}">Home </a></li>
				<li class="nav-item" id="produto-nav"><a class="nav-link"
					href="${produto}">Produto </a></li>
			</ul>
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
							<form class="form" role="form">
								<div class="form-group">
									<input id="emailInput" placeholder="Email"
										class="form-control form-control-sm" type="text" required>
								</div>
								<div class="form-group">
									<input id="passwordInput" placeholder="Password"
										class="form-control form-control-sm" type="password" required>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-success btn-block">Login</button>
								</div>
								<div class="form-group text-center">
									<small><a href="${cadastrar}" >Cadastrar-se</a></small>
								</div>
							</form>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<script>	
		if(document.getElementById("produto") != null){
			document.getElementById("produto-nav").classList.add('active');
		}else if(document.getElementById("inicio") != null){
			document.getElementById("inicio-nav").classList.add('active');
		}
		</script>
</nav>