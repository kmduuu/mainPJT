<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>야구ROUTE</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<!-- <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/> -->
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />


<!-- socket.io CDN -->
<script src="https://cdn.socket.io/3.1.3/socket.io.min.js"></script>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>

<!-- Video.js CDN, CSS CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.11.4/video.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.11.4/video-js.min.css" rel="stylesheet">


<style>
/* body{
	background-image:
		url('../images/baseball/empty_ground.png');
} */

video{
	border-radius: 10px;
}

.blind{
	position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 10px;
    margin: -1px;
    overflow: hidden;
}
#space {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100%;
  width: 90%
}

.match-lineup {
  width: 80%; 
  margin: 0 auto; 
}

.match {
	background-color: #ffffff;
	color: #dddddd;
	font-family: Open Sans, sans-serif;
}

.chat-container {
	display: "flex";
	align-items: flex-start;
	margin: auto;
	height: 100%;
	width: 100%;
	position: relative;
	background-color: #fff;
	border-radius: 20px;
}

.background{
	display: "flex";
	align-items: flex-start;
	margin: auto;
	height: 100%;
	width: 100%;
	position: relative;
	background-color: #fff;
	border-radius: 20px;
}

#message-input {
	width: 460px;
	height: 30px;
	margin-bottom: 20px;
	padding : 10px;
	background-color: #f2f2f2;
}

.button-container {
	background-color: #fff;
	margin: 50px auto;
	width: 100%;
	border-radius: 10px;
}

.chat-messages {
	background-color: #f2f2f2;
	padding: 10px;
	border-radius: 20px;
	height: 430px;
	width : 100%;
	overflow-y: auto;
	margin-bottom: 20px;
	margin-top: 20px;
}

.chat-message {
	display: flex;
	align-items: flex-start;
	margin-top: 15px;
	margin-bottom: 15px;
	width: 100%;
}

.message-bubble {
	background-color: #fff;
	border-radius: 10px;
	padding: 10px;
	margin-right: 10px;
	margin-left: 5px;
	font-size: 5px;
}

.content {
	color: #666;
}

.chat-message .sender {
	font-weight: bold;
	color: #333;
}

.chat-message .content {
	margin-top: 5px;
	color: #666;
}

.fireworkAway {
	position: absolute;
	width: 30px;
	height: 30px;
	background-image:
		url('https://kr.object.ncloudstorage.com/mainpjt/Imogi/like.png');
	background-size: cover;
}

.fireworkHome {
	position: absolute;
	width: 30px;
	height: 30px;
	background-image:
		url('https://kr.object.ncloudstorage.com/mainpjt/Imogi/like.png');
	background-size: cover;
}

.drop-area {
	display: none;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 999;
}

.drop-area.active {
	display: block;
	color : white;
	border-radius: 10px;
	text-align: center;
	font-family:"Gwangyang";
}

.table-container {
	background-color : #f2f2f2;
	display: flex;
	border-radius: 10px;
	
}

.table-wrapper {
  margin-left: 10px; /* 테이블 사이의 간격 조정 */
  margin-right: 10px; /* 테이블 사이의 간격 조정 */
  padding : 10px;
}

.table-container table {
	flex: 1;
}

/*score table*/
table {
    border-collapse: separate;
    text-indent: initial;
    border-spacing: 3px;
}

.team-name {
  width: 100px; /* 너비 조정 */
}

/*스트리밍*/
.broadCast, #streaming {
	width: 100%;
	height: 550px;
}

.userImg img {
	display: inline-block;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background-color: gray;
}

.content img {
	display: inline-block;
	width: 200px;
	height: 200px;
	background-color: gray;
}

.teamTopBar {
	width: auto;
	height: auto;
}

.image-container {
	overflow: hidden;
	position: relative;
	display: flex;
	width: auto;
	heigth: auto;
}

.text-overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 18px;
	margin-left: 300px;
	/* 기타 스타일 속성 설정 */
}

