<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <%@ include file="components/meta.jsp" %> 
    <title>Homepage</title>
    <%@ include file="components/head.jsp" %> 
  </head>
  <body>
        <%@ include file="components/navbar.jsp" %> 

    <main>
        <section class="py-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 mx-auto">
                    <img class="img-fluid mb-3" src="assets/img/comm_skills_web_copy.jpg" alt="welcome">
                    <h2 class="fw-light mb-2">Welcome to LinkedMeIn Portal</h2>
                    <p class="lead text-muted">We are a digital talents platform with the mission to deliver growth for software developers talents and enterprises in the digital economy.
                    	Join our largest developer community!
                    </p>
                    <a href="/signup" class="btn btn-success">Sign up now</a>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="components/footer.jsp" %> 
  </body>
</html>