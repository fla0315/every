<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">

<script>
   $(function(){
      
       $('#check_module').click(function () {
              // getter
              var IMP = window.IMP;
              IMP.init('imp31034269');
              
              var title = $('#title').val();
              
              IMP.request_pay({
                  pg: 'kakao',
                  merchant_uid: 'merchant_' + new Date().getTime(),

                  name: 'title',
                  amount:1,
                  buyer_email: 'iamport@siot.do',
                  buyer_name:'${postVo.writerCode}',
                  buyer_tel: '010-1234-5678',
                  buyer_addr: '인천광역시 부평구',
                  buyer_postcode: '123-456'
              }, function (rsp) {
              
                  
                  console.log(rsp);
                  if (rsp.success) {
                     var postNo = $('#postNo').val();
                     console.log(postNo);   
                     $.ajax({
                          type: "POST", 
                          url:  "<c:url value='/junggo/junggoupdate'/>", //충전 금액값을 보낼 url 설정
                          data: "postNo="+postNo,
                          success : function(){
                             console.log(postNo);
                             location.reload();
                     },
                     error : function(){
                        console.log(postNo);
                     }
                      });
                     
                     
                     
                      var msg = '결제가 완료되었습니다.';
                      msg += '고유ID : ' + rsp.imp_uid;
                      msg += '상점 거래ID : ' + rsp.merchant_uid;
                      msg += '결제 금액 : ' + rsp.paid_amount;
                      msg += '카드 승인번호 : ' + rsp.apply_num;
                 
                  } else {
                      var msg = '결제에 실패하였습니다.';
                      msg += '에러내용 : ' + rsp.error_msg;
                  }
                  alert(msg);
              });
          });
       
       
       $('button[name=chitchat]').click(function () {
            
             window.open('http://localhost:9091/every/chitchat/chitchatMain', 'detail', 'width=900, height=500, location=yes, resizable=yes');
             
        });
       
   });
   
   
   $(function(){
   

      
   });
      
</script>

<style type="text/css">   
   #info, #desc{
      width:100%;      
   }   
   #viewImg{
      float:left;
      padding:10px 30px 30px 30px;
      width:48%;            
   }
   #viewPd{
      float:right;
      padding:0 10px 30px 20px;
      width: 50%;      
   }
   #desc{
      clear:both;
      padding:10px 0 5px 0;      
   }
   #viewBest{
      float:left;
      padding:0 5px 30px 20px;   
      width:20%;      
   }
   
   .boldF{
      font-size:1.2em;
      font-weight:bold;

   }
   .center{
      text-align:center;
   }
   span{
      font-size:0.9em;
   }
   .sp1{
      width:50%;
      float:left;      
   }
   
   form{
      width:90%;
   }
   
      
   p{
      padding:8px;
      font-size:1.0em;
   }
   
   input[type="text"]{
      width:20%;
   }
</style>

<c:choose>
   <c:when test="${fn:contains(firstNo, 'P')}">
      교수
      <jsp:include page="../inc/prof_top.jsp"></jsp:include>
   </c:when>
   <c:when test="${fn:contains(firstNo, 'E')}">
      <jsp:include page="../inc/admin_top.jsp"></jsp:include>
   </c:when>
   <c:otherwise>
      ${firstNo }
      <jsp:include page="../inc/student_top.jsp"></jsp:include>
   </c:otherwise>
</c:choose>
<style type="text/css">
body {
   padding-top: 70px;
   padding-bottom: 30px;
}
</style>
<body>
   <div class="container col-lg-10" role="main">
<div class="card mb-3" >
<div class="card-header" >
            <i class="fas fa-table me-1"></i> 상품설명
         </div>
