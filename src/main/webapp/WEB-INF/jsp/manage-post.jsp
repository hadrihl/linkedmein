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
            <div class="container py-4 mb-5">
        
                <div class="row" style="margin-top: 20px;">
                
                <c:if test="${empty jobs}">
                	<div class="container">
                		<p>No jobs opportunities found.</p>
                	</div>
                </c:if>
                
                
                <div class="card py-5">
                	<c:if test="${not empty jobs}">
                	<table class="table .table-responsive .w-auto">
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

        <%@ include file="components/footer.jsp" %> 

    </body>
</html>