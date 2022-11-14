<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <%@ include file="components/meta.jsp" %> 
        <title>Dashboard</title>
        <%@ include file="components/head.jsp" %> 
        <style>
            .card {
              width: 330px;
              height: 560px;
              border-radius: 12px;
              box-shadow: 6px 6px 10px #ccc, 6px 6px 20px #ccc;
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
        </style>
    </head>
    
    <body>
        <%@ include file="components/navbar.jsp" %>        
         
        <section>
        	<div class="container mt-3">
					<c:url var="search_url" value="/search" />
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
        
                <div class="row" style="margin-top: 20px;">
                
                <c:if test="${empty users}">
                	<div class="container">
                		<p>No user profile found.</p>
                	</div>
                </c:if>
                
                <c:if test="${not empty users}">
                	<c:forEach var="user" items="${users}">
                		<div class="col-md-12 col-lg-4 col-sm-3 text-center">
                			<div class="card">
                				<img src="assets/img/${user.img}" class="card-img-top" alt="avatar">
                				<div class="card-body">
                					<h4 class="card-title">${user.firstname} ${user.lastname} 
                						<a href=""><i class="fa-solid fa-circle-check" title="verified"></i></a>
                					</h4>
                					<div class="row-cols-md-9">
                						<i class="fa-brands fa-twitter"></i>
                          				<i class="fa-brands fa-linkedin"></i>
                          				<a href="https://www.github.com/hadrihl"><i class="fa-brands fa-github"></i></a>
                					</div>
                					
                					<p class="card-text">${user.bio}</p>
                					<p><i class="fa-sharp fa-solid fa-building"></i> ${user.company} <br> 
                						${user.city} ${user.country}</p>
                						
                					<form class="text-center">
                          				<a href="#" class="btn btn-outline-primary">Follow</a>
                          				<a href="#" class="btn btn-outline-secondary">Message</a>
                        			</form>
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