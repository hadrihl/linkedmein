<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <%@ include file="components/meta.jsp" %> 
    <title>About us</title>
    <%@ include file="components/head.jsp" %> 
  </head>
  <body>
    <%@ include file="components/navbar.jsp" %> 
    
    <main>
        <section class="py-1 text-center">
            <div class="container">
                <div class="row py-lg-5">
                    <div class="col-lg-6 mx-auto">
                        <img class="img-fluid mb-3" src="assets/img/group-4.jpg" alt="welcome">
                        <h2 class="fw-light">About us</h2>  
                    </div>
                </div>
    
                <div class="row">
                    <div class="row row-cols-1 row-cols-md-3 mb-5 text-center">
                        <div class="col">
                            <div class="card mb-4 rounded-3 shadow-sm h-100">
                                <div class="card-header py-3">
                                    <h4 class="fw-normal">Vision</h4>
                                </div>
                                <div class="card-body">
                                    <p>To be leading Digital Learning and Software Talent Platform</p>
                                </div>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="card mb-4 rounded-3 shadow-sm h-100">
                                <div class="card-header py-3">
                                    <h4 class="fw-normal">Mission</h4>
                                </div>
                                <div class="card-body">
                                    <p>Deliver future-ready talents and enterprises to community</p>
                                </div>
                            </div>
                        </div>
    
                        <div class="col">
                            <div class="card mb-4 rounded-3 shadow-sm h-100">
                                <div class="card-header py-3">
                                    <h4 class="fw-normal">Our Value and Culture</h4>
                                </div>
                                <div class="card-body">
                                    <p>We learn, innovate and grow</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 text-center bg-light">
            <div class="container">
                <h2 class="fw-light mb-4">Our Team</h2>
                <div class="row row-cols-1 row-cols-md-3 mb-5 text-center">
                    <div class="col">
                        <div class="rounded mb-4 shadow-sm px-4 h-100">
                            <img src="assets/img/pexels-creation-hill-1681010_person3.jpg" alt width="100" class="img-fluid rounded-circle mt-3 mb-3 img-thumbnail shadow-sm">
                            <h5>Judy Hill</h5>
                            <span class="small text-uppercase text-muted">Founder, CEO</span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="rounded mb-4 shadow-sm px-4 h-100">
                            <img src="assets/img/pexels-andrea-piacquadio-774909_person2.jpg" alt width="100" class="img-fluid rounded-circle mt-3 mb-3 img-thumbnail shadow-sm">
                            <h5>Andrea Piacquadio</h5>
                            <span class="small text-uppercase text-muted">Trainer</span>
                        </div>
                    </div>
                    <div class="col">
                        <div class="rounded mb-4 shadow-sm px-4 h-100">
                            <img src="assets/img/pexels-pixabay-220453_person1.jpg" alt width="100" class="img-fluid rounded-circle mt-3 mb-3 img-thumbnail shadow-sm">
                            <h5>David Dein</h5>
                            <span class="small text-uppercase text-muted">Founder, Trainer</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-white text-center">
            <div class="container">
                <h2 class="fw-light text-muted mb-3">Our Story</h2>
                <p class="fw-normal text-muted mt-4 mb-4">
                    Digital revolution is transforming jobs and has resulted in critical skills gaps that are struggling to fill. Korn 
                    Ferry's Global Talent Crunch study estimates that Asia Pacific is set to suffer the most severe skills crunch globally 
                    with talents deficit estimated at 55% of the global shortages by 2030.</p>
                <p class="fw-normal text-muted mt-4 mb-4">
                    Covid-19 outbreak has torn down all barriers to learning and working online. More than just delivering digitally 
                    skilled talents with CLaaS, our Pan-Asia eduCLaaS platform connects higher education students, working adults, 
                    industry experts, tech vendors, enterprises, employers, and higher education institutions for delivering total 
                    training and talents solution which is able to holistically mitigate the digital skills gap between emerging and 
                    developed economies across Asia at scale.</p>
                <p class="fw-normal text-muted mt-4 mb-4">
                    We believe that learning and work will intertwine for a converged future where learning is work and work is learning. 
                    Our solution for connecting the future of learning and work is eduCLaaS - a learning and talent cloud able to bridge 
                    digital skills gap and rising income inequality across Asia.
                </p>
            </div>
        </section>
    </main>

    <%@ include file="components/footer.jsp" %> 
  </body>
</html>