<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
* {
	margin: 0;
	text-decoration: none;
	list-style: none;
}
.container {
	margin: 0;
	width: 100%;
	height: 100%;
	display: flex;
}
.contents {
	margin: 150px auto;
	width: 19%;
	height: 100%;
	text-align: center;
	display: inline;
	
}
.err_next_msg {
	color: tomato;
	display: none;
	height:10px;
	line-height:0px;
	font-size: 11px;
	font-weight: 600;
	margin: 0 97px;
	width: 174px;
}
input {
	width: 215px;
	height: 24px;
	border: none;
	outline: none;
}
.contents div {
	width: 400px;
	height: 50px;
	margin: 0 0;
	/*border: 1px solid black;*/
	margin-bottom: 4px;
}
.contents div > label {
	border: 1px solid #e7e7e7;
	overflow: hidden;
	letter-spacing: 1px;
	line-height:40px;
	display: block;
	font-size: 12px;
	width: 360px;
	height: 40px;
	font-weight: 500;
	border-radius: 4px;
}
.label_title {
	display: inline-block;
	width: 113px;
	font-size: 12px;
	letter-spacing: 0px;
	height: 30px;
	text-align: left;
	line-height: 35px;
	padding-left: 5px;
}
#btnCancel {
	background-color: rgb(240, 240,239);
	color: rgb(70,66,67);
	width: 6vw;
	height: 2vw;
	padding-right: 5px;
}
#btnSubmit {
	background-color: rgb(51, 98, 146);
	width: 6vw;
	height: 2vw;
	color: white;
}
.btn_area {
	display: inline-block;
	margin: 10px auto;
	width: 500px;
}
</style>
</head>
<body>
<section>
	<div class="container" style="width:100%;">
		<div class="contents">
			<form action="${path}/member/create" method="POST" name="frm_mem" id="frm_mem">
				<div class="id">
					<label>
						<span class="label_title">아이디</span>
						<input type="text" name="id" id="id">
					</label>
				</div>
				<span class="err_next_msg"></span>
				<div class="pw">
					<label>
						<span class="label_title">비밀번호</span>
						<input type="password" name="pw" id="pw">
					</label>
				</div>
				<span class="err_next_msg"></span>
				<div class="pwd">
					<label>
						<span class="label_title">비밀번호재확인</span>
						<input type="password" name="pwd" id="pwd">
					</label>
				</div>
				<span class="err_next_msg"></span>
				<div class="name">
					<label>
						<span class="label_title">이름</span>
						<input type="text" name="name" id="name">
					</label>
				</div>
				<span class="err_next_msg"></span>
				<div class="qustion">
					<label>
						<span class="label_title">하느님 이름은?</span>
						<input type="text" name="q1" id="q1">
					</label>
				</div>
				<span class="err_next_msg"></span>
				<div class="qustion">
					<label>
						<span class="label_title">예수가 왕이된때는?</span>
						<input type="text" name="q2" id="q2" maxlength="4">
						<span>년</span>
					</label>
				</div>
				<span class="err_next_msg"></span>
				<div class="btn_area">
					<input type="button" name="btnCancel" id="btnCancel" value="취소" class="btn">
					<input type="submit" name="btnSubmit" id="btnSubmit" value="가입" class="btn">
				</div>
			</form>
		</div>
	</div>
