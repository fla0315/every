<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.min.js"></script>
<%@ include file="../../inc/custom_top.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<meta charset="UTF-8">
<!-- 기본적으로 선택지를 더해가도록 안보이게 설정한다. -->
<style>
#subjtype{
		visibility:hidden;
}

#subjname{
		visibility:hidden;
}

#option{
 		visibility:hidden;
 }
 #boardtype{
 		visibility:hidden;
 }
 #all_option{
 		visibility:hidden;
 }
 #bdname{
 		visibility:hidden;
 }

</style>

<script type="text/javascript">



	


$(function(){
	
	//유효성검사
	
	
	
	//선택할 때마다 하위 항목이 하나씩 하나씩 늘어나도록 설정(관리자와 차이를 두려면 어쩔 수가 없다.)
	//학과선택	
	$('.deptname').change(function(){
		  var type= $(".deptname:checked").val();
		if (type!=null) {
			  $("#subjtype").css("visibility","visible");
		}else{
			$("#subjtype").css("visibility","hidden");
		}
		});
	
	
	 //이수구분 선택 및 강좌명 선택
	  $('.subj_type').change(function(){
		  var type= $(".subj_type:checked").val();
		  var name= $(".deptname:checked").val();
		  if (type!=null) {
			  $("#subjname").css("visibility","visible");
			  $(".subj_type_check").html(type).css("color", "red");
			  $(".a").val(type);
		}else{
			$("#subjname").css("visibility","hidden");
		}
		  
		  $.ajax({
				url:"<c:url value='/custompage/typecheck'/>",
				type:"post",
				async: false,
				data:{"type":type,"name":name},			
				success:function(res){
					for (var i = 0; i < res.length; i++) {
						var name=res[i].subjname;
						var num=res[i].opensubcode;

						$('.subj_name').append("<input type='radio' class='subname' name='subname' value='"+(name+"&nbsp&nbsp"+num)+"'>"+(name+"&nbsp&nbsp"+num)+"<br>");
						 $('.subname').change(function(){
							  var type= $(".subname:checked").val();
							  var spiltname= type.split("&nbsp");
						
							  if (type!=null) {
								  $("#boardtype").css("visibility","visible");
								  $(".subj_name_check").html(type).css("color", "red");
								  $(".b").val(spiltname[0]);
								  $(".b2").val(spiltname[1]);
							}else{
								$("#boardtype").css("visibility","hidden");
							}
							 
							});
					
					}
				},
				error:function(xhr, status, error){
					alert("error 발생!!" + error);
				}
			});
	
		});

	 //게시판 타입
	  $('.category').change(function(){
		  var type= $(".category:checked").val();
		  var opensub=$(".b2").val();
		  if (type!=null) {
			  $("#all_option").css("visibility","visible");
			  $(".type_check").html(type).css("color", "red");
			  $(".c").val(type);
			 $('#bdname').css("visibility","visible");	
		}else
			 $("#all_option").css("visibility","hidden");
		 	
		  //여기서 해당 개설교과코드의 과목이 이미 생성되었는지 확인한다. 
		    $.ajax({
				url:"<c:url value='/custompage/checkadmin'/>",
				type:"post",
				async: false,
				data:{"type":type,"opensub":opensub},			
				success:function(res){
					if (res) {
						$("#admincheck").val("Y");
					}else {
						$("#admincheck").val("N");
					}	
				},
				error:function(xhr, status, error){
					alert("error 발생!!" + error);
				}
			}
		});
		  
		});
	 //댓글사용 여부.d
	  $('.reply').change(function(){
		  var type= $(this).val();
		  if(type!=null){
			  $(".isreply").val(type);
		  }
	  });
	 
	//답글사용 여부.e
	  $('.comment').change(function(){
		  var type= $(this).val();
		  if(type!=null){
			  $(".iscomment").val(type);
		  }
	  });
	
	//비공개 여부.f
	  $('.private').change(function(){
		  var type= $(this).val();
		  if(type!=null){
			  $(".isprivate").val(type);
		  }
	  });
	
	//업로드 여부.g
	  $('.upload').change(function(){
		  var type= $(this).val();
		  if(type!=null){
			  $(".isupload").val(type);
		  }
	  });
	
	 
	 //옵션값 변경
	  //업로드 여부가 Y여야 내용 보이도록
	   $('.upload').change(function(){
		   var result=$(this).val();
		   $(".text").val(result);
		  if ($(".text").val()=="Y") {
			  $("#option").css("visibility","visible");
		}else{
			$("#option").css("visibility","hidden");
		}

	
	   });
	 //업로드 옵션값 저장.h
		  $('.maxup_file').change(function(){
			  var type= $(this).val();
			  if(type!=null){
				  $(".maxupfile").val(type);
			  }
		  });
		
		//업로드 옵션값 저장.i
		  $('.maxfile_size').change(function(){
			  var type= $(this).val();
			  if(type!=null){
				  $(".maxfilesize").val(type);
			  }
		  });

$('.boardcancel').click(function(){
	self.close();
	opener.parent.location.reload();
	
});	 
	
	 
$('form[name=registerboard]').submit(function(){	
	$.ajax({
	          type: "post",
	          url: '<c:url value='/custompage/customwrite'/>',
	          data: $(this).serialize(),  
	          async: false,
	          success: function(){    	
	        	  alert("등록성공");
	        		  self.close();
	        		  opener.parent.location.reload();
	           }, error: function (xhr, status, error){
					alert("error 발생!!" + error);
				}
		   });

});

});	

