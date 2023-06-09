<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
   	<title>야구ROUTE</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <style>
    .text-primary {
    	color: #c313ac !important;
    	font-size: 13px;
    	text-align: center;
    	margin-block: revert;
	}
	
	button, input, select, textarea {
    	background-color: rgb(55 57 101);
	    border-radius: 28px;
	    display: inline-block;
	    cursor: pointer;
	    color: ghostwhite;
	    font-family: Arial;
	    font-size: 17px;
	    padding: 9px 15px;
	    text-decoration: none;
	    /* text-shadow: rgb(47, 102, 39) 0px 1px 0px; */
	    width: 120px;
	}
	.col-md-6 {
	    width: 50%;
	    left: 85px;
	    top: -6px;
	}
	input[type=text] {
	    padding: 15px 10px !important;
	    border: 2px solid #5b5353 !important;
	    width: 79% !important;
	    background: #ffffff !important;
	    font-size: 14px !important;
	    color: #666 !important;
	    line-height: initial !important;
	    outline: 0;
	    border-radius: 14px;
	}
	table tr th {
	    font-size: 10px;
	    text-transform: uppercase;
	    color: #fff;
	    height: 32px;
	    text-align: center;
	    background: #000000 !important;
	}
	table tr td {
	    padding: 10px 20px;
	    /* height: 50px; */
	    /* line-height: normal; */
	    border-bottom: 1px solid #3a8db9 !important;
	    font-size: 12px;
	    color: #141414;
	    text-align: center;
	    background: #fcfcfc;
	}
	.col-md-6 {
	    width: 44% !important;
	}
	.pagination{
		width: 50% !important;
	}
    </style>
    
    <script type="text/javascript">
    
   
    		
	function fncGetUserList(currentPage) {
		
		$("#currentPage").val(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/users/listUser").submit();
		}
	
	$(function() {
		 
		 $( "button.btn.btn-default" ).on("click" , function() {
			fncGetUserList(1);
		});
	 });

	$(function(){
		
		$("td:nth-child(2)").on("click", function(){
			
			var recent = $(this).text().trim();
			
			window.location.href="/users/getUsers?userId="+recent;
			
		});
	});

	$(function(){
	$("#playerList").on("click", function(){
		window.location.href="/player/listPlayer";
	});
	});
	
	$(function(){
    $("#getBestPlayerList").on("click", function(){

		window.location.href="/player/listBestPlayer";
	});
	});
	
	// enter 시 검색 버튼
	$(document).keydown(function(event) {
		  if (event.which === 13) {
			  
		      // 엔터 키를 눌렀을 때 수행할 동작을 여기에 작성
		      var searchKeyword = $("#searchKeyword").val();

		      if(searchKeyword < 2){
		    	  alert("최소 두 자 이상 입력 해 주세요.");  
		    	  return;
		      }
		      else{
		    	  fncGetUserList(1);
		      }
		      
			  
		  }
	});
	
    </script>
</head>

<body>
<jsp:include page="/admin/getAdmin.jsp"/>
<%-- <jsp:include page="/common/topBar.jsp"/> --%>

    <!--PLAYER SINGLE WRAP BEGIN-->
    
    <section class="player-single-wrap" style="text-align: center;width: 100%;display: inline-flex;">
        <!--LAST MATCHES BEGIN-->
<div class="container last-hockey-macthes">
    <div class="row">
        <div class="col-md-12 overflow-scroll" style="display: grid;justify-items: center;">
        	
            <h4 style="font-family: 'Gwangyang'; margin-bottom: 70px;margin-top:70px; text-align: center;">회원 목록 조회</h4>
            <form style="text-align: -webkit-center;">
            	<!-- <button type="button" id="playerList">선수 리스트</button>
	            <button type="button" id="getBestPlayerList">이주의 선수 조회</button> -->
            <div class="form-group" hidden="hidden">
				    <select style="width: auto; position: fixed;">
						<option hidden="hidden"  value="1"  ${ ! empty search.searchCondition ? "selected" : "" }>회원명</option>
					</select>
			</div>
			<div class="search" style="width: 500px; height: 60px;">
            <input type="text" id="searchKeyword" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  placeholder="회원명을 입력 해 주세요.">
       		<button type="button" id="searching" class="btn btn-default" style="border-radius: 13px; border: none; background: #19376D; top: 0px; width: 92px; left: -44px; font-family: 'Gwangyang'; font-size: 16px; color: #FFFFFF; position: relative;">검 색</button>
       		<input type="hidden" id="currentPage" name="currentPage" value=""/>
       		</div>
       		</form>
       		
       		<p class="text-primary">
       		
       		<span style="font-family: 'Gwangyang';">
       		전체 ${resultPage.totalCount } 명의 회원이 조회되었습니다.
       		</span>
       		<!-- <button type="button" id="withDrawsun">탈퇴 유무 순</button>
       		<button type="button" id="pointsun">포인트 많은 순</button> -->
       		</p>
            <br>
            <br>
            <table style="width: 1000px;">
                <tr>
                	<th>번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>휴대폰 번호</th>
                    <th>주소</th>
                    <th>탈퇴 유무</th>
                    <th>포인트</th>
                </tr>
                <tr>
                    <c:set var="i" value="0" />
		  				<c:forEach var="user" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr>
						  <td align="center">${ i }</td>
						  <td align="left" name="userId">${user.userId}</td>
						  <td align="left">${user.userName}</td>
						  <td align="left">${user.userPhone}</td>
						  <td align="left">${user.userAddr}</td>
						  <td align="left">
						  	<c:choose>
							  <c:when test="${user.withDraw == 0}">
							    X
							  </c:when>
							  <c:when test="${user.withDraw == 1}">
							    O
							  </c:when>
							</c:choose>
						  </td>
						  <td align="left">${user.userPoint}</td>
					    </tr>
          			</c:forEach>
                </tr>
            </table>
        </div>
	    <!-- PageNavigation Start... -->
		<jsp:include page="/common/pageNavigator_all.jsp">
		<jsp:param name="id" value="user"/>
		</jsp:include>
		<!-- PageNavigation End... -->
    </div>
</div> 

<!--LAST MATCHES END-->
</section>
<!--PLAYER SINGLE WRAP END-->
	
</body>

</html>
