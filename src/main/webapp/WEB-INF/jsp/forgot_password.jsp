<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LinkedMeIn | Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>
  <body>

	<div class="container">
         
	<form action="/forgot_password" method="post" style="max-width: 420px; margin: 0 auto;">
	<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
						
		<div class="mt-5 p-3">
			<h3 class="text-center">Forgot Password</h3>
			
    		<div>
        		<p>We will be sending a reset password link to your email.</p>
    		</div>
    		<div>
        		<p>
            	<input type="email" name="email" class="form-control" placeholder="Enter your e-mail" required autofocus/>
        		</p>         
        		<p class="text-center">
            		<input type="submit" value="Send" class="btn btn-primary" />
        		</p>
        		
        		<c:if test="${error != null}">
    				<p class="text-danger text-center">${error}</p>
    			</c:if>
    			<c:if test="${message != null}">
    				<p class="text-warning text-center">${message}</p>
    			</c:if>
        		
        		<footer class="mt-5 text-center">&copy;<span class="navbar-brand mt-1 h1">Linked<span class="text-primary">Me</span>In</span>
        			2022. Made with <i class="fa-solid fa-heart"></i> in Penang. </footer>
    		</div>
		</div>
	</form>
 	
	</div> <!--  end of container -->
	
  	
    
    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>