<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<STYLE>

P.HStyle0, LI.HStyle0, DIV.HStyle0
	{style-name:"바탕글"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:150%; font-size:11.0pt; font-family:굴림; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle1, LI.HStyle1, DIV.HStyle1
	{style-name:"와우폼[제목][중]"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:0.0pt; line-height:120%; font-size:20.0pt; font-family:굴림; letter-spacing:0.0pt; font-weight:"bold"; font-style:"normal"; color:#000000;}
P.HStyle2, LI.HStyle2, DIV.HStyle2
	{style-name:"와우폼[11]"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:165%; font-size:11.0pt; font-family:굴림; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle3, LI.HStyle3, DIV.HStyle3
	{style-name:"와우폼[11][중]"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:0.0pt; line-height:120%; font-size:11.0pt; font-family:굴림; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle4, LI.HStyle4, DIV.HStyle4
	{style-name:"와우폼[10]"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:120%; font-size:10.0pt; font-family:굴림; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}
P.HStyle5, LI.HStyle5, DIV.HStyle5
	{style-name:"와우폼[10][중]"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:center; text-indent:0.0pt; line-height:120%; font-size:10.0pt; font-family:굴림; letter-spacing:0.0pt; font-weight:"normal"; font-style:"normal"; color:#000000;}

</STYLE>
</HEAD>

<BODY>
<div > 


<P CLASS=HStyle1 STYLE='line-height:100%;'><SPAN STYLE='font-size:20.0pt;font-weight:"bold";line-height:100%;'>등록금 납입고지서</SPAN></P>

<P CLASS=HStyle4 STYLE='line-height:100%; text-align: center;'><SPAN STYLE='font-size:10.0pt;line-height:100%;  '>(은행용)</SPAN></P>

<P CLASS=HStyle4 STYLE='line-height:100%;'>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none; margin: 0 auto;' >
<TR>
	<TD colspan="4" width="260" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>20○○학년도 제 ○ 학기 등록금</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>구&nbsp;&nbsp;&nbsp;&nbsp; 분</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>등록금액</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>장학금</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>납입할 금액</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>대학(원)</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>○○대학</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>입 학 금</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학과(전공)</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>○○</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>수 업 료</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학&nbsp;&nbsp;&nbsp;&nbsp; 번</SPAN></P>
	</TD>
	<TD width="96" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="58" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학&nbsp; 년</SPAN></P>
	</TD>
	<TD width="35" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>기성회비</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>성&nbsp;&nbsp;&nbsp;&nbsp; 명</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>계</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="4" width="260" height="153" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-left:73.3pt;margin-right:5.0pt;text-align:left;text-indent:-68.3pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>※ 납부기간 : 20○○.○.○(○요일) ~ 20○○.○.○(○요일)</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:20.0pt;margin-right:5.0pt;text-align:left;text-indent:-15.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>※ 수납은행 주의사항 : 반드시 전산 처리하여 주시기 바랍니다. (통상계좌입금 처리불가)</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;margin-right:5.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>○○은행 창구 전산처리코드 - ○○○○</SPAN></P>
	</TD>
	<TD colspan="4" width="416" height="153" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;text-align:right;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>◉ 교내격려장학생</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;text-align:right;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>◉ 교외격려장학생</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>&nbsp;</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:40.0pt;margin-right:25.0pt;text-align:left;text-indent:-15.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'><SPAN style='HWP-TAB:1;'>&nbsp;&nbsp;&nbsp;</SPAN>위 금액을 소정기일 내에 ○○ 은행 전국 각 지점에 납부하시기 바랍니다.</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:41.9pt;margin-right:25.0pt;text-align:left;text-indent:-16.9pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>&nbsp;</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;line-height:150%;'><SPAN STYLE='font-size:14.0pt;font-weight:"bold";line-height:150%;'>○○ 대학교 총장</SPAN></P>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle4 STYLE='line-height:100%;'>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none; margin: 0 auto;'>
<TR>
	<TD width="677" height="12" valign="middle" style='border-left:none;border-right:none;border-top:none;border-bottom:dotted #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0><SPAN STYLE='font-size:6.0pt;line-height:150%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle4 STYLE='line-height:100%;'><SPAN STYLE='font-size:10.0pt;line-height:100%;'><BR></SPAN></P>

<P CLASS=HStyle1 STYLE='line-height:100%;'><SPAN STYLE='font-size:20.0pt;font-weight:"bold";line-height:100%;'>등록금 영수필 통지서</SPAN></P>

<P CLASS=HStyle4 STYLE='line-height:100%; text-align: center;'><SPAN STYLE='font-size:10.0pt;line-height:100%;'>(학교용)</SPAN></P>

<P CLASS=HStyle4 STYLE='line-height:100%;'>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none; margin: 0 auto;'>
<TR>
	<TD colspan="4" width="260" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>20○○학년도 제 ○ 학기 등록금</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>구분</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>등록금액</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>장학금</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>납입할 금액</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>대학(원)</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>○○대학</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>입학금</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학과(전공)</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>○○</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>수업료</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학&nbsp;&nbsp;&nbsp;&nbsp; 번</SPAN></P>
	</TD>
	<TD width="96" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="58" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학&nbsp; 년</SPAN></P>
	</TD>
	<TD width="35" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>기성회비</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>성&nbsp;&nbsp;&nbsp;&nbsp; 명</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>계</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="4" width="260" height="99" valign="middle" style='border-left:solid #000000 0.4pt;border-right:none;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>위 납입금액을 영수하였기에 통지함.</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>&nbsp;</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>20○○ 년 ○ 월 ○ 일</SPAN></P>
	</TD>
	<TD colspan="4" width="416" height="99" valign="middle" style='border-left:none;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;text-align:right;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>◉ 교내격려장학생</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;text-align:right;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>◉ 교외격려장학생</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>&nbsp;</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:41.9pt;margin-right:25.0pt;text-align:right;text-indent:-16.9pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'><SPAN style='HWP-TAB:1;'>&nbsp;&nbsp;&nbsp;</SPAN>(수납인)</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="8" width="676" height="41" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;line-height:160%;'><SPAN STYLE='font-size:14.0pt;font-weight:"bold";line-height:160%;'>○○ 대학교 총장</SPAN></P>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle4 STYLE='line-height:100%;'>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none; margin: 0 auto;'>
<TR>
	<TD width="677" height="12" valign="middle" style='border-left:none;border-right:none;border-top:none;border-bottom:dotted #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0><SPAN STYLE='font-size:6.0pt;line-height:150%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle4 STYLE='line-height:100%;'><SPAN STYLE='font-size:10.0pt;line-height:100%;'><BR></SPAN></P>

<P CLASS=HStyle1 STYLE='line-height:100%;'><SPAN STYLE='font-size:20.0pt;font-weight:"bold";line-height:100%;'>등록금 영수증서</SPAN></P>

<P CLASS=HStyle4 STYLE='line-height:100%; text-align: center;'><SPAN STYLE='font-size:10.0pt;line-height:100%;'>(학생 보관용)</SPAN></P>

<P CLASS=HStyle4 STYLE='line-height:100%;'>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none; margin: 0 auto;'>
<TR>
	<TD colspan="4" width="260" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>20○○학년도 제 ○ 학기 등록금</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>구분</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>등록금액</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>장학금</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>납입할 금액</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>대학(원)</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>○○대학</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>입학금</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학과(전공)</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>○○</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>수업료</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학&nbsp;&nbsp;&nbsp;&nbsp; 번</SPAN></P>
	</TD>
	<TD width="96" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="58" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>학&nbsp;&nbsp; 년</SPAN></P>
	</TD>
	<TD width="35" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>기성회비</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="71" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>성&nbsp;&nbsp;&nbsp;&nbsp; 명</SPAN></P>
	</TD>
	<TD colspan="3" width="189" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="77" height="21" valign="middle" bgcolor="#ccffcc" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>계</SPAN></P>
	</TD>
	<TD width="115" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="112" height="21" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-right:10.0pt;text-align:right;'><SPAN STYLE='font-size:9.0pt;font-weight:"bold";line-height:120%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="4" width="260" height="122" valign="middle" style='border-left:solid #000000 0.4pt;border-right:none;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;text-align:left;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>[납부방법]</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;text-align:left;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>※ 은행 직접 방문 창구 납부(등록금고지서)</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;text-align:left;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>※ 희망자에 한하여 전자금융서비스 [인터넷, PC, 폰(전화)뱅킹!]</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;text-align:left;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>위 금액을 영수하였음.</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:5.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>20○○ 년 ○ 월 ○ 일</SPAN></P>
	</TD>
	<TD colspan="4" width="416" height="122" valign="middle" style='border-left:none;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:none;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;text-align:right;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>◉ 교내격려장학생</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;text-align:right;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>◉ 교외격려장학생</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;text-align:right;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>&nbsp;</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'>&nbsp;</SPAN></P>
	<P CLASS=HStyle5 STYLE='margin-left:41.9pt;margin-right:25.0pt;text-align:right;text-indent:-16.9pt;line-height:150%;'><SPAN STYLE='font-size:9.0pt;line-height:150%;'><SPAN style='HWP-TAB:1;'>&nbsp;&nbsp;&nbsp;</SPAN>(수납인)</SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="8" width="676" height="41" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:none;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle5 STYLE='margin-left:25.0pt;margin-right:25.0pt;line-height:160%;'><SPAN STYLE='font-size:14.0pt;font-weight:"bold";line-height:160%;'>○○ 대학교 총장</SPAN></P>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle4 STYLE='line-height:100%;'><SPAN STYLE='font-size:9.0pt;line-height:100%;'><BR></SPAN></P>

<P CLASS=HStyle4 STYLE='line-height:100%; text-align: center;'><SPAN STYLE='font-size:9.0pt;line-height:100%; margin: 0 auto;'>※ 영수증은 소득세법에 의한 연말 소득세 공제 신청서로 사용할 수 있음.</SPAN></P>
<BR><BR>
</div>
</BODY>
</html>