</script>
<title>Insert title here</title>
</head>
<body>

<form name="registerboard" class="registerboard" style="float:left" >
<div class="accordion" id="accordionExample" style="float:left;">
<div>
<!--학과명 -->
  <div class="accordion-item" style="width: 500px;">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
       학과명
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
       <c:forEach var="vo" items="${deptname}">
       
        <div>
       		<input type="radio" id="deptname" class="deptname" value="${vo.deptName}"> >${vo.deptName}
       	</div>		
       </c:forEach>
       
       </div>
    </div>
  </div>
  
  <!-- 이수구분 -->
  <div class="accordion-item" id="subjtype" style="width: 500px;">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        이수구분
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
       <c:forEach var="vo" items="${type}">
        <div>
       		<input type="radio" class="subj_type" name="subj_type" value="${vo.type}">>${vo.type} 
       	</div>		 		
       </c:forEach>
     </div>
    </div>
  </div>
  
  <!-- 강좌명 -->
  <div class="accordion-item" id="subjname" style="width: 500px;">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        강좌명
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
         		  	
       			<div class="subj_name"></div>    		
       			<br>   		 
		
      </div>
        </div>
    </div>
    
    <!-- 게시판 타입 -->
    <div class="accordion-item" id="boardtype" style="width: 500px;">
     <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        게시판 타입
      </button>
  		</h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
      <div class="accordion-body">
         <c:forEach var="vo" items="${category}">	
     
       			<input type="radio" class="category" name="category" value="${vo.categoryname}"> >${vo.categoryname}
       			<br>
  
       </c:forEach>
       			
            </div>
        </div>
        </div>
        
        <!-- 설정 -->
      
        <div class="accordion-item" id="all_option" style="width: 500px;">
           <h2 class="accordion-header" id="headingFive">
           <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
           설정
      </button>
  		</h2>
        
      <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
    		 
    		<div class="reply_con" style="float:left">
    		 	<div class="accordion-body">
        		<div class="reply_use">댓글 사용</div>
        		<br>
       
      			<input type="radio" class="reply" name="reply" value="Y" > >사용
      			<br>
      			<input type="radio" class="reply" name="reply" value="N"> >미사용
       			
           		</div>
            </div>
            
            <div class="comment_con" style="float:left">
    		 	<div class="accordion-body">
        		<div class="reply_use">답글사용여부</div>
        		<br>
       
      			<input type="radio" class="comment" name="comment" value="Y" > >사용
      			<br>
      			<input type="radio" class="comment" name="comment" value="N"> >미사용
       			
           		</div>
            </div>
            
            
            <div class="visible_con" style="float:left">
            <div class="accordion-body">
            <div class="visible_use">비공개 여부</div>
        	<br>
       
      		<input type="radio" class="private" name="private" value="Y"> >공개
      		<br>
      		<input type="radio" class="private" name="private" value="N"> >미공개
       			
            </div>
            </div>
            
             <div class="upload_con" style="float:left">
            <div class="accordion-body">
            <div class="upload_use">업로드 여부</div>
        	<br>
       
      		<input type="radio" class="upload" name="upload" value="Y"> 사용
      		<br>
      		<input type="radio" class="upload" name="upload" value="N"> 미사용
       			
            </div>
            </div>
            
            <!-- 업로드 옵션 -->
            
           
            <div class="accordion-body" id=option style="float:left"> 
           	<br>
        	<br>
       
       		<div id="countvisible" class="countvisible">
      		<select name="maxup_file" class="maxup_file" style="width:40px"> 
      			<option value="1">1</option>
      			<option value="2">2</option>
      			<option value="3">3</option>
      			<option value="4">4</option>
      			<option value="5">5</option>
      		</select> 개
      		</div>
      		
      		<div id="sizevisible" class="sizevisible">
      		<select name="maxfile_size" class="maxfile_size" style="width:50px"> 
      			<option value="100">100</option>
      			<option value="200">200</option>
      			<option value="300">300</option>
      			<option value="400">400</option>
      			<option value="500">500</option>
      			
      		</select> M
      		</div>
       			
            </div>
          
        </div>
    </div>
    
    
    </div>
    
  </div>
  


