<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="include/common.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale-1.0,user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/common.css">
</head>
<body><div id="modal">
		<div id="modal_login">
			<header class="img">
				<a href="#" id="title_img">
					<img src="${path}/resources/img/jworg-logo.png" alt="jw로고">
				</a>
			</header>
			
		<section style="margin-top:15px;">
			<div class="div_input" id="naver_id">
				<span>
					<input type="text" placeholder="아이디" class="input_login" id="inputid" >
				</span>
			</div>

			<span class="err_msg">아이디를 입력해주세요.</span>

			<div class="div_input" id="naver_pw">
				<span>
					<input type="password" placeholder="비밀번호" class="input_login" id="inputpw" name="">
				</span>
			</div>
			
			<span class="err_msg">비밀번호를 입력해주세요.</span>
				
				<a href="#" id="btn_login">로그인</a>
				
				
						
			<div id="member">
				<span id="members">&nbsp;
					<a href="#">아이디 찾기</a>&nbsp;<span class="si">|</span>&nbsp;
				    <a href="#">비밀번호 찾기</a>&nbsp;<span class="si">|</span>&nbsp;
					<a href="${path}/member/create">회원가입</a>
				</span>
			</div>

		</section>
		<button id="modal_close"><i class="fas fa-times"></i></button>
			</div>
		</div>
		
		
		
		
		
		
	<nav class="top_nav">
		<section class="top_nav_items">
			<label class="top_nav_items_label">
				<c:if test="${!empty sessionScope.at}">
					<div class="top_nav_hamburger" id="hamburger_btn">
						<img alt="햄버거 버튼" src="${path}/resources/img/icon_menu.svg">
					</div>
				</c:if>
				<div class="top_nav_logo">
					<a href="${path}/">
						<img alt="로고" class="top_nav_logo_img" src="${path}/resources/img/jworg-logo.png" width="65px;">
					</a>
				</div>
			</label>
		</section>

		<section class="top_nav_second_container">
			<c:choose>
				<c:when test="${empty sessionScope.name}">
					<div class="top_nav_second">
						<a href="#" class="top_nav_link" id="modal_open">로그인</a>
						<a href="${path}/member/create" class="top_nav_link">회원가입</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="top_nav_second">
						<a href="#" class="top_nav_link" id="logout">로그아웃</a>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</nav>
	<div class="layout_contents">
		<nav class="side_nav">
			<div class="side_nav_arrow"></div>
			<ul class="margin0">
				<li class="grid">
					<a href="#">홈</a>
				</li>
			</ul>
			<section class="side_nav_section">
				<header class="side_nav_header_container">
					<h1 class="side_nav_header">
						<a href="#" class="side_header_nav_link" id="eup_id">
							읍내구역
						</a>
					</h1>
				</header>
				<ul class="side_nav_items" >
					<li class="side_nav_item">
						<a href="admin/eup" class="side_header_nav_link" style="padding-left: 22px;">읍내</a>
					</li>
					<li class="side_nav_item">
						<a href="#" class="side_header_nav_link" style="padding-left: 22px;">읍내주변</a>
					</li>
					<li class="side_nav_item">
						<a href="#" class="side_header_nav_link" style="padding-left: 22px;">아파트</a>
					</li>
				</ul>
			</section>
			<section class="side_nav_section">
				<header class="side_nav_header_container">
					<h1 class="side_nav_header">
						<a href="#" class="side_header_nav_link">
							풍산
						</a>
					</h1>
				</header>
			</section>
			<section class="side_nav_section">
				<header class="side_nav_header_container">
					<h1 class="side_nav_header">
						<a href="#" class="side_header_nav_link">
							금과
						</a>
					</h1>
				</header>
			</section>
			<section class="side_nav_section">
				<header class="side_nav_header_container">
					<h1 class="side_nav_header">
						<a href="#" class="side_header_nav_link">
							유등
						</a>
					</h1>
				</header>
			</section>
			<section class="side_nav_section">
				<header class="side_nav_header_container">
					<h1 class="side_nav_header">
						<a href="#" class="side_header_nav_link">
							인계
						</a>
					</h1>
				</header>
			</section>
			<section class="side_nav_section">
				<header class="side_nav_header_container">
					<h1 class="side_nav_header">
						<a href="#" class="side_header_nav_link">
							팔덕
						</a>
					</h1>
				</header>
			</section>
			<section class="side_nav_section">
				<header class="side_nav_header_container">
					<h1 class="side_nav_header">
						<a href="#" class="side_header_nav_link">
							구림
						</a>
					</h1>
				</header>
			</section>
			<section class="side_nav_section">
				<header class="side_nav_header_container">
					<h1 class="side_nav_header">
						<a href="#" class="side_header_nav_link">
							동계
						</a>
					</h1>
				</header>
			</section>
		</nav>
		<main class="layout_main">
			<c:if test="${!empty sessionScope.name}">
				<div class="writer_area">
					<span style="color: #615d5c;">반갑습니다</span>
					<span style="color:rgb(81,108,164)">${sessionScope.name}님</span>
				</div>
			</c:if>
			
			<div class="large_container">
				<c:choose>
					<c:when test="${!empty sessionScope.name}">
						<table>
							<tbody>
								<tr>
									<th>
										봉사구역
									</th>
								</tr>
								<c:forEach var="lDto" items="${title}">
								<tr>
									<td>
										<a href="${path}/location/view/${lDto.lno}?title=${lDto.title}">${lDto.title}</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<h4 style="width: 70%; display: block; text-align: center;">로그인하시면 보실 수 있습니다 </h4>
					</c:otherwise>
				</c:choose>
				
			</div> 
		</main>