.home{
	background-color: ${channel.gameInfo.homeTeam.teamColor};
	border-radius: 10px;
	padding: 10px;
  	display: inline-block;
  	cursor: pointer;
  	transition: transform 0.3s;
  	width : 100%;
  	margin-bottom: 20px;
}

.homeCount{
	color: #fff; 
}

.home:active{
	transform: scale(0.95);
}

button {
  background-color: transparent;
  border: none;
  color: white;
  font-size: 16px;
}

.away{
	background-color: ${channel.gameInfo.awayTeam.teamColor};
	border-radius: 10px;
	padding: 10px;
  	display: inline-block;
  	cursor: pointer;
  	transition: transform 0.3s;
  	width : 100%;
  	color: #fff;
}

.away:active{
	transform: scale(0.95);
}

.radius{
	border-radius: 10px !important;
}

.time{
	/* opacity: 70%; */
	background-image:
		url('https://ssl.pstatic.net/static/sports/common/livecenter/new/bg_live_baseball.jpg');
	width : 100%;
	height : 600px;
}

.alarm-text{
	font-family:"Gwangyang";
	text-align: center;
	color: white;
	padding : 50px;
	margin-top : 40px;
	font-size: 30px;
}

.time-text{
	font-family:"Gwangyang";
	text-align: center;
	color: white;
	padding : 50px;
	margin-top : 40px;
	font-size: 50px;
	background-color : black;
	border-radius: 10px;
	display: flex;
	justify-content : center;
}

.align{
	display: flex;
	justify-content : center;
}
</style>


<script type="text/javascript">