<div class="reg_box" style="float:left">
<div class="container">
		
			<div class="col-11 border" style="width:1000;">
			<fieldset>
				<div>
					<input type="text" id="bdname" name="bdname" placeholder="게시판 이름을 입력해주세요." required
						style="ime-mode: inactive">
					<input type="hidden" name="stuno" id="stuno" value="${param.stuno}">
					<input type="hidden" name="chk_info" id="chk_info" value="${param.chk_info}">
				<br>
					<br>
				
				<!-- 이수구분 확인용 -->	
				<div class="subj_type" style="width: 200px;">
					<label for="subj_typecheck">이수구분 : </label> 
					<span class="subj_type_check" id="subj_type_check"></span>
				</div>
				<br>
			

				<!-- 강좌명 확인용 -->
				<div class="subj_namecheck" style="width:200px, autowired;">
					<label for="subj_name_check_name">강좌명: </label> 
					
				</div>
				<span class="subj_name_check" id="subj_name_check"></span>
				<br>
				<br>

				<!-- 게시판 유형 확인용 -->
				<div class="type" style="width: 200px;">
					<label for="typecheck">게시판 유형 : </label> 
					<div class="type_check" id="type_check"></div>
				</div>
				<br>
				
				
				<!-- 체크 값 가져오기 -->
			
				
			</div>
			<span>
			<input type="submit" class="boardlist" name="boardlist" value="생성" style="float:center; color:blue" >
			<input type="button" class="boardcancel" name="boardcancel" value="취소" style="float:center; color:blue" >
			</span>
			</fieldset>
			</div>
			<!-- 업로드 옵션용 -->
			<input type="hidden" class="text" name="text">
			<!-- 이수구분 저장용 -->
			<input type="hidden" class="a" name="a">
			<!-- 강좌명 저장용 -->
			<input type="hidden" class="b" name="b">
			<!--  교과과목번호 -->
			<input type="hidden" class="b2" name="b2">
			<!-- 게시판 유형 저장용 -->
			<input type="hidden" class="c" name="c">
			<!-- 옵션 저장용 -->
			<!-- 댓글 -->
			<input type="hidden" class="isreply" name="isreply" value="N">
			<!-- 답글 -->
			<input type="hidden" class="iscomment" name="iscomment" value="N">
			<!-- 비공개 -->
			<input type="hidden" class="isprivate" name="isprivate" value="N">
			<!-- 업로드 -->
			<input type="hidden" class="isupload" name="isupload" value="N">
			<!-- 업로드 개수 -->
			<input type="hidden" class="maxupfile" name="maxupfile" value="1">
			<!-- 업로드 사이즈 -->
			<input type="hidden" class="maxfilesize" name="maxfilesize" value="100">
		
	
			</div>
		</div>
			
			</form>	
			<input type="text" class="admincheck" name="admincheck">
			

</body>
<%@ include file="../../inc/bottomforcustom.jsp"%>

</html>
