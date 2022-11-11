<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Jobs Opportunities</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <style>
            .card {
              max-width: 100vw !important;
              height: 18rem;
              border-radius: 12px;
              box-shadow: 6px 6px 10px #ccc, 6px 6px 20px #ccc;
              margin-bottom: 50px;
            }
      
            .card-title {
              font-size: 16px;
            }
            
            .ui-accordion .ui-accordion-content {
  				height :auto !important;
  				padding: 0px;
  				overflow: visible !important;  
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
                                	Jobs Posting</a>
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
		</c:if>
		<c:if test="${error_string_success != null}">
		<div class="alert alert-success alert-dismissible fade show text-center fixed-top" role="alert">
  			${error_string_success }
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
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
            <div class="container py-4 mb-5" style="position: relative;">

                <h2>(<span modelattribute="count">${count}</span>) jobs available</h2>
        
                <div class="row" style="margin-top: 20px;">
                
                <c:if test="${empty jobs}">
                	<div class="container">
                		<p>No jobs opportunities found.</p>
                	</div>
                </c:if>
                
                <c:if test="${not empty jobs}">
                <c:forEach var="job" items="${jobs}" varStatus="row">
                	<div class="col-md-12 col-lg-4 col-sm-3">
                		<div class="card">
                			<div class="card-body text-center">
                				<h4 class="card-title">${job.position}
                					<a href=""><i class="fa-solid fa-circle-check" title="verified"></i></a>
                				</h4>
                					
                				<div class="row-cols-md-9">
                          			<p class="card-text">*Salary (MYR): ${job.salary}</p>
                				</div>

                				<p><i class="fa-sharp fa-solid fa-building"></i> ${job.company}<br> 
                					${job.city} ${job.country}
                				</p>
                						
                				<form class="text-center">
                          			<a href="#" class="btn btn-outline-primary">Apply</a>
                          			<a href="#" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modal${row.index}">Details</a>
                        		</form>
                			</div>
                			
							<!-- Modal -->
							<div class="modal fade" id="modal${row.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  								<div class="modal-dialog modal-dialog-centered">
    								<div class="modal-content">
      									<div class="modal-header">
        									<h1 class="modal-title fs-5" id="exampleModalLabel">${job.position}, at ${job.company}</h1>
        									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      									</div>
      									<div class="modal-body">
      									<textarea row="100" class="form-control" style="height: 300px; display: block;">${job.content }</textarea>
      									</div>
      									<div class="modal-footer">
      									</div>
    								</div>
  								</div>
							</div>
							<!-- endof Modal -->
                				
                			<div class="accordion" id="accordionExample">
  								<div class="accordion-item">
    								<h2 class="accordion-header" id="heading${row.index }">
      								<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${row.index }" aria-expanded="true" aria-controls="collapse${row.index }">
        								<small>
        									<%@ page import="java.time.format.DateTimeFormatter" %>
        									Updated on: ${job.updatedOn.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH.mm"))} <-- need to show pretty time :(
        								</small>
      								</button>
    								</h2>
  								</div>
  							</div>
                		</div>
                	</div>
                </c:forEach>
                </c:if>

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

		<script>
			setTimeout(function() {
        		bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    		}, 3000)
		</script>
        <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
</html>