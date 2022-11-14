<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
  <head>
    <%@ include file="components/meta.jsp" %> 
    <title>Edit Post</title>
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
          
      <form:form action="/update-post?id=${job.id}" method="POST" modelattribute="job">
      	<div class="card px-5 py-5" style="max-width: 100vw !important;">
  			<div class="card-body">
  			
  			<div class="form-group mb-5">
  				<select class="form-select" name="status" aria-label="Default select example">
  					<c:if test="${job.status eq true }">
  						<option selected>Available</option>
  						<option value="0">Closed</option>
  					</c:if>
  					<c:if test="${job.status eq false }">
  						<option selected>Closed</option>
  					<option value="1">Available</option>
  					</c:if>
				</select>
  			</div>
  			
    		<h3 class="card-title text-center mb-5">Edit Job Posting {${job.id}}</h3>
    		<p class="card-text text-center text-muted">Update your job posting here and remember to click update.</p>
    		
    		<div class="form-group mb-3">
    			<label for="inputPosition">*Position:</label>
    			<input type="text" class="form-control" name="position" id="position" value="${job.position }" aria-describedby="positionHelp" required autofocus>
    			<small id="positionHelp" class="form-text text-muted">Describe job position.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputSalary">*Salary:</label>
    			<input type="text" class="form-control" name="salary" id="salary" value="${job.salary}" aria-describedby="salaryHelp" required>
    			<small id=""salaryHelp"" class="form-text text-muted">Describe actual or indicative salary (MYR) for the job position.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputContent">*Content:</label>
    			<textarea class="form-control" name="content" id="content" rows="10" 
    				aria-describedby="countryHelp" required>${job.content}</textarea>
    			<small id="countryHelp" class="form-text text-muted">Describe or explain the job roles, description, requirements, etc; here.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCompany">*Company Name:</label>
    			<input type="text" class="form-control" name="company" id="company" value="${job.company}" aria-describedby="companyHelp" required>
    			<small id="companyHelp" class="form-text text-muted">Type the name of the company that offer the job.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCity">*City:</label>
    			<input type="text" class="form-control" name="city" id="city" value="${job.city}" aria-describedby="cityHelp" required>
    			<small id="cityHelp" class="form-text text-muted">Type the name of city of the company's location.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCountry">*Country:</label>
    			<input type="text" class="form-control" name="country" id="country" value="${job.country}" aria-describedby="countryHelp" required>
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
  				<a href="/manage-post" class="btn btn-danger" >Cancel</a>
  				<button class="btn btn-success" type="submit" name="submit" id="updateBtn">Update</button>
			</div>
  			</div>
		</div>
      </form:form>
    </section>
  
  	<%@ include file="components/footer.jsp" %> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <!-- js to check checkboxes -->
	<script>
    $('#updateBtn').prop("disabled", true);
    	
    $(".form-check-input").on("change", function() {
    	verifyCheckboxes("checkbox1", "checkbox2");
    });
    	
    function verifyCheckboxes(element1, element2) {
    	var submitBtn = document.getElementById("updateBtn");
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