<script type="text/javascript">

$(document).ready(function(){
	$('#modal_open').click(function(){
		$('#modal').css("display", "flex");
		$('#inputid').focus();
	});
	$('#modal_close').click(function(){
		$('#modal').css('display', 'none');
		$('.input_login').val("");
		$('.err_msg').css('display', 'none');
	});
	$("#btn_login").click(function(){
		
		var id = $.trim($('#inputid').val());
		var pw = $.trim($('#inputpw').val());
		
		var regEmpty = /\s/g;
		
		// 1. null 체크
		// 2. 공백 체크
		
		if(id == null || id.length == 0) {
			$('.err_msg').eq(0).text('필수 정보입니다.')
						 .css('display', 'block');
			return false;
		} else if(id.match(regEmpty)) {
			$('.err_msg').eq(0).text('공백 없이 입력해주세요.')
			 			 .css('display', 'block');
			return false;
		}
		
		if(pw == null || pw.length == 0) {
			$('.err_msg').eq(1).text('필수 정보입니다.')
						 .css('display', 'block');
			return false;
		} else if(pw.match(regEmpty)) {
			$('.err_msg').eq(1).text('공백 없이 입력해주세요.')
			 			 .css('display', 'block');
			return false;
		}
		
		$.ajax({
			url: "${path}/member/login",
			type: "POST",
			dataType: "text",
			data: "id="+id+"&pw="+pw,
			success: function(data) {
				if(data == "1") {
					location.reload();
				} else if(data == "-1") {
					$('#inputid').select();
					$('.err_msg').text('회원 아이디 또는 비밀번호가 일치하지 않습니다.')
					              .css('display', 'block');
				}
			},
			error:function() {
				alert("System Error♨");
			}
		});
	});
	$('#logout').click(function(){
		$.ajax({
			url:"${path}/member/logout",
			type: "POST",
			success: function(data) {
				location.reload();
			},
			error:function() {
				alert("System Error");
			}
		});
	});
	
	var state = false
	$('#hamburger_btn').click(function(){
		if (!state) {
			$('.side_nav').addClass("open");
			$('.layout_main').addClass("open");
			state = true;
		} else {
			$('.side_nav').removeClass("open");
			$('.layout_main').removeClass("open");
			state = false;
		}
	});
	
	$('.layout_main').click(function(){
		if (state) {
			$('.side_nav').removeClass("open");
			$('.layout_main').removeClass("open");
			state = false;
		}
	});
	
	
	function location_list() {
		alert("test"); 
		var result =  
		$("#list").html(result);
	}
	
	var state2 = false;
	$('#eup_id').click(function(){
		if (!state2) {
			$('.side_nav_items').addClass("open");
			state2 = true;
		} else {
			$('.side_nav_items').removeClass("open");
			state2 = false;
		}
	});
	

});
</script>
</body>
</html>