function getTime(){
	var startTime = "${channel.gameInfo.gameTime}";
	var currentDate = new Date();
	var targetTime = new Date();	
	targetTime.setHours(Number(startTime.split(':')[0]));
	targetTime.setMinutes(Number(startTime.split(':')[1]));
	targetTime.setSeconds(Number(00));
	var timeDiff = targetTime - currentDate;
	console.log(timeDiff);
	if (timeDiff > 0) {
		var seconds = Math.floor(timeDiff / 1000); //남은 시간 초로 계산
		var min = Math.floor(seconds / 60);//분으로 변환
		var hour = Math.floor(min / 60);//시간으로 변환
		
		$(".hour").text(hour+"시");
		$(".min").text(min%60+"분");
		$(".sec").text(seconds%60+"초");
		return true;
	} else {
		return false;
	}
	
}

	$(function(){
		var socket = io.connect('http://223.130.133.54:3000' , {
			withCredentials: true,
			 extraHeaders: {
				'Access-Control-Allow-Origin': 'http://223.130.133.54:3000' 
			 },
			 path: '/socket.io',
			 query: {
				 gameCode: '${channel.gameInfo.gameCode}',
				 userID: '${sessionScope.user.userId}'
			 }
		});
		
		$(window).on("load", function(){
			socket.emit('join');
			socket.emit('getMessageData');
			console.log("${gameRecord}");		
			$.ajax({
				url:"/channel/rest/status?channelID=${channel.channelID}",
				method:"GET",
				dataType : "json",
				success : function(jsonData, status){
					if(status=="success"){
						var channel = jsonData.channelState;
						if(channel=='PUBLISHING'){
							console.log("channel 송출 중");
							var player = videojs('streaming', {
								sources : [
									{src:"${channel.channelCDN}", type:"application/x-mpegURL"}
								],
								poster: '${channel.gameInfo.homeTeam.teamEmblem}',
								controls: true,
								platsinline : true,
				 				muted : true,
				 				preload : "auto",
				 				height: "700px"
							});
						} else {
							console.log("방송 시작 전");
							$("#streaming").remove();
							var time = $('<div class="time radius"></div>');
							var timemessage = $('<div class="alarm-text">경기가 곧 시작됩니다.</div>');
							var blind = $('<span class="blind">남은 시간</span>');
							var timeBox = $('<div>').append(
									  $('<div>').addClass('row align').append(
									    $('<div>').addClass('col-xs-3').append($('<div>').addClass('hour time-text').text('00'))
									  )
									  .append(
									    $('<div>').addClass('col-xs-3').append($('<div>').addClass('min time-text').text('00'))
									  )
									  .append(
									    $('<div>').addClass('col-xs-3').append($('<div>').addClass('sec time-text').text('00'))
									  )
									);
							time.append(blind, timemessage, timeBox);
							$("#title1").append(time);
							getTime();
							if(getTime() === true){
								setInterval(getTime, 1000);	
							} else {
								var video = $("<video id='streaming' class='video-js vjs-big-play-button vjs-big-play-centered'></video>")
								video.attr("poster", "https://ssl.pstatic.net/static/sports/common/livecenter/new/bg_live_baseball.jpg").attr("height", "700px");
							}							
						}								
					}		
				}
			});

		});
		
		$(document).ready(function(){
			//homeClick
			$("#homeClick").on('click', function(e){
				socket.emit('homeClick', 1);
				
				var fireworkHome = $('<div class="fireworkHome"></div>');
				
				fireworkHome.css({
			    	top: e.pageY - 10, // 마우스 클릭 시 커서 위치로 설정
			        left: e.pageX - 10
			    });
				
				$('body').append(fireworkHome);
				
				fireworkHome.animate({
					top: "-=100px",
		            opacity: 0
				}, 1000, function(){
					$(this).remove();
				});
			});
			
			//awayClick
			$("#awayClick").on('click', function(e){
				socket.emit('awayClick', 1);
				
				var fireworkAway = $('<div class="fireworkAway"></div>');
				
				fireworkAway.css({
			    	top: e.pageY - 10, // 마우스 클릭 시 커서 위치로 설정
			        left: e.pageX - 10
			    });
				
				$('body').append(fireworkAway);
				
				fireworkAway.animate({
					top: "-=100px",
		            opacity: 0
				}, 1000, function(){
					$(this).remove();
				});
			});
			
			//이미지 드래그&다운
			var dropZone = $('#drop-area');
			dropZone.hide();
			
			$(document).on('dragenter', function(event) {
				dropZone.addClass('active');
				dropZone.show();
			});
			
			dropZone.on('dragover', function(event) {
				event.preventDefault();
			});
			
			dropZone.on('drop', function(event){
				event.preventDefault();
		 		handleFileSelect(event.originalEvent);
		 		dropZone.hide();
		 	});
		 	
			$(document).on('dragleave', function(event) {
				if (event.originalEvent.pageX <= 0 || event.originalEvent.pageY <= 0) {
					event.preventDefault();
					dropZone.removeClass('active');
					dropZone.hide();
				}
			});
			 
			function handleFileSelect(event) {
				    event.stopPropagation();
				    event.preventDefault();
				    dropZone.removeClass('active');
				    
				    var files = event.target.files || event.dataTransfer.files;;
				    // 파일 업로드 처리 로직을 여기에 구현하세요.
				    if (files.length > 0) {
				    	var formData = new FormData();
				        formData.append('image', files[0]);
				        $.ajax({
				            url: "http://223.130.133.54:3000/image/upload",
				            type: "POST",
				            processData: false,
				            contentType: false,
				            data: formData,
				            dataType: "json",
				            success: function(data, status) {
				              console.log(data);
				              socket.emit("image", data.image_path);
				            }
				          });
				    	
				    }
			}
		});
		
		
		
		//click 받기
		socket.on('homeCount', (data) => {
			$('#homeCount').text(data);
		});
		
		socket.on('awayCount', (data) => {
			$('#awayCount').text(data);
		})
		
		
		//채팅 송수신
		$('#chat-form').submit(function(e) {
		    e.preventDefault();
		    var message = $('#message-input').val().trim();
		    if (message) {
		      socket.emit('sendMessage', message);
		      $('#message-input').val('');
		    }
		  });
		
		socket.on("responseMessage", (data) => {
			var chatMessage = $('<div class="chat-message"></div>');
			var messageBubble = $('<div class="message-bubble"></div>');
			var userProfileImg = $('<img></img>').attr("src", data.userImage).attr("alt", "이미지 없음");
			
			var userImage = $('<span class="userImg"></span>').append(userProfileImg);
			var sender = $('<span class="sender"></span>').text(data.nickName + " : ");
			var content = $('<span class="content"></span>').text(data.data);
			messageBubble.append(userImage, sender, content);
			chatMessage.append(messageBubble);
			$('#chat-messages').append(chatMessage);
			$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
		});
		
		socket.on("getChattingData", (data) => {
			console.log(data);
			
			for(i in data){
				if(data[i].user_id != null){
					if(data[i].message == null){
						var chatMessage = $('<div class="chat-message"></div>'); // 채팅 메시지를 감싸는 요소 생성
						var messageBubble = $('<div class="message-bubble"></div>');
						var userProfileImg = $('<img></img>').attr("src", data[i].userImage).attr("alt", "이미지 없음");
						
						var userImage = $('<span class="userImg"></span>').append(userProfileImg);
						var sender = $('<span class="sender"></span>').text(data[i].user_id + " : ");
						var content = $('<span class="content "></span>').append($('<img></img>').attr("src", data[i].chat_image));

						messageBubble.append(userImage, sender, content);
						chatMessage.append(messageBubble);
						$('#chat-messages').append(chatMessage); // 채팅 메시지 요소를 채팅 영역에 추가
					} else {
						var chatMessage = $('<div class="chat-message"></div>');
						
						var messageBubble = $('<div class="message-bubble"></div>');
						var userProfileImg = $('<img></img>').attr("src", data[i].userImage).attr("alt", "이미지 없음");
						
						var userImage = $('<span class="userImg"></span>').append(userProfileImg);
						var sender = $('<span class="sender"></span>').text(data[i].user_id + " : ");
						var content = $('<span class="content"></span>').text(data[i].message);
						messageBubble.append(userImage, sender, content);
						chatMessage.append(messageBubble);
						$('#chat-messages').append(chatMessage);
					}
					
					$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
				} else{
					console.log("채팅 내역이 없습니다.");
				}
			}
		});
		
		//이미지 파일 받기
		socket.on("responseImage", (data)=>{
			console.log(data);
			var chatMessage = $('<div class="chat-message"></div>');
			var messageBubble = $('<div class="message-bubble"></div>');
			var userProfileImg = $('<img></img>').attr("src", data.userImage).attr("alt", "이미지 없음");
			
			var userImage = $('<span class="userImg"></span>').append(userProfileImg);
			var sender = $('<span class="sender"></span>').text(data.userID + " : ");
			var content = $('<span class="content"></span>').append($('<img></img>').attr("src", data.Image));
			
			messageBubble.append(userImage, sender, content);
			chatMessage.append(messageBubble);
			$('#chat-messages').append(chatMessage);
			$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
		});
	});
