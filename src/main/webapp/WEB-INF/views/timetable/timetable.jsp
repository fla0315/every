<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>



<style>
#timeTableDiv {
    margin-top:20px;
}
#timeTableDiv .days, #timeTableDiv .input {
    background-color: #f7f7f7;
}
#timeTableDiv .table-bordered thead td, #timeTableDiv .table-bordered thead th {
    border-bottom-width: 2px;
}
#timeTableDiv .table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
    color: white;
    font-weight: bold;
}
#timeTableDiv .table-bordered td, #timeTableDiv .table-bordered th {
    border: 1px solid #dee2e6;
}

#timeTableDiv .table-bordered td, #timeTableDiv .table-bordered th {
    border: 1px solid #dee2e6;
}
#timeTableDiv .time, #timeTableDiv .table th {
    padding: .75rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}

#timeTableDiv .time{
    background: #007bff2b;
    font-weight: 600;
}

#timeTableDiv .lectureIn{
    background-color: white;
    height: 72px;
    text-align: center;
    padding: 12px;
}
#timeTableDiv .lectureName{
    margin-top: 10px;
    font-size: 15px;
    font-weight: 600;
    color: #004c90;
}

#timeTableDiv .profName{
    margin-top: 5px;
    font-size: 14px;
    display: inline-block;	
}

#timeTableDiv .input{
    padding: 0;
}

#timeTableDiv #tticon{
    width: 35px;
}

#timeTableDiv #userName{
    font-weight: bold;
    font-size: 30px;
}

#timeTableDiv .input a{
    text-decoration: none;
    color: black;
}

#timeTableDiv .lectureInLink:hover > .lectureIn {
    background-color: #a900ff2b;/* #ffbf00c7 */
}
#timeTableDiv #pop{
    background-color : #fdfcf9;
    position:absolute; 
    left:100px; 
    top:100px; 
    width: 400px;
    height: 500px; 
    z-index:1;
    text-align: left;
    border: 1px solid #ccc;
    padding: 20px;
    margin: 10px;
    border-radius: 5px;
    /* display:none; */
/* 	
    background: #ccc;
    color: black;
    top: 10px;
    left: 100px;
    text-align: center;
    border: 2px solid #000; */
}

#pop .lab{

}
#timeTableDiv .hidden{
    display: none;
}

</style>


<script type="text/javascript">
	
	
		
</script>



<body>
    <div class="container">
        <div id="timeTableDiv">
                <div style="margin: 30px; font-size: 25px;">
                    <div style="text-align: center; margin: 0 auto;">
                         <div>${sessionScope.name }님의 강의시간표.</div>
                    </div>
                </div>
                <div class="table-responsive">

                    <table class="table table-bordered text-center" >
                        <colgroup>
                        <col width="10%">
                        <col width="18%">
                        <col width="18%">
                        <col width="18%">
                        <col width="18%">
                        <col width="18%">
                        </colgroup>
                        <thead>
                            <tr class="days" style="background: #343a40;">
                                <th>시간</th>
                                <th>월요일</th>
                                <th>화요일</th>
                                <th>수요일</th>
                                <th>목요일</th>
                                <th>금요일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="time">1교시<br><span style="font-size: 0.85rem;">09:00 - 09:50</span></td>
                                
                                <c:forEach items="${Timelist[0]}" var="var">
	                                <td class="input">${var}</td>
                                </c:forEach>
                                
                            </tr>
                            <tr>
                                <td class="time">2교시<br><span style="font-size: 0.85rem;">10:00 - 10:50</span></td>
                                <c:forEach items="${Timelist[1]}" var="var">
	                                <td class="input">${var}</td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td class="time">3교시<br><span style="font-size: 0.85rem;">11:00 - 12:50</span></td>
                                <c:forEach items="${Timelist[2]}" var="var">
	                                <td class="input">${var}</td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td class="time">4교시<br><span style="font-size: 0.85rem;">13:00 - 13:50</span></td>
                                <c:forEach items="${Timelist[3]}" var="var">
	                                <td class="input">${var}</td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td class="time">5교시<br><span style="font-size: 0.85rem;">14:00 - 14:50</span></td>
                                <c:forEach items="${Timelist[4]}" var="var">
	                                <td class="input">${var}</td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td class="time">6교시<br><span style="font-size: 0.85rem;">15:00 - 15:50</span></td>
                                <c:forEach items="${Timelist[5]}" var="var">
	                                <td class="input">${var}</td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td class="time">7교시<br><span style="font-size: 0.85rem;">16:00 - 16:50</span></td>
                                <c:forEach items="${Timelist[6]}" var="var">
	                                <td class="input">${var}</td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td class="time">8교시<br><span style="font-size: 0.85rem;">17:00 - 17:50</span></td>
                                <c:forEach items="${Timelist[7]}" var="var">
	                                <td class="input">${var}</td>
                                </c:forEach>
                            </tr>

                        </tbody>
                    </table>



                    
            </div>
        

    </div>
    </div> 
    
    <%@ include file="../inc/bottom.jsp" %>        
    