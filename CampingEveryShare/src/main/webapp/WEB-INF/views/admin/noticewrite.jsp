<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
$(() => {
	$("#title").focus()
	
	$(".del").click(e => {
		$(e.target).prev().toggleClass("text-decoration-line-through")
		
		$(e.target).next().prop("checked", ()=>{return !$(e.target).next().prop("checked");})
	})
	
	$("#content").summernote({
		height: 300
	})
})

function checkCharacterCount(input) {
    var titleValue = input.value;

    // 최대 글자 수 체크
    if (titleValue.length > 20) {
        // 20자를 초과하면 입력을 제한
        input.value = titleValue.substring(0, 20);
        
        // 메시지 표시
        var displayBlock = document.getElementById('titleDupleBlock');
        displayBlock.style.display = 'block';
        displayBlock.textContent = "제목은 최대 20글자까지 가능합니다.";
    } else {
        // 입력이 제한되지 않으면 메시지 숨김
        var displayBlock = document.getElementById('titleDupleBlock');
        displayBlock.style.display = 'none';
    }
}

</script>
<style type="text/css">
.select {
	text-align: center;
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
   	display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
}

.recruitStatus{
    text-align: center;
    width: 80px;
    border: none;
    font-weight: bold;
}
.location{
    text-align: center;
    width: 55px;
    border: none;
    font-weight: bold;
}

label{
	margin : 5px;
}

select {
	width: 100px;
	text-align: center;
	margin-left: 10px;
}

.selectmoney{
	text-align: center;
}
</style>

<div class="container">


<!-- 작성 공간 -->
<div class="adminpageTitle">
<h3 id="adminpageTitle">공지사항 작성</h3>
<hr>

<div>

<form id="fileForm" action="./noticewrite" method="post">

 
<input type="hidden" name="adminCode" value="${adminCode }" >
<input type="hidden" name="boardCate" value="5" >
<div class="form-group mb-3">
<!-- 	<label class="form-label">작성자</label> -->
	<input type="text" class="form-control" name="loginNick" readonly="readonly" value="작성자">
</div>

<div class="form-group mb-3">
    <input type="text" class="form-control" name="title" id="title" 
    oninput="checkCharacterCount(this)" placeholder="최대 20글자">
    <div id="titleDupleBlock" style="color: red;"></div>
</div>

<div class="form-group mb-3">
<!-- 	<label class="form-label" for="content">본문</label> -->
	<textarea class="form-control" name="content" id="content"></textarea>
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<a href="./noticelist"><button type="button" class="btn btn-danger" id="btnCancel">취소</button></a>
</div>

</form>
</div>


</div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />