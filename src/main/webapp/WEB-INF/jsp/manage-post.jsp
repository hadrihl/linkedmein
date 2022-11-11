<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Post</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <style>
            .card {
              max-width: 100vw !important;
              border-radius: 12px;
              margin-bottom: 50px;
            }
      
            .card img {
              width: 100%;
              height: 60%;
              object-fit: cover;
            }
      
            .card-title {
              font-size: 16px;
            }
            .greenColor{
    			background-color: rgba(var(--bs-info-rgb), .075);
			}
			.redColor{
    			background-color: #dc3545;
			}
        </style>
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
    				<ul class="navbar-nav me-2 my-2 my-lg-0" style="--bs-scroll-height: 100px;">
                    	<li class="nav-item dropdown">
                        	<a class="nav-link dropdown-toggle me-2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            	<i class="fa-solid fa-at"></i>
                                <c:out value="${username}" />
                            </a>
                            <ul class="dropdown-menu dropdown-menu-lg-end bg-light" >
                                <li><a class="dropdown-item" href="/profile?id=${user_id}" modelattribute="user_id">
                                	<i class="fa-solid fa-user"></i>
                                	Profile</a>
                                </li>
                                <li><a class="dropdown-item" href="/dashboard">
                                	<i class="fa-solid fa-table-columns"></i>
                                	Dashboard</a>
                                </li>
                                <li><a class="dropdown-item" href="/jobs">
                                	<i class="fa-solid fa-table-columns"></i>
                                	Jobs</a>
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
        
        <!-- Alert error message handling -->
    	<c:if test="${error_string_warning != null}">
		<div class="alert alert-warning alert-dismissible fade show text-center fixed-top" role="alert">
  			${error_string_warning }
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<script>
			setTimeout(function() {
        		bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    		}, 3000);
		</script>
		</c:if>
		<c:if test="${error_string_success != null}">
		<div class="alert alert-success alert-dismissible fade show text-center fixed-top" role="alert">
  			${error_string_success }
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<script>
			setTimeout(function() {
        		bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    		}, 3000);
		</script>
		</c:if>
        
        <section>
        	<div class="container mt-3 text-center">
        		<a href="/new-post" class="btn btn-warning">
        			<i class="fa-solid fa-briefcase"></i>
        			Post a new job!
        		</a>
        		<a href="/manage-post" class="btn btn-secondary">Manage your posts</a>
        	</div>
        </section>
        
        <section>
        	<div class="container mt-3">
					<c:url var="search_url" value="/dashboard" />
					<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                    <form:form role="search" action="${search_url}" method="post">
                        <div class="input-group">
                            	<input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search">
                            	<button class="btn btn-success me-2" type="submit">Search</button>
                        </div>
                    </form:form>
            </div>
        </section>

        <section>
            <div class="container py-4 mb-5">
        
                <div class="row" style="margin-top: 20px;">
                
                <c:if test="${empty jobs}">
                	<div class="container">
                		<p>No jobs opportunities found.</p>
                	</div>
                </c:if>
                
                
                <div class="card py-5">
                	<c:if test="${not empty jobs}">
                	<table class="table">
  					<thead>
    					<tr>
      						<th scope="col" style="width: 5%;">#</th>
      						<th scope="col" style="width: 50%;">Post</th>
      						<th scope="col" style="width: 10%;">#status</th>
      						<th scope="col" style="width: 10%;">#edit/update</th>
      						<th scope="col" style="width: 10%;">#delete</th>
    					</tr>
  					</thead>
  					<tbody>
                	<c:forEach var="job" items="${jobs}" varStatus="row">
                		<!-- table row for content here -->
                		<tr>
      						<th scope="row">${row.index+1 }</th>
      						
      						<td><strong>${job.position}</strong>, ${job.company}</td>
      						
      						<td>
      							
  								<c:if test="${job.status eq true }">
  									<select class="form-select bg-success bg-opacity-10" aria-label="Default select example">
  									<option selected class="greenColor">Available</option>
  								</c:if>
  								<c:if test="${job.status eq false }">
  									<select class="form-select bg-danger bg-opacity-10 text-muted" aria-label="Default select example">
  									<option selected class="redColor">Closed</option>
 	 							</c:if>
								</select>
      						</td>
      						
      						<td><a href="/edit-post?id=${job.id }" class="btn btn-secondary">Edit</a></td>
      						
      						<td>
      							<form:form action="/delete-post?id=${job.id }" method="POST">
      							<button class="btn btn-danger">Delete</button>
      							</form:form>
      						</td>
    					</tr>
                		<!-- end of row -->	
                	</c:forEach>
                	</tbody>
                	</table>
                	</c:if>
                </div>
                

                </div>
              </div>
        </section>

        <footer class="py-5 bg-light text-muted">
            <div class="container">
              <div class="row">
                <div class="col-8 d-flex justify-content-start">
                  <span>&copy; 2022. <a href="#">LinkedMeIn</a> portal.<br/>
                    Made with <i class="fa-solid fa-heart"></i> in Penang.<br/>
                    <i class="fa-brands fa-github"></i>
                    <a href="https://github.com/hadrihl/linkedmein"> linkedmein</a>
                  </span>
                </div>
      
                <div class="col-4 d-flex justify-content-end">
                  <a href="#" class="me-2">Sitemap</a>
                  <a href="#">Policy</a>
                </div>
              </div>
            </div>
        </footer>

		
        <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
</html>