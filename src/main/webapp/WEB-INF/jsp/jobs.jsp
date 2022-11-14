<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <%@ include file="components/meta.jsp" %> 
        <title>Jobs Opportunities</title>
        <%@ include file="components/head.jsp" %> 
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
        <%@ include file="components/navbar.jsp" %> 
        
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

        <%@ include file="components/footer.jsp" %> 

		<script>
			setTimeout(function() {
        		bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    		}, 3000)
		</script>
     
    </body>
</html>