<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
  <head>
    <%@ include file="components/meta.jsp" %> 
    <title>Profile</title>
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

    <section class="container col-lg-4" style="margin-top: 30px;">
      <h2 class="fw-light text-center">Edit Profile</h2>
    </section>
 
    <section>
      <div class="container mt-3 mb-3">
        <div class="card" style="max-width: 100vw !important; margin: auto;" modelattribute="username">
          <div class="card-body row">
            <h5 class="card-title">Username</h5>
            <p class="col-11 card-text">${username}</p>
            <a class="col-1" href="#usernameModal" data-bs-target="#usernameModal" data-bs-toggle="modal"><i class="fa-solid fa-pen-to-square"></i></a>

            <!-- modal -->
            <div class="modal fade" id="usernameModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Change Username</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  
                  <form action="/update-username?id=${user_id}" method="post" modelattribute="user_id">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  
                  <div class="modal-body">
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Username:</label>
                        <input type="text" name="username" class="form-control" value="${username}">
                      </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>
                  </form>
                  
                </div>
              </div>
            </div>
          <!-- end of modal -->
          </div>
        </div>
        </form>
      </div>
    </section>
    
    <section>
      <div class="container mb-3">      	
        <div class="card" style="max-width: 100vw !important; auto;" modelattribute="email">
          <div class="card-body row">
            <h5 class="card-title">Email</h5>
            <p class="col-11 card-text">${email}</p>
            <a class="col-1" href="#emailModal" data-bs-target="#emailModal" data-bs-toggle="modal"><i class="fa-solid fa-pen-to-square"></i></a>

            <!-- modal -->
            <div class="modal fade" id="emailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Change Email</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  
                  <form action="/update-email?id=${user.id}" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <div class="modal-body">
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Email:</label>
                        <input type="email" name="email" class="form-control" value="${email}">
                      </div>
                    
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>
                  </form>
                </div>
              </div>
            </div>
          <!-- end of modal -->
          </div>
        </div>

      </div>
    </section>
    
    
    <section>
      <div class="container mb-3">
        <div class="card" style="max-width: 100vw !important; margin: auto;">
          <div class="card-body row">
            <h5 class="card-title">Password</h5>
            <p class="col-11 card-text">**********</p>
            <a class="col-1" href="#passModal" data-bs-target="#passModal" data-bs-toggle="modal"><i class="fa-solid fa-pen-to-square"></i></a>

            <!-- modal -->
            <div class="modal fade" id="passModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Change Password</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  
                  <form action="/update-password?id=${user_id}" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <div class="modal-body">
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Type your old password:</label>
                        <input class="form-control mb-2" type="password" name="oldpassword" class="form-control">
                        <label for="recipient-name" class="col-form-label">Type your new password:</label>
                        <input class="form-control mb-2" type="password" name="newpassword" class="form-control">
                      </div>
                  </div>
                  
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>
                  </form>
                </div>
              </div>
            </div>
          <!-- end of modal -->
          </div>
        </div>
      </div>
    </section>
    
    
    <section>
      <div class="container mb-3">
        <div class="card" style="max-width: 100vw !important; margin: auto;">
          <div class="card-body row">
            <h5 class="card-title">User Information</h5>
            <p class="col-11 card-text">Update your name, short bio, company and many more.</p>
            <a class="col-1" href="#infoModal" data-bs-target="#infoModal" data-bs-toggle="modal"><i class="fa-solid fa-pen-to-square"></i></a>

            <!-- modal -->
            <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Change User Information</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  
                  <form action="/update-information?id=${user_id}" method="post" modelattribute="user">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    
                  <div class="modal-body">                                       
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">First Name:</label>
                        <input type="text" name="firstname" class="form-control" value="${user.firstname}">
                      </div>
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Last Name:</label>
                        <input type="text" name="lastname" class="form-control" value="${user.lastname}">
                      </div>
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Short Bio:</label>
                        <input type="text" name="bio" class="form-control" value="${user.bio}">
                      </div>
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Company:</label>
                        <input type="text" name="company" class="form-control" value="${user.company}">
                      </div>
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">City:</label>
                        <input type="text" name="city" class="form-control" value="${user.city}">
                      </div>
                      <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Country:</label>
                        <input type="text" name="country" class="form-control" value="${user.country}">
                      </div>
                      <div class="mb-3">
                        <label class="form-label" for="customFile">Profile photo</label>
            			<input type="file" name="img" class="form-control" id="customFile" value="" />
                      </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>
                  </form>
                </div>
              </div>
            </div>
          <!-- end of modal -->
          </div>
        </div>
      </div>
    </section>

    <%@ include file="components/footer.jsp" %> 
  </body>
</html>