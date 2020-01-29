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
							</div>
						</c:forEach>
					</section>
		</main>
		<jsp:include page="footer.jsp"></jsp:include>
		<jsp:include page="bottomScript.jsp"></jsp:include>
	</body>
</html>