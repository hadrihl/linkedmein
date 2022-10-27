<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LinkedMeIn | Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>
  <body>

	<div class="container">
		<div class="mt-5 p-3">
			<h3 class="text-center">Reset Password</h3>
			
			<c:if test="${message != null}">
    				<p class="text-center">${message}</p>
    		</c:if>
    		
    		<p class="text-center">Please login using your new password on sign in page. You will be re-direct to LinkedMeIn website in <span id="count">5</span></p>
		</div>
		
		<footer class="mt-5 text-center">&copy;<span class="navbar-brand mt-1 h1">Linked<span class="text-primary">Me</span>In</span>
        			2022. Made with <i class="fa-solid fa-heart"></i> in Penang. </footer>
	</div>
	
  	<script>
  		let counter = +document.getElementById('count').innerText;
		let count = counter - 1;
	
		setInterval(() => {
     		document.getElementById('count').textContent = count;
			count--;
			if(count < 1) location.replace('http://localhost:8080/');
		}, 1000);
  	</script>
    
    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>