</script>
</head>

<body>
<!-- topBar start -->
<jsp:include page="/common/topBar.jsp"/>
<!-- topBar End -->


<div class="image-container">
  <div class="row">
  	<div class=" col-md-6">
		<img class="teamTopBar" src="${channel.gameInfo.homeTeam.teamTopBar}">
	</div>
	<div class=" col-md-6">
		<img class="teamTopBar col-md-6" src="${channel.gameInfo.awayTeam.teamTopBar}">
	</div>
  </div>
</div>

<%-- <div class="match-live-date">
	<div class="container" id="space">
		<div class="row">
			<div class="col-md-6"><div class="date">${channel.gameInfo.gameDate}</div></div>
		</div>
	</div>
</div> --%>

<div id=countdown></div>

<div class="match" style="margin-top: 50px;">
	<div class="container" id="space">
		<div class="row">
			<div class="col-md-12">
				<div class="match-live-info">
					<div class="text-center"> ${channel.gameInfo.homeTeam.teamNickName} – ${channel.gameInfo.awayTeam.teamNickName} </div>
					<div class="match-info">
						<div class="team wpb_animate_when_almost_visible wpb_flipInX flipInX wpb_start_animation animated">
							<div class="avatar">
								<img src="${channel.gameInfo.homeTeam.teamEmblem}" alt="team-logo">
							</div>
							<div class="text">
								<h4>${channel.gameInfo.homeTeam.teamNickName}</h4>
							</div>
						</div>						
						
						<div class="score" id="score">
	            				${channel.gameInfo.gameScore}    
	            		</div>    		
            			<div class="team right  wpb_animate_when_almost_visible wpb_flipInX flipInX wpb_start_animation animated">
            				<div class="text">
            					<h4>${channel.gameInfo.awayTeam.teamNickName}</h4>
            				</div>
            				<div class="avatar">
            					<img src="${channel.gameInfo.awayTeam.teamEmblem}" alt="team-logo">
            				</div>
            			</div>
            			
					</div>
					<div class="text-center">${channel.gameInfo.gameDate}</div>
				</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<!--BROADCASTS BEGIN 스트리밍 구역-->

