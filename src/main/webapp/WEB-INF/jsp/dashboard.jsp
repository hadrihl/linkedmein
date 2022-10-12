<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
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
                        <a href="/about" class="nav-link">About</a>
                    </li>
                    <li class="nav-item active">
                      <a href="/contact" class="nav-link">Contact</a>
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

    <section>
      <div class="container" style="margin-top: 600px;"></div>
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