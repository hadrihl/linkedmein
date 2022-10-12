<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration | Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>
  <body>

    <div class="d-flex align-items-center justify-content-center vh-100">
        <div class="text-center">
            <p class="fs-3">Your account has been verified.</p> <i class="fa-regular fa-face-smile-hearts"></i>
            <p class="lead">Please login using our sign in page. You will be re-direct to LinkedMeIn website in <span id="count">5</span></p>
        </div>
    </div>
	
  	<!-- footer -->	
 	<div class="container">
 		<footer class="mb-5">&copy; 2022. Made with <i class="fa-solid fa-heart"></i> in Penang. </footer>
 	</div>
    
    <script>
    	let counter = +document.getElementById('count').innerText;
    	let count = counter - 1;
    	
    	setInterval(() => {
         document.getElementById('count').textContent = count;
    		count--;
    		if(count < 1) location.replace('http://localhost:8080/');
    	}, 1000);
    </script>
    <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>