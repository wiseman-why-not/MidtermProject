<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hulu&Hang</title>
		<jsp:include page="topStyle.jsp"></jsp:include>
		<link rel="stylesheet" href="./css/homeStyle.css">
	</head>
	<body id="indexPage">	
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container">
			<section class="login">
				<form action="login.do" method="post">
					<h2>Log in</h2>
					<div class="form-group">
	    				<label for="userName">UserName</label>
	    				<input type="text" name="userName" id="userName" class="form-control">
  					</div>
  					<div class="form-group">
    					<label for="password">Password</label>
    					<input type="password" name="password" id="password" class="form-control">
  					</div>
  					<c:if test="${loginFail}">
  						<p class="input-error">Incorrect Username/PassWord</p>
  					</c:if>
  					<input type="submit" value="Log In"/>
				</form>
				<a href="create.do">Create User</a>
			</section>
			<canvas></canvas>
			<section class="site-descrip">
				<hr />
				<h2 >Welcome to Hulu&Hang!</h2>
				<p style="text-align: center; font-size: 50">
				 <br>
				We are a social networking platform doing things a little differently! <br><br>
				You tell us about your streaming preferences, and we’ll tell you who we think would be a good match for you!<br><br>
				Whether you’re looking to watch and chat, or “Netflix™ and chill”, it’s all much easier with <br><br>
				Hulu&Hang
				</p>
			</section>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
		<script>
			let posters = [];
			let width = window.innerWidth
			let c = document.querySelector("canvas");
			let canvas = c.getContext("2d");
			let posterHeight = window.innerHeight * 0.267;
			let posterWidth = window.innerWidth * 0.123;
			let rowone = window.innerHeight * 0.05;
			let rowtwo = window.innerHeight * 0.367;
			let rowthree = window.innerHeight * 0.684;
			c.width = window.innerWidth;
			c.height = window.innerHeight;
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/db32LaOibwEliAmSL2jjDF6oDdj.jpg", -width * 0.143, rowone, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg", -width * 0.286, rowone, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/AuGiPiGMYMkSosOJ3BQjDEAiwtO.jpg", -width * 0.429, rowone, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg", -width * 0.572, rowone, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/p69QzIBbN06aTYqRRiCOY1emNBh.jpg", -width * 0.715, rowone, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/s5HQf2Gb3lIO2cRcFwNL9sn1o1o.jpg", -width * 0.858, rowone, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg", -width * 1.001, rowone, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg", -width * 1.14, rowone, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/pjeMs3yqRmFL3giJy4PMXWZTTPa.jpg", width + (width * 0.143) - posterWidth, rowtwo, -1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg", width + (width * 0.286) - posterWidth, rowtwo, -1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/zfE0R94v1E8cuKAerbskfD3VfUt.jpg", width + (width * 0.429) - posterWidth, rowtwo, -1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg", width + (width * 0.572) - posterWidth, rowtwo, -1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/dtRbVsUb5O12WWO54SRpiMtHKC0.jpg", width + (width * 0.715) - posterWidth, rowtwo, -1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/jpfkzbIXgKZqCZAkEkFH2VYF63s.jpg", width + (width * 0.858) - posterWidth, rowtwo, -1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/nBNZadXqJSdt05SHLqgT0HuC5Gm.jpg", width + (width * 1.001) - posterWidth, rowtwo, -1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/5vHssUeVe25bMrof1HyaPyWgaP.jpg", width + (width * 1.14) - posterWidth, rowtwo, -1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg", -width * 0.143, rowthree, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg", -width * 0.286, rowthree, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/fa4PxEPRKWRyjzYje1jM4m30qzd.jpg", -width * 0.429, rowthree, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/y31QB9kn3XSudA15tV7UWQ9XLuW.jpg", -width * 0.572, rowthree, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/20djTLqppfBx5WYA67Y300S6aPD.jpg", -width * 0.715, rowthree, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg", -width * 0.858, rowthree, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg", -width * 1.001, rowthree, 1));
			posters.push(createShape(posterWidth, posterHeight, "https://image.tmdb.org/t/p/w185_and_h278_bestv2/30YacPAcxpNemhhwX0PVUl9pVA3.jpg", -width * 1.14, rowthree, 1));
			
			function createShape(width, height, image, x, y, dir) {
				return {
					left: x,
					top: y,
					width: width,
					height: height,
					image: image,
					direction: dir
				}
			}
			
			window.onload = animate();
			
			function animate() {
				canvas.clearRect(0, 0, canvas.canvas.width, canvas.canvas.height);
				for ( i=0;i<posters.length;i++){
					let image = new Image();
					image.src = posters[i].image
					if(posters[i].direction === -1 && posters[i].left < (posterWidth * -1) ) {
						posters[i].left = width + (width * 0.02);
					} else if(posters[i].direction === 1 && posters[i].left >  width) {
						posters[i].left = 0 - (width * 0.02) - posterWidth;
					}
					canvas.drawImage( image, posters[i].left += posters[i].direction,posters[i].top,posters[i].width,posters[i].height);
			    }
				requestAnimationFrame(animate);
			}
		</script>
	</body>
</html>