<div id="info">
   <!-- 상품이미지  -->
   <div id="viewImg">
      <!-- 상품 이미지 -->
      <p class="center">
         <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">
               <img style="width: 100%;" src="<c:url value="../pds_junggo/${map['FILE_NAME']}"/>" >
         </a>
      </p>
   </div>
   
      <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">상품이미지 크게 보기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  
                  <!-- 이미지 넣는 부분 -->
                  <div class="modal-body"  style="width: 100%">
                      <img style="width: 100%;" src="<c:url value="../pds_junggo/${map['FILE_NAME']}"/>" >
                  </div>
                  
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  </div>
                </div>
              </div>
            </div>
   <!-- Modal -->



   
   <div id="viewPd">
      <form name="frmPd" method="post" action="" >         
            <input id="postNo" type="hidden" value="${map['POST_NO']}">
         <br>
         <!-- 상품명 -->
         <p class="line">
         <!-- 판매상태 -->
            <c:if test="${map['DEL_FLAG']=='S'}">
                  <span style="font-weight: bold; color: orange; font-size: 1.6em;">판매중&nbsp;</span>
            </c:if>   
               
            <c:if test="${map['DEL_FLAG']=='C'}">
                  <span style="font-weight: bold; color: red; font-size: 1.6em;">판매완료&nbsp;</span>
            </c:if>   
         <!-- 판매상태 -->   
         <!-- 상품이름 -->   
            <c:if test="${map['DEL_FLAG']=='S'}">
                  <input type="hidden" id ="title" value="${map['TITLE']}">
                  <span style="font-size: 1.2em;" >${map['TITLE']}</span> <!-- 상품이름 -->
            </c:if>   
            
            <c:if test="${map['DEL_FLAG']=='C'}">
                  <span style="text-decoration: line-through;">${map['TITLE']}</span> <!-- 상품이름 -->
            </c:if>   
         <!-- 상품이름 -->   
         </p>
         
         <p class="line">
         
         
         <span class=""> <i class="fa fa-arrow-right" aria-hidden="true"></i>&nbsp;판매가격</span>            
            <c:if test="${map['DEL_FLAG']=='S'}">
                  <span id="getPrice"><fmt:formatNumber value="${map['PRICE']}" pattern="#,###"/></span> <!-- 상품이름 -->
            </c:if>   
            
            <c:if test="${map['DEL_FLAG']=='C'}">
                  <span style="text-decoration: line-through;"><fmt:formatNumber value="${map['PRICE']}" pattern="#,###"/>  </span>
            </c:if>   
         </p>

      
         <p>
            <span><i class="fa fa-arrow-right" aria-hidden="true"></i>&nbsp;판매자</span> <span>${map['WRITER']}</span>
         </p>
      
         <p>
            <span><i class="fa fa-arrow-right" aria-hidden="true"></i>&nbsp;등록일</span>
            <span><fmt:formatDate value="${map['REG_DATE']}" pattern="yyyy-MM-dd"/>  </span>
         </p>
      

      
         <p>
            <!-- <input type="button" id ="chitchat" value="쪽지"> -->
            <button id="chitchat" name="chitchat" type="button">쪽지보내기</button>
         </p>
         
         <p style="color: gray; font-size: 0.8em;"> 
            ※주의사항※
            직접결제 시 아래 사항에 유의해주세요.<br>
            구매문의 채팅이나 전화 등을 이용해 연락하고 외부 메신저 이용 및 개인 정보 유출에 주의하세요.<br>
            계좌이체 시 선입금을 유도할 경우 안전한 거래인지 다시 한번 확인하세요.<br>
            불확실한 판매자(본인 미인증, 해외IP, 사기의심 전화번호)의 물건은 구매하지 말아주세요.<br>
            
            에브리학사에 등록된 판매 물품과 내용은 개별 판매자가 등록한 것으로서, 에브리학사는 등록을 위한 시스템만 제공하며 내용에 대하여 일체의 책임을 지지 않습니다.
         </p>
         
         
         <p>
            <c:if test="${map['DEL_FLAG']=='S'}">
               <button id="check_module" type="button">상품구매</button>
            </c:if>   
            
            <c:if test="${map['DEL_FLAG']=='C'}">
            </c:if>   
            
            <button ><a style="text-decoration: none; color: black;" href="<c:url value='/junggo/junggoMain'/>">목록</a></button>
         </p>
      </form>
   </div>
</div>

 <hr>
      <!-- 여기 써머노트에서 디비 받아오는 부분 -->
   <div id="divContents">
      <p>${contents}</p>
   </div>
</div>
</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>