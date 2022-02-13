<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Parcel Sandbox</title>
<head>
<script type="text/javascript">
function chk(){
 var req = document.form.req.checked;
 var num = 0;
 if(req == true){
  num = 1;
 }
 if(num==1){
  document.form.submit();
 }else{
  alert("개인정보 약관에 동의하셔야 합니다.");
 }
}
function nochk(){
 alert("동의하지 않으면 가입하실 수 없습니다");
location.href="../index.jsp";}

function chk(){
	 var req2 = document.form.req2.checked;
	 var num = 0;
	 if(req2 == true){
	  num = 1;
	 }
	 if(num==1){
	  document.form.submit();
	 }else{
	  alert("개인정보 약관에 동의하셔야 합니다.");
	 }
	}
	function nochk(){
	 alert("동의하지 않으면 가입하실 수 없습니다");
	location.href="home";}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 창</title>
</head>
<body>
<form action="join" name="form" method="get">
 <table width="1400" height="650">
  <tr>
   <td width="100%" height="50%" align="center">
   <p align="left">
   <span style="padding-left: 160px">
   term and condition</span>
   </p>
   <br>
   <textarea
     rows="20" cols="100">동의안하면 가입못하니까 동의하라고
   </textarea>
   <br>
   <input type="checkbox" name="req"> 동의합니다
   <tr>
   <td width="100%" height="50%" align="center">
   <p align="left">
   </p>
   <br>
   <textarea
     rows="20" cols="100">동의안하면 가입못하니까 동의하라고
   </textarea><br>
   <input type="checkbox" name="req2"> 동의합니다
   </td>
  </tr>
  <tr>
   <td align="center" valign="top">
    <input type="button" value="동의" onclick="chk()"/>&nbsp;&nbsp;&nbsp;
    <input type="button" value="동의하지 않습니다" onclick="nochk()"/>
   </td>
  </tr>
 </table>
</form>
</body>
</html>
