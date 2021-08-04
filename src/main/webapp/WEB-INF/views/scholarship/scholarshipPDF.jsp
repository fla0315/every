<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<style> 

    #main{
        border: 1px solid black; 
        width: 50%;
        height: 100%;
        margin: 0 auto;
    }

    #header{
        text-align: center;
    }


    table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
    }
    th, td {
        border: 1px solid #444444;
    }

    .table2{
        background-color: #eee;
    }

</style>

<body>
    
    <div id="main"> 
        <br>
        <h1 id="header">장학금 수혜 확인서</h1>

        <table id="table1">
            <tr>
                <td>소속</td>
                <td>가천대학교</td>
                <td>학번</td>
                <td>****</td>
            </tr>

            <tr>
                <td>성명</td>
                <td>김영림</td>
                <td>생년월일</td>
                <td>****</td>
            </tr>

            <tr>    
                <td >주소</td>
                <td colspan="3">경기도 포천시 신북면</td>
            </tr>

            <tr>
                <td >학력사항</td>
                <td colspan="2">2012년2월 29일입학</td>
                <td colspan="2">2019년2월 20일졸업</td>
            </tr>
        </table>
        <br>
        <div  style="text-align: center; margin: 0 auto;" >
            <span>
                위의 학생은 2 0 2 1 년도 장학금을 수혜한 사실을 확인합니다.
            </span>
        </div>
        <div  style="text-align: center; margin: 0 auto;" >
            <br><span>
                *다 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 음*
            </span>
        </div>
            

        <br>

      


        <!-- 테이블 반복 -->


        <table class="table table-sm" id="table2">
            <thead>
            <tr>
                <th scope="col">수혜학기</th>
                <th scope="col">수혜년도</th>
                <th scope="col">장학내용</th>
                <th scope="col">장학금 항목</th>
                <th scope="col">장학금액</th>
                <th scope="col">비고</th>
            </tr>
            </thead>
            <tbody>
                        <c:if test="${empty list }">
                            <tr>
                                <td colspan="6" class="align_center"></td>
                            </tr>
                        </c:if>
                        
                        <c:if test="${!empty list }">
                            <c:forEach var="map" items="${list }">
                                <tr class="align_center">
                                    <td>${map['SEMESTER']} 학기</td>  <!-- 수혜학기  -->
                                    <td><fmt:formatDate value="${map['AWARDING_DATE']}" pattern="yyyy-MM-dd" /></td>  <!-- 수혜년도  -->
                                    <td>${map['SCHOLARSHIP_TYPE']}</td>  <!-- 장학내용  -->
                                   <td>${map['SCHOLARSHIP_TYPE']}</td> <!-- 장학금 항목  -->
                                   <td>${map['SCHOLARSHIP']}</td> <!-- 장학금 항목  -->
                                    <td>비고</td>  <!-- 비고  -->
                                </tr>
                            </c:forEach>
                        </c:if>
            </tbody>
        </table>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br>
        <br>
        <br>
        <div  style="text-align: center; margin: 0 auto;" >
            <br><span>
                2021-07-19
            </span>
        </div>

        <div  style="text-align: center; margin: 0 auto;" >
            <br>
            <h1>가 천 대 학 교 총 장</h1>
            <span>직인</span>
        </div>


    </div>

</body>
</html>