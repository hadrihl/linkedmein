<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mt-1 h1">Linked<span class="text-primary">Me</span>In</span>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/about">About</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="/contact">Contact</a>
                        </li>
                    </ul>
                    
                <div class="d-flex">
                	<c:if test="${not empty pageContext.request.remoteUser}">
    				<!-- start -->
    				<ul class="navbar-nav me-2 my-2 my-lg-0" modelattribute="loggedInUser" style="--bs-scroll-height: 100px;">
                    	<li class="nav-item dropdown">
                        	<a class="nav-link dropdown-toggle me-2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            	<i class="fa-solid fa-at"></i>
                                <c:out value="${pageContext.request.remoteUser}" />
                            </a>
                            <ul class="dropdown-menu dropdown-menu-lg-end bg-light" >
                                <li>
                                	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                                	<form:form action="${pageContext.request.contextPath}/profile" method="GET"  modelattribute="person">
                                		<input type="hidden" name="id" value="${person.id}">
                                		<button type="submit" class="dropdown-item">
                                			<i class="fa-solid fa-user"></i>
                                			Profile
                                		</button>
                                	</form:form>
                                </li>
                                <li><a class="dropdown-item" href="/dashboard">
                                	<i class="fa-solid fa-table-columns"></i>
                                	Dashboard</a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
									<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    									<button type="submit" class="dropdown-item">
    										<i class="fa-solid fa-right-from-bracket"></i>
    										Logout
    									</button>
									</form:form>
                                </li>
                             </ul>
                   		</li>
                    </ul>
    				<!--  end -->
					</c:if>
					
					<c:if test="${empty pageContext.request.remoteUser}">
    				<a href="/signin" class="btn btn-primary">Sign in</a>
					</c:if>                	
                </div>
                </div>
            </div>
        </nav>

    <main>
        <section class="py-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 mx-auto">
                    <img class="img-fluid mb-3" src="assets/img/comm_skills_web_copy.jpg" alt="welcome">
                    <h2 class="fw-light mb-2">Welcome to LinkedMeIn Portal</h2>
                    <p class="lead text-muted">We are a digital talents platform with the mission to deliver growth for software developers talents and enterprises in the digital economy.
                    	Join our largest developer community!
                    </p>
                    <a href="/signup" class="btn btn-success">Sign up now</a>
                </div>
            </div>
        </section>
    </main>

    <footer class="py-5 bg-light text-muted">
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <div class="d-flex justify-content-start">
                        <span>&copy; 2022. <a href="/">LinkedMeIn</a> portal.<br/>
                            Made with <i class="fa-solid fa-heart"></i> in Penang.<br/>
                            <i class="fa-brands fa-github"></i>
                            <a href="https://github.com/hadrihl/linkedmein"> linkedmein</a>
                        </span>
                    </div>
                    
                </div>
                <div class="col-4">
                    <div class="d-flex justify-content-end">
                        <a class="me-2" href="#">Sitemap</a>
                        <a href="#">Privacy</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>