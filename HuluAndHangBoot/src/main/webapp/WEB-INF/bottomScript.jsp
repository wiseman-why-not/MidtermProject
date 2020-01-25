<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
	window.addEventListener("scroll", () => {
		let header = document.querySelector("header");
		if(window.scrollY > 31 && header.classList.contains("fullView")) {
			console.log("bye")
			header.classList.remove("fullView")
			header.classList.add("collapseView")
		} else if(window.scrollY < 30 && header.classList.contains("collapseView")){
			console.log("hello")
			header.classList.remove("collapseView")
			header.classList.add("fullView")
		}
	})
</script>