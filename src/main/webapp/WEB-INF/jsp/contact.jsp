<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contact</title>
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

            <button type="button" class="btn btn-primary">Sign in</button>
        </div>
    </nav>

    <main>
        <section class="py-5 text-center">
            <div class="container">
                <div class="row py-lg-5">
                    <div class="col-lg-6 mx-auto">
                        <img class="img-fluid mb-3" src="assets/img/group-2.jpeg" alt="welcome">
                        <h2 class="fw-light mb-2">Contact Us</h2>
                        <p class="lead text-muted">
                            Speak with our dedicated education consultants to pick the best course for you.
                        </p>
                        <p class="fw-light text-muted">Email: inquiry@linkedmein.com.my</p>
                        <p class="fw-light text-muted">Phone: +604 - 2180 248</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 text-center bg-light">
            <div class="container">
                <h2 class="fw-light mb-4">Locate Us</h2>

                <div class="row container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3972.006221163123!2d100.33956241431451!3d5.41602083654876!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x304ac3e21aa452f7%3A0x5d72532ef1412cb0!2sBangunan%20Wawasan!5e0!3m2!1sen!2smy!4v1660461424283!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </section>

        <section class="py-5 text-center bg-white">
            <div class="container">
                <h2 class="fw-light mb-4">Interested to Join Us?</h2>
                <button type="submit" class="btn btn-warning">Sign up here</button>
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