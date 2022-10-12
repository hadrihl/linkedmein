<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Homepage</title>
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

            <a href="/signin" class="btn btn-primary">Sign in</a>
        </div>
    </nav>

    <main>
        <section class="py-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 mx-auto">
                    <img class="img-fluid mb-3" src="assets/img/comm_skills_web_copy.jpg" alt="welcome">
                    <h2 class="fw-light mb-2">Welcome to LinkedMeIn Portal</h2>
                    <p class="lead text-muted">We are a digital talents platform with the mission to deliver growth for software developers talents and enterprises in the digital economy.</p>
                    <a href="/signup" class="btn btn-success">Sign up now</a>
                </div>
            </div>
        </section>
    </main>

    <footer class="py-5 bg-light text-muted">
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <div class="d-flex justify-content-start">
                        <span>&copy; 2022. <a href="/">LinkedMeIn</a> portal.<br/>
                            Made with <i class="fa-solid fa-heart"></i> in Penang.<br/>
                            <i class="fa-brands fa-github"></i>
                            <a href="https://github.com/hadrihl/linkedmein"> linkedmein</a>
                        </span>
                    </div>
                    
                </div>
                <div class="col-4">
                    <div class="d-flex justify-content-end">
                        <a class="me-2" href="#">Sitemap</a>
                        <a href="#">Privacy</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>