<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
    <nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top">
        <div class="container">
            <span class="navbar-brand mt-1 h1">Linked<span class="text-primary">Me</span>In</span>

            <button type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" class="navbar-toggler" 
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle Navigation"><span class="navbar-toggler-icon"></span></button>
    
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a href="#" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item active">
                        <a href="#" class="nav-link">About</a>
                    </li>
                    <li class="nav-item active">
                      <a href="#" class="nav-link">Contact</a>
                    </li>
                    <li class="nav-item active">
                      <a href="#" class="nav-link">Find</a>
                    </li>
                </ul>
            </div>

            <button type="button" class="btn btn-outline-dark me-2" style="border: none;">@hadrihl</button>
            <button type="button" class="btn btn-danger">Logout</button>
        </div>

    </nav>

    <section class="container col-lg-4" style="margin-top: 100px;">
      <h2 class="fw-light text-center">Edit Profile</h2>
        <form class="form-group" action="/update-profile" method="post" modelAttribute="user">
      
          <div class="mb-3">
            <label class="form-label">ID: </label>
            <input class="form-control" name="id" value="" aria-label="Store ID" readonly="true" />
          </div>

          <div class="mb-3">
            <label class="form-label">*Username: </label>
            <input type="email" class="form-control" name="username" id="username" value="" aria-label="username" required />
          </div>
  
          <div class="mb-3">
            <label class="form-label">*Email: </label>
            <input type="email" class="form-control" name="email" id="email" value="" aria-label="email" required />
          </div>
  
          <div class="mb-3">
            <label class="form-label">*First Name: </label>
            <input class="form-control" name="firstname" id="firstname" value="" aria-label="first name" required />
          </div>
  
          <div class="mb-3">
            <label class="form-label">*Last Name: </label>
            <input class="form-control" name="lastname" id="lastname" value="" aria-label="last name" required />
          </div>
  
          <div class="mb-3">
            <label class="form-label">*Company: </label>
            <input class="form-control" name="company" id="company" value="" aria-label="company" required />
          </div>

          <div class="mb-3">
            <label class="form-label">*City: </label>
            <input class="form-control" name="city" id="city" value="" aria-label="country" required />
          </div>

          <div class="mb-3">
            <label class="form-label">*Country: </label>
            <input class="form-control" name="country" id="country" value="" aria-label="country" required />
          </div>
          
          <div class="mb-3">
            <label class="form-label" for="customFile">Profile photo</label>
            <input type="file" name="img" class="form-control" id="customFile" value="" />
          </div>
          
          <div class="py-5">
            <a href="#" class="btn btn-danger">Cancel</a>
            <button type="submit" class="btn btn-success">Update</button>
          </div>
        </form>

      </div>
    </section>

    <footer class="py-5 bg-light text-muted">
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
  </body>
</html>