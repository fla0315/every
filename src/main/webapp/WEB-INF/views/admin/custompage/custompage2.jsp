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

<script type="text/javascript">

$(function(){
	
	  
	  $('#subj_name').click(function(){
		  var type2= $(this).val();
		  alert(type);
		  $("#subj_type").html(type).css("color", "red");
		});
	  
	  $('#category').click(function(){
		  var type= $(this).val();
		  alert(type);
		  $("#subj_type").html(type).css("color", "red");
		});
	
});

</script>
<title>Insert title here</title>
</head>
<body>


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
       <c:forEach var="map" items="${deptname}">
       
        <div>
       		<a href="#">
       		<span style="color:black">${map['deptName']}</span>
       		</a>
       		</div>		
       </c:forEach>
       
       </div>
    </div>
  </div>
  
  <div class="accordion-item" style="width: 500px;">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        이수구분
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
       <c:forEach var="map" items="${prolist}">
        <div>
       		<a href="#">
       		<span style="color:black">${map['TYPE']}</span>
       		</a>
       		</div>		 		
       </c:forEach>
     </div>
    </div>
  </div>
  
  <div class="accordion-item" style="width: 500px;">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        강좌명
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
         <c:forEach var="map" items="${prolist}">	
       		<div>
       			<input type="radio" id="subj_name" class="subj_name" value=${map['SUBJ_NAME']}>${map['SUBJ_NAME']}
       		</div>		 
       </c:forEach>
      </div>
        </div>
    </div>
    
    <div class="accordion-item" style="width: 500px;">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        게시판 타입
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
      <div class="accordion-body">
         <c:forEach var="list" items="${category}">	
         <div>	
       			
       			<input type="radio" id="category" class="category" name="category"  > >${list}
       			<br>
       			
       			
       		</div>
       </c:forEach>
            </div>
        </div>
    </div>
    
    
  </div>
  



<input type="hidden" name="customname">

<div style="float:right; padding: 100px 100px 500px 300px; position:fixed" >

    <ul>
        <li class="menu" >
            <ul class="hide">
                <li>메뉴1-1</li>

            </ul>
        </li>
 
        <li class="menu">
            <ul class="hide">
                <li>메뉴2-1</li>
            </ul>
        </li>
        
         <li class="type" >
 				<div class="subj_type" id="subj_type">  </div>
        </li>
    </ul>
 
    </div>
 </div>



</body>
<%@ include file="../../inc/bottomforcustom.jsp"%>

</html>
