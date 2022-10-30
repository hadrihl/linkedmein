<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sign in</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
    <form class="mt-5" action="/login" method="post">
    <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
						
        <div class="card" style="width: 20rem; margin: auto;">
            <div class="card-body text-center">
                <span class="navbar-brand mt-1 h1">Linked<span class="text-primary">Me</span>In</span>
                <h1 class="mb-4">Sign in</h1>
                <div class="form-group mt-2">
                    <label for="email" class="visually-hidden">email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email" required autofocus>
                </div>
                <div class="form-group mt-2">
                    <label for="password" class="visually-hidden">password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                </div>
                <div class="form-group mt-3 mb-4">
                    <label>
                        <input type="checkbox" id="remember-me"> Remember me
                    </lael>
                </div>
                <div class="form-group d-grid gap-2">
                    <button type="submit" class="btn btn-success w-100"> Sign in with Email</button>
                    
                    <a href="/forgot_password">Forgot your password?</a>
                    
                    <c:if test="${error_string != null}">
                		<div class="mt-2 alert alert-warning alert-dismissible fade show" role="alert">
  							${error_string}
  							<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</c:if>
                </div>
                <footer class="mt-5 text-muted">&copy; 2022. <a href="/">linkedMeIn</a> portal.<br/>
                    Made with <i class="fa-solid fa-heart"></i> in Penang.<br/>
                    <i class="fa-brands fa-github"></i>
                    <a href="https://github.com/hadrihl/linkedmein"> linkedmein</a>
                </footer>
            </div>
        </div>
    </form>

    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>