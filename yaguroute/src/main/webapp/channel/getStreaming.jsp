<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<!-- Video.js CDN, CSS CDN -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.11.4/video.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.11.4/video-js.min.css" rel="stylesheet">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		
		<!-- socket.io CDN -->
		<script src="https://cdn.socket.io/3.1.3/socket.io.min.js"></script>
		
		<script type="text/javascript">
			$(function(){
				
				//socket ����
				var socket = io.connect('http://192.168.0.36:3001/', {
					withCredentials: true,
					 extraHeaders: {
						'Access-Control-Allow-Origin': 'http://192.168.0.36:3001'
					 },
					 path: '/socket.io',
					 query: {
						 gameCode: '${channel.gameInfo.gameCode}',
						 userID: '${sessionScope.user.userId}'
					 }
				});
				
				$(window).on("load", function(){
					console.log("1. ä�� ���� Ȯ��");
					socket.emit('join');
					socket.emit('getMessageData');
										
					$.ajax({
						url:"/channel/rest/status?channelID=${channel.channelID}",
						method:"GET",
						dataType : "json",
						success : function(jsonData, status){
							if(status=="success"){
								var channel = jsonData.channelState;
								if(channel=='PUBLISHING'){
									console.log("channel ���� ��");
									var player = videojs('streaming', {
										sources : [
											{src:"${channel.channelCDN}", type:"application/x-mpegURL"}
										],
										poster: '${channel.gameInfo.homeTeam.teamEmblem}',
										controls: true,
										platsinline : true,
						 				muted : true,
						 				preload : "auto",
						 				width : "854",
						 				height : "480"										
									});
								} else {
									console.log("��� ���� ��");
									$('video').attr("poster", "${channel.gameInfo.homeTeam.teamEmblem}");
									//var html = "<img src='${channel.gameInfo.homeTeam.teamEmblem}' width='854' heigth='480'/>"
								}
										
							}		
						}
					});
				});
							
				
				//homeClick
				$("#homeClick").on('click', function(){
					socket.emit('homeClick', 1);
				});
				
				//awayClick
				$("#awayClick").on('click', function(){
					socket.emit('awayClick', 1);
				});
				
				//click �ޱ�
				socket.on('homeCount', (data) => {
					$('#homeClick').text("${channel.gameInfo.homeTeam.teamNickName} : "+data);
				});
				
				socket.on('awayCount', (data) => {
					$('#awayClick').text("${channel.gameInfo.awayTeam.teamNickName} : "+data);
				})
				
				
				//ä�� �ۼ���
				$('#chat-form').submit(function(e) {
				    e.preventDefault();
				    var message = $('#message-input').val().trim();
				    if (message) {
				      socket.emit('sendMessage', message);
				      $('#message-input').val('');
				    }
				  });
				
				socket.on("responseMessage", (data) => {
					console.log(data);
					$('#chat-messages').append($('<div>').text(data));
					$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
				});
				
				socket.on("getChattingData", (data) => {
					console.log(data);
					console.log(data[0].user_id);
					for(i in data){
						if(data[i].message == null){
							$('#chat-messages').append($('<div>').text(data[i].user_id+" : "));
							$('#chat-messages').append($('<div>').append($('<img>').attr('src', data[i].chat_image).attr('width', 200).attr('heigth', 200)));
						} else {
							$('#chat-messages').append($('<div>').text(data[i].user_id+" : "+data[i].message));	
						}
						console.log(data[i].user_id+" : "+data[i].message);
						
					}
				});
				
				//�̹��� ���� �ޱ�
				socket.on("responseImage", (data)=>{
					console.log(data);
					$('#chat-messages').append($('<div>').text(data.userID+" : "));
					$('#chat-messages').append($('<div>').append($('<img>').attr('src', data.Image).attr('width',200).attr('heigth', 200)));
				})
				
				//�̹��� ���ε� �ϱ�
				$('#uploadForm').submit(function(e){
					e.preventDefault();
					
					var formData = new FormData();
					var fileInput = $('#fileInput')[0].files[0];
					formData.append('image', fileInput);
					
					$.ajax({
						url: "http://192.168.0.36:3001/image/upload",
						type: "POST",
						processData: false,
				        contentType: false,
						data: formData,
						dataType: "json",
						success: function(data, status){
							console.log(data);
							socket.emit("image", data.image_path);
						}
						
					})
				});
			});
		
		</script>
		
		<style>
		  
		  .chat-container {
	      max-width: 500px;
	      margin: 50px auto;
	      }
	      
	      .chat-messages {
	      height: 300px;
	      overflow-y: scroll;
	      border: 1px solid #ccc;
	      padding: 10px;
	      }
		</style>
	</head>
	
	<body>
		<h1>${channel.channelName}</h1>
		
		<div class='row'>
			<div class="col-xs-12 col-md-8">
				<h2>videoJS Test</h2>
		  		<video id="streaming" class="video-js vjs-big-play-button vjs-big-play-centered">
				</video>
			</div>
			
			<div class="col-xs-6 col-md-4">
				<h2>ä���� �ڸ�</h2>
				<div class="col-xs-3 col-md-2">
					<img src="${channel.gameInfo.homeTeam.teamEmblem}" alt width="50" height="50"/>
					<button class="btn btn-primary" type="button" id="homeClick">
						����1
						<span class="badge" id="homeCount">${channel.homeClick}</span>
					</button>
				</div>
				
				<div class="col-xs-3 col-md-2">
					<img src="${channel.gameInfo.awayTeam.teamEmblem}" alt width="50" height="50"/>
					<button class="btn btn-primary" type="button" id="awayClick">
						����
						<span class="badge" id="awayCount">${channel.awayClick}</span>
					</button>
				</div>
			</div>
  		 </div>
  		 
  		 <div class="container chat-container">
		 	<div class="chat-messages" id="chat-messages">
		    	<!-- ä�� �޽����� ǥ���� ���� -->
		    </div>

		    <form id="chat-form">
		     	<div class="input-group">
		        	<input type="text" id="message-input" class="form-control" placeholder="�޽����� �Է��ϼ���">
			        <div class="input-group-append">
			        	<button type="button" class="btn btn-primary">����</button>
			        </div>
		    	</div>
		    </form>
		    
		    <form id="uploadForm" enctype="multipart/form-data">
			    <input type="file" name="file" id="fileInput">
			    <button type="submit">+</button>
		  	</form>
  		</div>
  		
  		
  		 
	</body>
</html>