<div class="container" id="space">
	<div class="row">
		<div class="col-md-8">
			<h3>broadcasts</h3>	
			<div class="mathc-live-broadcasts">
				<div class="background">
					<div class="tab-content">
						<div class="tab-pane fade in active" role="tabpanel" id="title1">
							<video id="streaming" class="video-js vjs-big-play-button vjs-big-play-centered">
							</video>
						</div>
						
						<div class="table-container">
							<div class="table-wrapper">
								<table id="gameScore">
								<caption class="blind">스코어 보드 종합</caption>
								<thead>
									<tr>
										<th scope="col" class="team-name radius">팀 명</th>						
										<th scope="col" class="team-name radius">1</th>
										<th scope="col" class="team-name radius">2</th>
										<th scope="col" class="team-name radius">3</th>
										<th scope="col" class="team-name radius">4</th>
										<th scope="col" class="team-name radius">5</th>
										<th scope="col" class="team-name radius">6</th>
										<th scope="col" class="team-name radius">7</th>
										<th scope="col" class="team-name radius">8</th>
										<th scope="col" class="team-name radius">9</th>
									</tr>
								</thead>
									
								<tbody>
									<tr>
										<td class="radius">${channel.gameInfo.awayTeam.teamNickName}</td>
										<c:set var="i" value="0"/>
										<c:forEach var="awayScoreList" items="${gameRecord.awayScoreList}">
											<td>${gameRecord.awayScoreList[i]}</td>
											<c:set var="i" value="${i+1}"/>
										</c:forEach>
									</tr>
									
									<tr>
										<td class="radius">${channel.gameInfo.homeTeam.teamNickName}</td>
										<c:set var="i" value="0"/>
										<c:forEach var="homeScoreList" items="${gameRecord.homeScoreList}">
											<td>${gameRecord.homeScoreList[i]}</td>
											<c:set var="i" value="${i+1}"/>
										</c:forEach>
									</tr>
								</tbody>
							</table>
							</div>
							
							<div class="table-wrapper">
									<table id="totalScore">
									<thead>
										<tr>
											<th scope="col" class="team-name blind">blind</th>
											<th scope="col" class="team-name radius">R</th>						
											<th scope="col" class="team-name radius">H</th>
											<th scope="col" class="team-name radius">E</th>
											<th scope="col" class="team-name radius">B</th>
										</tr>
									</thead>
									
									<tbody>
									
										<tr>
											<td class="blind">blind</td>
											<c:set var="i" value="0"/>
											<c:forEach var="awayRecord" items="${gameRecord.awayRecord}">
												<td>${gameRecord.awayRecord[i]}</td>
												<c:set var="i" value="${i+1}"/>
											</c:forEach>
										</tr>
										
										<tr>
											<td class="blind">blind</td>
											<c:set var="i" value="0"/>
											<c:forEach var="homeRecord" items="${gameRecord.homeRecord}">
												<td>${gameRecord.homeRecord[i]}</td>
												<c:set var="i" value="${i+1}"/>
											</c:forEach>
										</tr>									
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 채팅 구역 -->
		<div class="col-md-4">
		<br/><br/>
			<div class="container button-container" id="space">					
				<div class="cheer">
					<span class="text-center">
						<h3>당신의 팀을 응원하세요</h3>
					</span>
								
					<div class="row">
						<div class="col-md-6 text-left">
							<div class="home">
								<div id="homeClick">
									<img src="${channel.gameInfo.homeTeam.teamEmblem}" alt width="50" height="50"/>
									<div id="homeCount" class="homeCount">${channel.homeClick}</div>
								</div>
							</div>
						</div>

						<div class="col-md-6 text-right">
							<div class="away">
								<div id="awayClick">
									<img src="${channel.gameInfo.awayTeam.teamEmblem}" alt width="50" height="50"/>
									<div id="awayCount" class="homeCount">${channel.awayClick}</div>
								</div>
							</div>						
						</div>						
					</div>
				</div>	
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="container chat-container" id="space">
						
						<div class="chat-messages" id="chat-messages">
							<!-- 채팅 메시지를 표시할 영역 -->
							<div class="drop-area" id="drop-area">여기에 드랍하세요</div>
						</div>
						
					    <form id="chat-form">
					     	<div class="input-group">
					        	<input type="text" id="message-input" class="radius" placeholder="메시지를 입력하세요" width="200px"/>
					    	</div>
				    	</form>
				    </div>
			    </div>
			</div>
		</div>
	</div>
