<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <%@ include file="components/meta.jsp" %> 
        <title>Manage Post</title>
        <%@ include file="components/head.jsp" %> 
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
        <%@ include file="components/navbar.jsp" %> 
        
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
            <div class="container py-4 mb-5" style="margin: auto;">
        
                <div class="row justify-content-center" style="margin-top: 20px;">
                
                <c:if test="${empty jobs}">
                	<div class="container">
                		<p>No jobs opportunities found.</p>
                	</div>
                </c:if>
                
                <c:if test="${not empty jobs}">
                <c:forEach var="job" items="${jobs}" varStatus="row">
                <div class="card col-lg-4 mb-3 me-2" style="width: 18rem;">
                	<div class="card-body">
                		<p class="position-relative">
                			<span class="position-absolute top-0 start-0 translate-middle badge text-bg-light">#${row.index+1 }</span>
                			
                			<c:if test="${job.status == true}">
                			<span class="position-absolute top-0 start-100 translate-middle p-2 bg-success border border-light rounded-circle">
                			</c:if>
                			<c:if test="${job.status == false}">
                			<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
                			</c:if>
                		</p>
                		
                		<h5 class="card-title pt-2">${job.position}</h5>
                		<h6 class="card-subtitle text-muted">${job.company}</h6>
                		<p class="card-text"></p>
                	</div>
                	<div class="card-footer" style="background-color: transparent; border-top: 0;">
                		
                		<div class="row">
                			<div class="col-2 me-1">
                				<a href="/edit-post?id=${job.id}" class="btn btn-secondary btn-sm">Edit</a>
                			</div>
                			<div class="col-4">
    							<button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#delete${job.id}Modal">Delete</button>
								
    							<!-- Modal -->
								<div class="modal fade" id="delete${job.id}Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">	
								        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete this post?</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								      	<h5 class="card-title pt-2">${job.position}</h5>
                						<h6 class="card-subtitle text-muted">${job.company }</h6>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								        
								        <form:form action="/delete-post?id=${job.id}" method="post">
								        <button type="submit" class="btn btn-danger">Delete</button>
								        </form:form>
								      </div>
								    </div>
								  </div>
								</div>
                			</div>
                		</div>

                	</div>
                </div>
                </c:forEach>
                </c:if>          

                </div>
              </div>
        </section>

        <%@ include file="components/footer.jsp" %> 

    </body>
</html>