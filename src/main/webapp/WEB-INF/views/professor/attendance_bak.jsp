<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/prof_top.jsp" %>
<!-- 성적 입력창 -->

<script type="text/javascript">
	$(function(){
		$('#btCheck').click(function(){
			if($('#openSub option:selected').val()!='선택하세요'){
				var openSubCode = $('#openSub option:selected').val();
				location.href="<c:url value='/professor/attendance?openSubCode="+openSubCode+"'/>";
			} else{
				alert('개설교과목 번호를 선택하세요!');
			}
		});
		
		$('input[name=chkAll]').change(function(){
			$('.card-body table tbody input[type=checkbox]').prop('checked', this.checked);
		});
		
		var sum = 0;
		$('.attend1').each(function(idx){
			$('.attend'+idx+' option:selected').each(function(){
				var p = parseInt($(this).val());
				sum += p;
			});
			/* $('input[name=point'+idx+']').val(sum); */
			$('#point'+idx).val(sum);
			sum = 0;
		})
	});
</script>

<style type="text/css">
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
	<article>
		<div class="container col-lg-10" role="main">
			<h2>출석부</h2>
			<form name="form" id="form" role="form" method="post">
				<br>
				<div class="mb-3">
					<label for="title">개설교과목</label>
					<select id="openSub" class="dataTable-selector">
						<option>선택하세요</option>
						<c:if test="${!empty osList }">
							<c:forEach var="vo" items="${osList}">
								<c:if test="${open == vo.openSubCode }">
									<option selected>${vo.openSubCode }</option>
								</c:if>
								<c:if test="${open != vo.openSubCode }">
									<option>${vo.openSubCode }</option>
								</c:if>
							</c:forEach>
						</c:if>
					</select>
					<input type="button" id="btCheck" value="조회">
				</div>
				<div class="card mb-5">
                   <div class="card-header">
                       <i class="fas fa-table me-1"></i>
                       출석 입력
                   </div>
                   <div class="card-body">
                   	<input type="hidden" name="open" value="${open }">
                       <table class="table-bordered text-center" style="width:100%; font-size:0.8em">
                           <thead>
                               <tr>
                               	<th><input type="checkbox" name="chkAll"></th>
                               	<th>NO.</th>
                                <th>이름</th>
                                <th>학번</th>
                                <th>학과</th>
                                <c:forEach var="i" begin="1" end="10">
                                   	<th>${i}주차 </th>
                                </c:forEach>
                                <th>수정</th>
                               </tr>
                           </thead>
                           <tbody>
                           		<c:if test="${empty atList }">
                               			<tr>
                               				<td colspan="17" class="text-center">등록된 학생이 없습니다.</td>
                               			</tr>
                               	</c:if>
                               	<c:if test="${!empty atList }">
                               	<c:set var="noCheck" value="1" />
                               	<c:forEach var="map" items="${atList}">
                               <tr>
                               	<td><input type="checkbox"></td>
                                   <td>${noCheck }</td>
                                   <td>${map['NAME'] }</td>
                                   <td>${map['STU_NO'] }<input type="hidden" value="${map['STU_NO'] }" name="stuNo"></td>
                                   <td>${map['MAJOR'] }</td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="first">
                                   		<option value="none"></option>
                                   		<option value="10"
                                   		<c:if test="${map['FIRST'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['FIRST'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['FIRST'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['FIRST'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="second">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['SECOND'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['SECOND'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['SECOND'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['SECOND'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="third">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['THIRD'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['THIRD'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['THIRD'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['THIRD'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="fourth">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['FOURTH'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['FOURTH'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['FOURTH'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['FOURTH'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="fifth">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['FIFTH'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['FIFTH'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['FIFTH'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['FIFTH'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="sixth">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['SIXTH'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['SIXTH'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['SIXTH'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['SIXTH'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="seventh">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['SEVENTH'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['SEVENTH'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['SEVENTH'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['SEVENTH'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="eighth">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['EIGHTH'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['EIGHTH'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['EIGHTH'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['EIGHTH'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="ninth">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['NINTH'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['NINTH'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['NINTH'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['NINTH'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td>
                                   	<select class="custom-select attend${noCheck }" name="tenth">
                                   		<option value="0"></option>
                                   		<option value="10"
                                   		<c:if test="${map['TENTH'] eq '출석' }">
                                   			 selected
                                   		</c:if>
                                   		>출석</option>
                                   		<option value="5"
                                   		<c:if test="${map['TENTH'] eq '지각' }">
                                   			selected
                                   		</c:if>
                                   		>지각</option>
                                   		<option value="0"
                                   		<c:if test="${map['TENTH'] eq '결석' }">
                                   			selected
                                   		</c:if>
                                   		>결석</option>
                                   		<option value="5"
                                   		<c:if test="${map['TENTH'] eq '조퇴' }">
                                   			selected
                                   		</c:if>
                                   		>조퇴</option>
                                   	</select>
                                   </td>
                                   <td><input type="text" id="point${noCheck }" name="point">
                                   <input type="submit" class="btn btn-sm btn-secondary" id="btnEdit" value="수정" formaction="<c:url value='/professor/attendanceEdit?stuNo=${map["STU_NO"] }'/>"></td>
                               </tr>
                               	<c:set var="noCheck" value="${noCheck+1 }" />
                               </c:forEach>
                               </c:if>
                           </tbody>
                       </table>
                   </div>
               </div>
			</form>
			<div class="text-center">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			</div>
		</div>
	</article>


<%@ include file="../inc/bottom.jsp" %>