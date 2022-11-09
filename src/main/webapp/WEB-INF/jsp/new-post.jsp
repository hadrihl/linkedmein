<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>New Post</title>
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
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
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
    }, 3000)
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
    }, 3000)
	</script>
	</c:if>         

    <section class="container mb-5" style="margin-top: 30px;">
          
      <form:form action="/new-post" method="POST" modelattribute="post">
      	<div class="card px-5 py-5" style="max-width: 100vw !important;">
  			<div class="card-body">
    		<h3 class="card-title text-center mb-5">Post Free Job Listing</h3>
    		<h6 class="card-subtitle mb-2 text-muted text-center">New Job Post</h6>
    		<p class="card-text text-center text-muted">Create a job post available at your company or some awesome places and find the right applicants for your open role  to recruit talent through LinkedMeIn Portal.</p>
    		
    		<div class="form-group mb-3">
    			<label for="inputPosition">*Position:</label>
    			<input type="text" class="form-control" name="position" id="position" aria-describedby="positionHelp" required autofocus>
    			<small id="positionHelp" class="form-text text-muted">Describe job position.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputSalary">*Salary (MYR):</label>
    			<input type="text" class="form-control" name="salary" id="salary" aria-describedby="salaryHelp" required>
    			<small id=""salaryHelp"" class="form-text text-muted">Describe actual or indicative salary (MYR) for the job position.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputContent">*Content:</label>
    			<textarea class="form-control" name="content" id="content" rows="10" aria-describedby="countryHelp" required></textarea>
    			<small id="countryHelp" class="form-text text-muted">Describe or explain the job roles, description, requirements, etc; here.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCompany">*Company Name:</label>
    			<input type="text" class="form-control" name="company" id="company" aria-describedby="companyHelp" required>
    			<small id="companyHelp" class="form-text text-muted">Type the name of the company that offer the job.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCity">*City:</label>
    			<input type="text" class="form-control" name="city" id="city" aria-describedby="cityHelp" required>
    			<small id="cityHelp" class="form-text text-muted">Type the name of city of the company's location.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCountry">*Country:</label>
    			<input type="text" class="form-control" name="country" id="country" aria-describedby="countryHelp" required>
    			<small id="countryHelp" class="form-text text-muted">Type the name of country of the company's location.</small>
    		</div>
    		
    		<div class="form-check mt-5">
  				<input class="form-check-input" type="checkbox" value="" id="checkbox1">
  				<label class="form-check-label" for="flexCheckDefault">
    				<small class="form-text text-muted">I hereby declare that the information provided is true and correct. I also understand that any 
    				willful dishonesty may render immediate removal of this job post and lawful consideration by LinkedMeIn Company.</small>
  				</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="checkbox2">
  				<label class="form-check-label" for="flexCheckDefault">
    				<small class="form-text text-muted">I agree to the terms and conditions as set out by the user agreement and our terms of service.</small>
  				</label>
			</div>
    		
    		<div class="d-grid gap-2 mt-4">
  				<a href="/jobs" class="btn btn-danger">Cancel</a>
  				<button type="submit" name="submit" id="submit" class="btn btn-success">Submit</button>
			</div>
  			</div>
		</div>
      </form:form>
    </section>
  
  	<footer class="py-5 bg-light text-muted mt-5">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
    	$('#submit').prop("disabled", true);
    	
    	$(".form-check-input").on("change", function() {
    		verifyCheckboxes("checkbox1", "checkbox2");
    	});
    	
    	function verifyCheckboxes(element1, element2) {
    		var submitBtn = document.getElementById("submit");
    		var checkbox1 = document.getElementById("checkbox1");
    		var checkbox2 = document.getElementById("checkbox2");
    		
    		if(checkbox1.checked == true && checkbox2.checked == true) {
    			submitBtn.class = "submit";
    			submitBtn.removeAttribute("disabled");
    		} else {
    			submitBtn.class = "button:disabled";
    			submitBtn.setAttribute("disabled", "disabled");
    		}
    	}
	</script>
  </body>
</html>