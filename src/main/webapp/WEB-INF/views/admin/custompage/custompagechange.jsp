<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의평가</title>
<script type="text/javascript"
   src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>

<script type="text/javascript">
   $(function() {
      $('form[name=customchangeinput]').submit(function() {
         event.preventDefault();
         $.ajax({
            type : "POST",
            url : "<c:url value='/customchange/customchangeinput'/>",
            data:$(this).serialize(),
            success:function() {
               self.close();
               opener.parent.location.reload();
            },
            error: function() {
             
               self.close();
            }
         })
      });
   });
</script>



</head>
<body>
   <form name="changeboard" method="post"
      action="<c:url value='/custompage/customchangeinput'/>">

      <table border="1"
         style="border-collapse: collapse; width: 80%; margin: 0 auto; text-align: center;">
        




         <tr>
            <td>1.</td>
            <td>업로드 여부</td>
            <td>
               <div style="text-align: center;">
                    <input type="radio" class="isupload" name="isupload" value="Y">사용
      				&nbsp;
      			<input type="radio" class="isupload" name="isupload" value="N">미사용
               </div>
            </td>
         </tr>




         <tr>
            <td>2.</td>
            <td>댓글여부</td>
            <td>
               <div style="text-align: center;">
                   <input type="radio" class="isreply" name="isreply" value="Y">사용
      				&nbsp;
      			<input type="radio" class="isreply" name="isreply" value="N">미사용
               </div>
            </td>
         </tr>





         <tr>
            <td>3.</td>
            <td>답글여부</td>
            <td>
               <div style="text-align: center;">
                  <input type="radio" class="iscomment" name="iscomment" value="Y">사용
      				&nbsp;
      			<input type="radio" class="iscomment" name="iscomment" value="N">미사용
               </div>
            </td>
         </tr>




         <tr>
            <td>4</td>
            <td>비공개여부</td>
            <td>
               <div style="text-align: center;">
                <input type="radio" class="isprivate" name="isprivate" value="Y">사용
      				&nbsp;
      			<input type="radio" class="isprivate" name="isprivate" value="N">미사용
       			
               </div>
            </td>
         </tr>






         <tr>
            <td>5.</td>
            <td>게시판 제목</td>
            <td>
               <div style="text-align: center;">
                   <input type="text" class="bdname" name="bdname" value="${param.change}">
               </div>
            </td>
         </tr>

         <tr>
            <td colspan="3"><input type="submit" id="boardInsert" value="등록" />
              
               <input type="button" value="취소" /></td>
         </tr>
      </table>
      <!-- 값 전달용 -->
        <input type="hidden" class="forbdname" name="forbdname" value="${param.change}">
      
   </form>


</body>
</html>