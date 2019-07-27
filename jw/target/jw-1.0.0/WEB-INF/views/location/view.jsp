<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %>
    <%@ include file="../include/header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<link rel="stylesheet" href="${path}/resources/lightbox/css/lightbox.css">
<script type="text/javascript" src="${path}/resources/lightbox/js/lightbox.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding:0;
	text-decoration: none;
  }
  .container {
  	width: 100%;
  	height: auto;
  	display: inline-block;
  }
  .contents {
  	margin: 10px auto;
  	display: block;
  	height: 100%;
  	width: 300px;
  }
  .container table {
  	box-sizing:border-box;
  	width: 300px;
  	height: auto;
  	border-collapse: collapse;
  }
  .view_table tbody tr th, td {
  	border: 1px solid black;
  	height: 38px;
  	font-size: 16px;
  	vertical-align: middle;
  }
  .btn {
  	width: 300px;
  	margin: 15px auto;
  	text-align: center;
  }
  .cancel_btn {
  	display: inline-block;
  	text-align: center;
  	line-height: 30px;
  	width: 130px;
  	height: 30px;
  	background-color: rgb(240, 240,239);
  	padding-right: 5px;
  	color: rgb(70,66,67);
  }
  .submit_btn {
  	display: inline-block;
  	text-align: center;
  	line-height: 30px;
  	width: 130px;
  	height: 30px;
  	background-color: rgb(51, 98, 146);
  	color: white;
  }
   tr > td label {
    text-align:center;
    align-items:center;
  	margin-left: 10px;
  	width: 15px;
  	padding: 0;
  	height: 15px;
  	box-sizing:border-box;
  	line-height: 20px;
  	vertical-align: middle;
   }
	tr > td label span {
		display: inline-block;
		width: 40px;
		height: 15px;
		font-size: 12px;
	} 
	input[type="checkbox"] {
	 -webkit-appearance:none;/* Hides the default checkbox style */ 
	 height:2em;
	 vertical-align:middle;
	 width:2em;
	 cursor:pointer;
	 position:relative;
	 -webkit-transition: .15s;
	 border-radius:2em;
	 background-color:#900;
	}
	
	input[type="checkbox"]:checked {
	 background-color:green;
	}
	
	input[type="checkbox"]:before, input[type="checkbox"]:checked:before {
	 position:absolute;
	 top:0;
	 left:0;
	 width:100%;
	 height:100%;
	 line-height:2em;
	 text-align:center;
	 color:#fff;
	 content: '✘';
	}
	
	input[type="checkbox"]:checked:before {
	 content: '✔';
	}
	
	input[type="checkbox"]:hover:before {
	 background:rgba(255,255,255,0.3);
	}
	
</style>
</head>
<body>
	<div class="container">
		<div class="contents">
				<table class="view_table">
					<tbody>
							<tr>
								<th colspan="2">${one.title}</th>
							</tr>
							<form action="${path}/location/update" method="POST" name="frm_lo" id="frm_lo">
								<c:forEach var="lDto" items="${one.list}">
									<tr>
										<td>
											<label class="label_lo" >
												<input type="checkbox" id="input_checkbox1" value="checked"
													name="first_visit" class="ckboxs1" 
													<c:if test="${lDto.first_visit == 'checked'}">
														checked="checked"
													</c:if>>
												<span>${lDto.location}</span>
												<input type="hidden" value="${lDto.rno}" name="rno" >
												<input type="hidden" value="${lDto.lno}" name="lno" >
											</label>
										</td>
										 <td>
											<label class="label_lo" >
												<input type="checkbox" id="input_checkbox2" value="checked"
													name="second_visit" class="ckboxs2"
													<c:if test="${lDto.second_visit == 'checked'}">
														checked="checked"
													</c:if>>
													
												<input type="checkbox" id="input_checkbox3" value="checked"
												name="second_unvisit" class="ckboxs3"  style="display: none;">
												<span>${lDto.location}</span> 
											</label>
										</td> 
									</tr>
								</c:forEach>
							</form>
					</tbody>
				</table>
			
			<div class="btn">
				<a href="#" class="cancel_btn">취소</a>
				<a href="#" class="submit_btn">제출</a>
			</div>
		</div>		
	</div>
</body>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.submit_btn').click(function(){
			
		   var first_visit = [];
		    var second_visit = [];
		    var lno = [];
		    var rno = [];
		    
		    $("input[name='first_visit']").each(function(i) {
		        first_visit.push($(this).val());
		    });
		    $("input[name='second_visit']").each(function(i) {
		        second_visit.push($(this).val());
		    });
		    $("input[name='lno']").each(function(i) {
		        lno.push($(this).val());
		    });
		    $("input[name='rno']").each(function(i) {
		        rno.push($(this).val());
		    });
		     
		    var allData = { "first_visit": first_visit, "second_visit": second_visit, "lno": lno, "rno": rno };
		    alert(allData.first_visit);
 
		    $.ajax({
		        url:"${path}/location/update",
		        type:'POST',
		        contentType: 'application/json',
		       	dateType: 'text',
		        data: JSON.stringify(allData),
		        success:function(data){
		        	location.href="${path}/"
		        },
		        error:function(){
		        	alert("에러")
		        }
		    }); 
		});
	});
</script>
</html>