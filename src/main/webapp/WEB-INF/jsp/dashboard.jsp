<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <%@ include file="components/meta.jsp" %> 
        <title>Dashboard</title>
        <%@ include file="components/head.jsp" %> 
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

                <h2>(<span modelattribute="count">${count}</span>) registered users</h2>
        
                <div class="row py-4">
                
                <c:if test="${empty users}">
                	<div class="container">
                		<p>No user profile found.</p>
                	</div>
                </c:if>
                
                <c:if test="${not empty users}">
                	<c:forEach var="user" items="${users}">
                	
                	<c:choose>
                		<c:when test="${user.firstname == null}">
                		<div class="col-lg-4 mb-5">
                		<div class="card text-center" style="width: 18rem;">
	                		<svg class="bd-placeholder-img card-img-top" width="18rem" height="28.3rem" xmlns="http://www.w3.org/2000/svg" role="img" focusable="false">
								<rect width="100%" height="100%" fill="#868e96"></rect>
							</svg>
	                	<div class="card-body" style="margin-bottom: 8.8rem;">
	                		<h4 class="card-title">${user.username}</h4>
	                		<h5 class="card-text">${user.email}</h5>
	                	</div>
	                	</div>
	                	</div>
                		</c:when>
                		<c:otherwise>
                			<div class="col-lg-4 mb-5">
	                			<div class="card" style="width: 19rem;">
	                				<img src="assets/img/${user.img}" class="card-img-top" alt="avatar">
	                				<div class="card-body text-center">
	                					<h4 class="card-title">${user.firstname} ${user.lastname} 
	                						<a href=""><i class="fa-solid fa-circle-check" title="verified"></i></a>
	                					</h4>
	
	                					<i class="fa-brands fa-twitter"></i>
	                          			<i class="fa-brands fa-linkedin"></i>
	                          			<a href="https://www.github.com/hadrihl"><i class="fa-brands fa-github"></i></a>
	                					
	                					<p class="card-text">${user.bio}</p>
	                					<p><i class="fa-sharp fa-solid fa-building"></i> ${user.company} <br> 
	                						${user.city} ${user.country}</p>
	                						
	                					<form>
	                          				<a href="#" class="btn btn-outline-primary">Follow</a>
	                          				<a href="#" class="btn btn-outline-secondary">Message</a>
	                        			</form>
	                				</div>
	                			</div>
	                		</div>
                		</c:otherwise>
                	</c:choose>
                		
                	</c:forEach>
                </c:if>

                </div>
              </div>
        </section>

        <%@ include file="components/footer.jsp" %>
    </body>
</html>