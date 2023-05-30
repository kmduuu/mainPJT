<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="eu">
<head>
    <meta charset="UTF-8">
   
   <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
   
    <script type="text/javascript">
		 $(function() {
			$('#addPostView').on("click" , function() {
					self.location = "/post/addPost?teamCode=OB"
			});
			$('#updatePostView').on("click" , function() {
				self.location = "/post/updatePost?postNo=53"
			});
			$('#deletePost').on("click" , function() {
				self.location = "/post/deletePost?postNo=48"
			});
			$("button:nth-child(n+1)").on("click" , function() {
				self.location = "/post/getPostList?teamCode="+$(this).val().trim();
				console.log($(this).val().trim())
			});
		 });
	</script>
	
</head>
<body>
    <input type="button" id="addPostView">게시물 작성</input>
    <input type="button" id="updatePostView">게시물 수정</input>
    <input type="button" id="deletePost">게시물 삭제</input>
    <table>
    <tr>
    <td>
	    <button type="button" class="btn btn-warning" value="HH">한화</button>
	    <button type="button" class="btn btn-warning" value="HT">KIA</button>
	    <button type="button" class="btn btn-warning" value="KT">KT</button>
	    <button type="button" class="btn btn-warning" value="LG">LG</button>
	    <button type="button" class="btn btn-warning" value="LT">롯데</button>
	    <button type="button" class="btn btn-warning" value="NC">NC</button>
	    <button type="button" class="btn btn-warning" value="OB">두산</button>
	    <button type="button" class="btn btn-warning" value="SK">SSG</button>
	    <button type="button" class="btn btn-warning" value="SS">삼성</button>
	    <button type="button" class="btn btn-warning" value="WO">키움</button>
	    <button type="button" class="btn btn-warning" value="NN">통합게시판</button>
    </td>
	</table>

</body>
</html>