</div>

<section class="blind">blind</section>
<!-- line Up -->
<section>
	<div class="col-md-12 mt-3">
		<div class="row">
			<div class="col-md-12">
				<div class="text-center">
					<h3>lineups</h3>
				</div>
				<div class='match-lineup'>
					<div class="no-gutter">					
						<div class="col-md-6">
							<div class="head radius">
								<div class="name">${channel.gameInfo.homeTeam.teamNickName} 선발</div>
							</div>
							
							<div class="team-wrap">
								<c:set var="i" value="0"/>
								<c:forEach var="homePlayerList" items="${lineUp.homePlayerList}">
									<div class="member">
										<img src="${lineUp.homePlayerList[i].playerImage}" alt="member-avatar" widtg="150" height="150">
										<div class="info">
											<div class="wrap">
												<div class="name">${lineUp.homePlayerList[i].playerName}</div>
												<div class="country">${lineUp.homePlayerList[i].playerPosition}</div>
											</div>
										</div>
									</div>
									<hr/>
									<c:set var="i" value="${i+1}"/>
								</c:forEach>								
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="head radius">
								<div class="name right">${channel.gameInfo.awayTeam.teamNickName} 선발</div>
							</div>
							
							<div class="team-wrap right radius">
								<c:set var="i" value="0"/>
								<c:forEach var="homePlayerList" items="${lineUp.awayPlayerList}">
									<div class="member">
										
										<div class="info">
											<div class="wrap">
												<div class="name right">${lineUp.awayPlayerList[i].playerName}</div>
												<div class="country">${lineUp.awayPlayerList[i].playerPosition}</div>
											</div>
										</div>
										<img src="${lineUp.awayPlayerList[i].playerImage}" alt="member-avatar" widtg="150" height="150">
									</div>
									<hr/>
									<c:set var="i" value="${i+1}"/>
								</c:forEach>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/common/quickMenu.jsp"/>
