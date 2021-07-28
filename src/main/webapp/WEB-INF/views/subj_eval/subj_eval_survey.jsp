<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의평가</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>

<script type="text/javascript">
	$(function(){
		$('#btInsert').click(function(){
			var num = 0;
			$("input[type=radio]:checked").each(function(idx,item){
					num++
			});	
			if(num < 5){
				event.preventDefault();
				alert('모든 문항을 선택해주세요');
			}
		});
	});	
	
</script>



</head>
  <body>
    <form name="frmSurvey" method="post" action="<c:url value='/subj_eval/insertSurvey'/>">
    <input type="text" value="${param.openSubCode }">
      <table
        border="1"
        style="
          border-collapse: collapse;
          width: 80%;
          margin: 0 auto;
          text-align: center;
        "
      >
        <tr>
          <td scope="col">문항번호</td>
          <td scope="col">문항</td>
          <td scope="col">평점</td>
        </tr>
        <tr>
          <td colspan="3">
            <p>
              이 설문은 보다 좋은 교육을 여러분에게 제공하고자 실시되는 것입니다
              익명으로 작성된 여러분의 응답은 성적평가 후 정리되어 담당교수의
              다음 학기 강의준비를 위한 참고자료 및 교육여건 개선을 위한
              기초자료로 활용되오니 성실하게 답변하여 주시기 바랍니다. ※각
              문항별로 여러분이 동의하는 정도에 따라 ⑤~① 중 하나를 기재하여
              주십시오. ⑤. 우수하다(매우 그렇다) ④.양호하다 ③.보통이다 ②.못하다
              ①.매우 못하다(전혀 그렇지 않다).
            </p>
          </td>
        </tr>
        
        
        

        <tr>
          <td>1.</td>
          <td>교수가 휴강없이 수업을 진행하였으며, 휴강시 보강을 하였다</td>
          <td>
            <div style="display: flex; justify-content: space-between">
              <div style="text-align: center">
                <label for="">5</label><br />
                <input type="radio" name="a" id="a" value="5" />
              </div>
              <div style="text-align: center">
                <label for="">4</label><br />
                <input type="radio" name="a" id="" value="4" />
              </div>
              <div style="text-align: center">
                <label for="">3</label><br />
                <input type="radio" name="a" id="" value="3" />
              </div>
              <div style="text-align: center">
                <label for="">2</label><br />
                <input type="radio" name="a" id="" value="2" />
              </div>
              <div style="text-align: center">
                <label for="">1</label><br />
                <input type="radio" name="a" id="" value="1" />
              </div>
            </div>
          </td>
        </tr>
        
        
        
        
        <tr>
          <td>2.</td>
          <td>이 강의에 대해 전반적으로 만족한다</td>
          <td>
            <div style="display: flex; justify-content: space-between">
              <div style="text-align: center">
                <label for="5">5</label><br />
                <input type="radio" name="b" id="" value="5" />
              </div>
              <div style="text-align: center">
                <label for="4">4</label><br />
                <input type="radio" name="b" id="" value="4" />
              </div>
              <div style="text-align: center">
                <label for="3">3</label><br />
                <input type="radio" name="b" id="" value="3" />
              </div>
              <div style="text-align: center">
                <label for="2">2</label><br />
                <input type="radio" name="b" id="" value="2" />
              </div>
              <div style="text-align: center">
                <label for="1">1</label><br />
                <input type="radio" name="b" id="" value="1" />
              </div>
            </div>
          </td>
        </tr>
        
        
        
        
        
        <tr>
          <td>3.</td>
          <td>
            성적평가방법을 명확히 예고하였고, 평과결과를 신속하게 제공하였다.
          </td>
          <td>
            <div style="display: flex; justify-content: space-between">
              <div style="text-align: center">
                <label for="5">5</label><br />
                <input type="radio" name="c" id="" value="5" />
              </div>
              <div style="text-align: center">
                <label for="4">4</label><br />
                <input type="radio" name="c" id="" value="4" />
              </div>
              <div style="text-align: center">
                <label for="3">3</label><br />
                <input type="radio" name="c" id="" value="3" />
              </div>
              <div style="text-align: center">
                <label for="2">2</label><br />
                <input type="radio" name="c" id="" value="2" />
              </div>
              <div style="text-align: center">
                <label for="1">1</label><br />
                <input type="radio" name="c" id="" value="1" />
              </div>
            </div>
          </td>
        </tr>
        
        
        
        
        <tr>
          <td>4.</td>
          <td>수업계획서의 내용을 충실하게 반영하여 수업을 진행하였다.</td>
          <td>
            <div style="display: flex; justify-content: space-between">
              <div style="text-align: center">
                <label for="5">5</label><br />
                <input type="radio" name="d" id="" value="5" />
              </div>
              <div style="text-align: center">
                <label for="4">4</label><br />
                <input type="radio" name="d" id="" value="4" />
              </div>
              <div style="text-align: center">
                <label for="3">3</label><br />
                <input type="radio" name="d" id="" value="3" />
              </div>
              <div style="text-align: center">
                <label for="2">2</label><br />
                <input type="radio" name="d" id="" value="2" />
              </div>
              <div style="text-align: center">
                <label for="1">1</label><br />
                <input type="radio" name="d" id="" value="1" />
              </div>
            </div>
          </td>
        </tr>
        
        
        
        
        
        
        <tr>
          <td>5.</td>
          <td>강의 내용이 대학의 교양 또는 기초 과목으로서 적합하였다.</td>
          <td>
            <div style="display: flex; justify-content: space-between">
              <div style="text-align: center">
                <label for="btRadio">5</label><br />
                <input type="radio" name="e" id="" value="5" />
              </div>
              <div style="text-align: center">
                <label for="btRadio">4</label><br />
                <input type="radio" name="e" id="" value="4" />
              </div>
              <div style="text-align: center">
                <label for="btRadio">3</label><br />
                <input type="radio" name="e" id="" value="3" />
              </div>
              <div style="text-align: center">
                <label for="btRadio">2</label><br />
                <input type="radio" name="e" id="" value="2" />
              </div>
              <div style="text-align: center">
                <label for="btRadio">1</label><br />
                <input type="radio" name="e" id="" value="1" />
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="3">
            <textarea name="" id="" cols="120" rows="10"></textarea>
          </td>
        </tr>
        <tr>
          <td colspan="3">
            <input type="submit" id="btInsert" value="등록" />
            <input type="button" value="취소" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>