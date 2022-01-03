<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.content-title{
   font-size: 20px;
   font-weight: 600;
   color: #212140;
   text-decoration: underline;
}
.profile-photo {
	width: 280px;
	height: 280px;
	margin-left: 60px;
	margin-top: 50px;
	border-radius: 140px;
}

.menu {
	list-style: none;
	color: white;
	padding-left: 60px;
}
.menu p{
	color: gray;
	font-size: 13px;
	font-weight: 500;
	margin-top: 5px;
	line-height: 20px;
}
.menu a{
	color: gray;
	font-size: 13px;
	font-weight: 500;
	text-decoration: none;
}

.menu li {

	cursor: pointer;
	font-size: 14px;
	margin-top: 20px;
}
/* 모달 */
.modal #message-text{
	height: 300px;
}
</style>
</head>
<body>
<div class="inner">
		<div class="my-info-container">
			<img class="profile-photo" src="../photo/wonseop3.jpg" alt="profile-photo">
			<ul class="menu">
				<li class='my-info'><i class="fa fa-user-o"></i> ABOUT ME</li>
				<p>
					Name: 김원섭<br> Birth: 1993/12/07<br>
					<a href='https://blog.naver.com/wonseob7942' target="blank"><i class="fa fa-book"></i> blog</a><br>
					<a href='https://github.com/wonseopK' target="blank"><i class="fa fa-github"></i> github</a><br>
				</p>
				<li class='project'><i class="fa fa-laptop" ></i> PROJECT</li>
				<p>참여한 프로젝트를 확인할 수 있습니다.</p>
				<li class='contact'><i class="fa fa-envelope-o"></i> CONTACT</li>
				<p>궁금하신 점이있으면 언제든지 문의 주세요</p>
			</ul>
		</div>
	</div>
		<!-- 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title" id="exampleModalLabel">Contact to @wonseop</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="form-group">
		            <label for="recipient-name" class="col-form-label">이메일</label>
		            <input type="text" class="form-control" id="sender-email" placeholder="작성자님의 이메일 주소를 입력해주세요">
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="col-form-label">내용</label>
		            <textarea class="form-control" id="message-text" placeholder="내용을 입력해주세요"></textarea>
		            <span class="count-letter">0/3000</span>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary send-btn">메일 전송하기</button>
		      </div>
		    </div>
		  </div>
		</div>
	<script type="text/javascript">
		//about 페이지
		$(".my-info").click(function() {
			location.href="../resume/about-me"
		})
		
		//project 페이지
		$(".project").click(function() {
			location.href="../resume/project-list"
		})
		
		
		
		//CONTACT 기능
		let showCount = $(".count-letter")
		$(".contact").click(function() {
			$(".modal").modal()
		})
		$(".send-btn").click(function() {
			let senderEmail = $("#sender-email").val()
			let message = $("#message-text").val()
			if(isValidInfo(senderEmail, message) == false){
				console.log('사용자가 내용을 미입력')
				return;
			}
			let checkConfirm = confirm('메일을 보내시겠습니까?')
			if(checkConfirm == true){
				sendEmail(senderEmail,message)
			}
		})
		//이메일주소,내용 미입력검사
		function isValidInfo(email, message){
			if(email.trim() == ''){
				alert("이메일 주소를 입력해주세요")
				return false;
			}
			if(message.trim(message) == ''){
				alert("내용을 입력해주세요")
				return false;
			}
			return true;
		}		
		//이메일 글자수 검사
		$("#sender-email").keyup(function() {
			let email = $(this).val()
			if(email.trim().length > 100){
				alert('100자리 이하로 입력해주세요')
				$(this).val(email.substring(0, 100));
			}
		});
		//내용 글자수 검사
		$("#message-text").keyup(function() {
			let message = $(this).val()
			
			showCount.text(message.length+"/3000")
			if(message.length > 3000){
				alert('3000자리 이하로 입력해주세요')
				$(this).val(message.substring(0, 3000));
				showCount.text("3000/3000")
			}
		});
		function sendEmail(email, message){
			let address = 'wonseob7942@naver.com'
			$.ajax({
		  		url: "../send/send",
				method: "post",
		  		data: {message:message, title:email, address:address},
				success: function(){
					let senderEmail = $("#sender-email").val("");
					let message = $("#message-text").val("");
					alert("성공적으로 전송되었습니다.");
					$(".close").trigger('click');
				}	
			});
		}
		//모달창 닫기
		$(".close").click(function() {
			let senderEmail = $("#sender-email").val("")
			let message = $("#message-text").val("")
			showCount.text("0/3000")
		})
	</script>
</body>
</html>