<script type="text/javascript" src="/js/library/jquery.js"></script>
<script type="text/javascript" src="/js/library/jquery.js"></script>
<script type="text/javascript" src="/js/library/jquery-ui.js"></script>
<script type="text/javascript" src="/js/library/bootstrap.js"></script>
<script type="text/javascript" src="/js/library/jquery.sticky.js"></script>
<script type="text/javascript" src="/js/library/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/js/library/jcarousel.connected-carousels.js"></script>
<script type="text/javascript" src="/js/library/owl.carousel.js"></script>
<script type="text/javascript" src="/js/library/progressbar.js"></script>
<script type="text/javascript" src="/js/library/jquery.bracket.min.js"></script>
<script type="text/javascript" src="/js/library/chartist.js"></script>
<script type="text/javascript" src="/js/library/Chart.js"></script>
<script type="text/javascript" src="/js/library/fancySelect.js"></script>
<script type="text/javascript" src="/js/library/isotope.pkgd.js"></script>
<script type="text/javascript" src="/js/library/imagesloaded.pkgd.js"></script>

<script type="text/javascript" src="/js/jquery.team-coundown.js"></script>
<script type="text/javascript" src="/js/matches-slider.js"></script>
<script type="text/javascript" src="/js/header.js"></script>
<script type="text/javascript" src="/js/matches_broadcast_listing.js"></script>
<script type="text/javascript" src="/js/news-line.js"></script>
<script type="text/javascript" src="/js/match_galery.js"></script>
<script type="text/javascript" src="/js/main-club-gallery.js"></script>
<script type="text/javascript" src="/js/product-slider.js"></script>
<script type="text/javascript" src="/js/circle-bar.js"></script>
<script type="text/javascript" src="/js/standings.js"></script>
<script type="text/javascript" src="/js/shop-price-filter.js"></script>
<script type="text/javascript" src="/js/timeseries.js"></script>
<script type="text/javascript" src="/js/radar.js"></script>
<script type="text/javascript" src="/js/slider.js"></script>
<script type="text/javascript" src="/js/preloader.js"></script>
<script type="text/javascript" src="/js/diagram.js"></script>
<script type="text/javascript" src="/js/bi-polar-diagram.js"></script>
<script type="text/javascript" src="/js/label-placement-diagram.js"></script>
<script type="text/javascript" src="/js/donut-chart.js"></script>
<script type="text/javascript" src="/js/animate-donut.js"></script>
<script type="text/javascript" src="/js/advanced-smil.js"></script>
<script type="text/javascript" src="/js/svg-path.js"></script>
<script type="text/javascript" src="/js/pick-circle.js"></script>
<script type="text/javascript" src="/js/horizontal-bar.js"></script>
<script type="text/javascript" src="/js/gauge-chart.js"></script>
<script type="text/javascript" src="/js/stacked-bar.js"></script>

<script type="text/javascript" src="/js/library/chartist-plugin-legend.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-threshold.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-pointlabels.js"></script>

<script type="text/javascript" src="/js/treshold.js"></script>
<script type="text/javascript" src="/js/visible.js"></script>
<script type="text/javascript" src="/js/anchor.js"></script>
<script type="text/javascript" src="/js/landing_carousel.js"></script>
<script type="text/javascript" src="/js/landing_sport_standings.js"></script>
<script type="text/javascript" src="/js/twitterslider.js"></script>
<script type="text/javascript" src="/js/champions.js"></script>
<script type="text/javascript" src="/js/landing_mainnews_slider.js"></script>
<script type="text/javascript" src="/js/carousel.js"></script>
<script type="text/javascript" src="/js/video_slider.js"></script>
<script type="text/javascript" src="/js/footer_slides.js"></script>
<script type="text/javascript" src="/js/player_test.js"></script>

<script type="text/javascript" src="/js/main.js"></script>

</body>
</html>