</section>
</body>
<script type="text/javascript" src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 1. input(#id)에 값을 입력 후 blur()하면 이벤트 발생
	$("#id").keyup(function(){
		// 2. input(#id) value값을 가져와 memId에 담음
		var memId = $.trim($('#id').val());
		// 3. joinValidate의 checkId() 함수를 실행, memId를 매개변수로 보냄
		// 7. checkId() 함수를 실행 후 결과값 success_id(code, desc)를 변수 checkResult에 담음
		var checkResult = joinValidate.checkId(memId);
		// 8-1(실패). code 값이 0이 아닌 경우 → 유효한 값 아님         
		if(checkResult.code != 0) {
			// 경고 메시지 출력
			$('.err_next_msg').eq(0).text(checkResult.desc)
							   .css('display', 'block');
			return false;
		// 8-2(성공). code 값이 0인 경우 → 유효한 값
		} else {
			// 중복여부 체크를 위한 Ajax 검증 시작
			// 9. ajaxCheck() 메서드 실행, memId를 매개변수로 보냄
			// 31. ajaxCheck(memId)의 return 값이 1이면 return true;
			if(ajaxCheck(memId) == true){
				return true;
			}
			return true;
		}
		// 32. ajaxCheck(memId)의 return 값이 -1이면 이곳에서 막히도록 하기 위해 return false;
		return false;
	});
	
	// pw
	// 1) null	
	// 2) 공백체크
	// 3) 정규식
	
	$('#pw').keyup(function(){
		var memPw = $.trim($('#pw').val());
		var memRpw = $.trim($('#pwd').val());
		var checkResult = joinValidate.checkPw(memPw, memRpw);
		
		if(checkResult.code != 0) {
			$('.err_next_msg').eq(1).text(checkResult.desc)
							   .css('display', 'block')
							   .css('color', 'tomato');
			return false;
		} else {
			$('.err_next_msg').eq(1).text(checkResult.desc)
							   .css('display', 'block')
							   .css('color', 'dodgerblue');
			if(memRpw != "" || memRpw.length != 0) {	
				if(memPw == memRpw) {
					$('.err_next_msg').eq(2).text("비밀번호가 일치합니다.")
					  				   .css('display', 'block')
					  				   .css('color', 'dodgerblue');
				} else {
					$('.err_next_msg').eq(2).text("입력하신 비밀번호가 일치하지 않습니다.")
					  				   .css('display', 'block')
					  				   .css('color', 'tomato');
					return false;
				}
			}
			return true;
		}
		return false;
	});
	
	// repw
	// 1) null
	// 2) 공백체크
	// 3) 정규식
	// 4) pw != repw

	$('#pwd').keyup(function(){
		var memPw = $.trim($('#pw').val());
		var memRpw = $.trim($('#pwd').val());
		var checkResult = joinValidate.checkRpw(memPw, memRpw);
		
		if(checkResult.code != 0) {
			$('.err_next_msg').eq(2).text(checkResult.desc)
							   .css('display', 'block')
							   .css('color', 'tomato');
			return false;
		} else {
			$('.err_next_msg').eq(2).text(checkResult.desc)
							   .css('display', 'block')
							   .css('color', 'dodgerblue');
			if(memPw != "" || memPw.length != 0) {	
				if(memPw == memRpw) {
					$('.err_next_msg').eq(2).text("비밀번호가 일치합니다.")
					  				   .css('display', 'block')  
					  				   .css('color', 'dodgerblue');
				} else {
					$('.err_next_msg').eq(2).text("입력하신 비밀번호가 일치하지 않습니다.")
					  				   .css('display', 'block') 
					  				   .css('color', 'tomato');
					return false;
				}
			}
			return true;
		}
		return false;
	});
	
	// name
	// 1) null
	// 2) 공백체크
	// 3) 정규식
	
	$('#name').keyup(function(){
		var name = $.trim($(this).val());
		var regKor = /[^가-힣]/;
		var regEmpty = /\s/g;
		
		if(name == "" || name.length == 0) {
			$('.err_next_msg').eq(3).text('필수 입력 정보입니다.')
			   				   .css('display', 'block')
			  				   .css('color', 'tomato');
			return false;
		} else if(name.match(regEmpty)) {
			$('.err_next_msg').eq(3).text('공백 없이 입력해주세요.')
			                   .css('display', 'block')
			                   .css('color', 'tomato');
	 		return false;
		} else if(regKor.test(name)) {
			$('.err_next_msg').eq(3).text('이름은 표준 한글만 입력 가능합니다.')
							   .css('display', 'block')
							   .css('color', 'tomato');
			return false;
		} else if(name.length < 2 || name.length > 4) { 
			$('.err_next_msg').eq(3).text('이름은 2자 이상 4자 이하여만 합니다.')
							   .css('display', 'block')
							   .css('color', 'tomato');
			return false;  
		} else {
			$('.err_next_msg').eq(3).text('멋진 이름이네요!')
							   .css('display', 'block')
							   .css('color', 'dodgerblue');
		}
	});
	
	
	$('#q1').keyup(function(){
		var q1 = $.trim($(this).val());
		var regEmpty = /\s/g;
		var q1a = '여호와';
		
		if(q1 == "" || q1.length == 0) {
			$('.err_next_msg').eq(4).text('필수 입력 정보입니다.')
			   				   .css('display', 'block')
			  				   .css('color', 'tomato');
			return false;
		} else if(q1.match(regEmpty)) {
			$('.err_next_msg').eq(4).text('공백 없이 입력해주세요.')
			                   .css('display', 'block')
			                   .css('color', 'tomato');
	 		return false;
		} else if (q1 == q1a) {
			$('.err_next_msg').eq(4).text('혹시 천재가 아니신가요?아주 잘했어요!')
							   .css('display', 'block')
							   .css('color', 'dodgerblue');
			return true;
		}
	});
	
	$('#q2').keyup(function(){
		var q2 = $.trim($(this).val());
		var regEmpty = /\s/g;
		var q2a = '1914';
		
		if(q2 == "" || q2.length == 0) {
			$('.err_next_msg').eq(5).text('필수 입력 정보입니다.')
			   				   .css('display', 'block')
			  				   .css('color', 'tomato');
			return false;
		} else if(q2.match(regEmpty)) {
			$('.err_next_msg').eq(5).text('공백 없이 입력해주세요.')
			                   .css('display', 'block')
			                   .css('color', 'tomato');
	 		return false;
		}	else if (q2 != q2a) {
			$('.err_next_msg').eq(5).text('틀렸어.')
			   .css('display', 'block')
			   .css('color', 'tomato');
		}
		else if (q2 == q2a) {
			$('.err_next_msg').eq(5).text('혹시 천재가 아니신가요?아주 잘했어요!')
							   .css('display', 'block')
							   .css('color', 'dodgerblue');
			return true;
		}
	});
	
});
	
</script>
</html>