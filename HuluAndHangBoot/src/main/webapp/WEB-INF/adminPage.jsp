<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hulu&Hang</title>
		<jsp:include page="topStyle.jsp"></jsp:include>
		<link rel="stylesheet" href="./css/adminStyle.css">
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<main class="container">
			
			<section class="admin-detail">
				<article class="admin-image">
					<h3>${user.username}</h3>
					<img src="${user.imageURL}" alt="User Profile pic"/>
				</article>
				<article>
					<div>
						<h3>User #</h3>
						<h3>${users.size()}</h3>
					</div>
				</article>
				<article>
					<div>
						<h3>Movie #</h3>
						<h3>${contents.size()}</h3>
					</div>
				</article>
			</section>
			
		<!-- 	A list of all users
		
		<c:if test="${!empty user.imageURL }">				
				<img src="${user.getImageURL() }" alt="User Profile pic"width="30" height="30"/>
				</c:if>
				
				<c:if test="${empty user.imageURL }">				
				<img src="https://media2.giphy.com/media/1TSI4ZfVAs2Rx4xJLS/source.gif" alt="User Profile pic"width="30" height="30"/>
				</c:if> -->
		
			<section class="user-movies">
						<c:forEach var="user" items="${users}">
							<div class="content-card">
								<article>
									<img class="content-image" src="${user.getImageURL()}" alt="${user.firstName}" />
									<h3>${user.firstName}</h3>
									<c:if test="${user.isActive }">
										<form action="deactivate.do" method="post">
											<input type="hidden" value="${user.id }" name="userId">
											<button type="submit">
												<svg class="unlock" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
													<path d="M437.333,192h-32v-42.667C405.333,66.99,338.344,0,256,0S106.667,66.99,106.667,149.333V160    c0,5.896,4.771,10.667,10.667,10.667H160c5.896,0,10.667-4.771,10.667-10.667v-10.667C170.667,102.281,208.948,64,256,64    s85.333,38.281,85.333,85.333V192H74.667C68.771,192,64,196.771,64,202.667v266.667C64,492.865,83.135,512,106.667,512h298.667    C428.865,512,448,492.865,448,469.333V202.667C448,196.771,443.229,192,437.333,192z M287.938,414.823    c0.333,3.01-0.635,6.031-2.656,8.292c-2.021,2.26-4.917,3.552-7.948,3.552h-42.667c-3.031,0-5.927-1.292-7.948-3.552    c-2.021-2.26-2.99-5.281-2.656-8.292l6.729-60.51c-10.927-7.948-17.458-20.521-17.458-34.313    c0-23.531,19.135-42.667,42.667-42.667s42.667,19.135,42.667,42.667c0,13.792-6.531,26.365-17.458,34.313L287.938,414.823z"/>
												</svg>
											</button>
										</form>
									</c:if>
									<c:if test="${!user.isActive }">
										<form action="reactivate.do" method="post">
										<input type="hidden" value="${user.id }" name="userId">
										<button type="submit">
												<svg class="lock" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
													<path d="M437.333,192h-32v-42.667C405.333,66.99,338.344,0,256,0S106.667,66.99,106.667,149.333V192h-32    C68.771,192,64,196.771,64,202.667v266.667C64,492.865,83.135,512,106.667,512h298.667C428.865,512,448,492.865,448,469.333    V202.667C448,196.771,443.229,192,437.333,192z M287.938,414.823c0.333,3.01-0.635,6.031-2.656,8.292    c-2.021,2.26-4.917,3.552-7.948,3.552h-42.667c-3.031,0-5.927-1.292-7.948-3.552c-2.021-2.26-2.99-5.281-2.656-8.292l6.729-60.51    c-10.927-7.948-17.458-20.521-17.458-34.313c0-23.531,19.135-42.667,42.667-42.667s42.667,19.135,42.667,42.667    c0,13.792-6.531,26.365-17.458,34.313L287.938,414.823z M341.333,192H170.667v-42.667C170.667,102.281,208.948,64,256,64    s85.333,38.281,85.333,85.333V192z"/>
												</svg>
										</button>
										</form>
									</c:if>	
								</article>
								<!--  user description here -->
								<article class="user-description">
									<div class="description-section">
											<svg class="edit-description" onclick="editDescription(this)" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 469.336 469.336" style="enable-background:new 0 0 469.336 469.336;" xml:space="preserve">
												<g>
													<path d="M347.878,151.357c-4-4.003-11.083-4.003-15.083,0L129.909,354.414c-2.427,2.429-3.531,5.87-2.99,9.258     c0.552,3.388,2.698,6.307,5.76,7.84l16.656,8.34v28.049l-51.031,14.602l-51.51-51.554l14.59-51.075h28.025l8.333,16.67     c1.531,3.065,4.448,5.213,7.833,5.765c0.573,0.094,1.146,0.135,1.708,0.135c2.802,0,5.531-1.105,7.542-3.128L317.711,136.26     c2-2.002,3.125-4.712,3.125-7.548c0-2.836-1.125-5.546-3.125-7.548l-39.229-39.263c-2-2.002-4.708-3.128-7.542-3.128h-0.021     c-2.844,0.01-5.563,1.147-7.552,3.159L45.763,301.682c-0.105,0.107-0.1,0.27-0.201,0.379c-1.095,1.183-2.009,2.549-2.487,4.208     l-18.521,64.857L0.409,455.73c-1.063,3.722-0.021,7.736,2.719,10.478c2.031,2.033,4.75,3.128,7.542,3.128     c0.979,0,1.958-0.136,2.927-0.407l84.531-24.166l64.802-18.537c0.195-0.056,0.329-0.203,0.52-0.27     c0.673-0.232,1.262-0.61,1.881-0.976c0.608-0.361,1.216-0.682,1.73-1.146c0.138-0.122,0.319-0.167,0.452-0.298l219.563-217.789     c2.01-1.991,3.146-4.712,3.156-7.558c0.01-2.836-1.115-5.557-3.125-7.569L347.878,151.357z"/>
													<path d="M456.836,76.168l-64-64.054c-16.125-16.139-44.177-16.17-60.365,0.031l-39.073,39.461     c-4.135,4.181-4.125,10.905,0.031,15.065l108.896,108.988c2.083,2.085,4.813,3.128,7.542,3.128c2.719,0,5.427-1.032,7.51-3.096     l39.458-39.137c8.063-8.069,12.5-18.787,12.5-30.192S464.899,84.237,456.836,76.168z"/>
												</g>
											</svg>
											<p class="description">${user.description}</p>
									</div>
									<div class="edit-description-section">
									<form class="description-from" action="adminupdateDescription.do" method="POST">
										<textarea name="description" rows="3" maxlength="93">
										</textarea>
										<input type="hidden" name="userId" value="${user.id}"/>
										<svg  onclick="submitDescription(this)" class="submit-description" xmlns="http://www.w3.org/2000/svg" height="417pt" viewBox="0 -46 417.81333 417" width="417pt">
											<path d="m159.988281 318.582031c-3.988281 4.011719-9.429687 6.25-15.082031 6.25s-11.09375-2.238281-15.082031-6.25l-120.449219-120.46875c-12.5-12.5-12.5-32.769531 0-45.246093l15.082031-15.085938c12.503907-12.5 32.75-12.5 45.25 0l75.199219 75.203125 203.199219-203.203125c12.503906-12.5 32.769531-12.5 45.25 0l15.082031 15.085938c12.5 12.5 12.5 32.765624 0 45.246093zm0 0"/>
										</svg>
									</form>
									</div>
								</article>
							</div>
						</c:forEach>
					</section>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
		<script>
			function editDescription(elem) {
				elem.parentNode.style.display = "none";
				elem.parentNode.parentNode.children[1].style.display = "block";
				let textarea = elem.parentNode.parentNode.children[1].children[0].children[0];
				textarea.focus();
				textarea.value = elem.parentNode.children[1].innerText;
			}
			
			function submitDescription(elem) {
				elem.parentNode.submit();
			}

		</script>
	</body>
</html>