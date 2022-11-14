<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <%@ include file="components/meta.jsp" %> 
    <title>Contact</title>
    <%@ include file="components/head.jsp" %> 
  </head>
  <body>
    <%@ include file="components/navbar.jsp" %> 
    
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
                <a href="/signup" class="btn btn-warning">Sign up here</a>
            </div>
        </section>
    </main>

    <%@ include file="components/footer.jsp" %> 
  </body>
</html>