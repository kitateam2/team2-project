<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="resources/css/checkout.css" rel="stylesheet"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
   <script src="../resources/js/jquery-3.6.0.min.js"></script>
  
<script>
$(document).ready(function(){
	$('.card-number-input').on('keyup', text);
	$('.card-holder-input').on('keyup', text);
	$('.inputBox').on('change', text);
	$('.inputBox').on('mouseenter', text); //mouseover mouseenter 
	
})

function text(){
	var bb= document.getElementById('numInput').value;
	var cc= document.getElementById('nameInput').value;
	var dd= document.getElementById('inputmonth').value;
	var ee= document.getElementById('inputyear').value;
    var ff= document.getElementById('inputcvv').value;  
	$('.card-number-box').html(bb);
	$('.card-holder-name').html(cc);
	$('.exp-month').html(dd);
	$('.exp-year').html(ee);
    $('.inputcvv').html(ff); 
	

}



</script>

</head>
<body>

<div class="container">

    <div class="card-container">

        <div class="front">
            <div class="image">
                <img src="img/chip.png" alt="">
                <img src="img/visa.png" alt="">
            </div>
            <div class="card-number-box"></div>
            <div class="flexbox">
                <div class="box">
                    <span>card holder</span>
                    <div class="card-holder-name">full name</div>
                </div>
                <div class="box">
                    <span>expires</span>
                    <div class="expiration">
                        <span class="exp-month">mm</span>
                        <span class="exp-year">yy</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="back">
            <div class="stripe"></div>
            <div class="box">
                <span class="inputcvv">cvv</span>
                <div class="cvv-box"></div>
                <img src="image/visa.png" alt="">
            </div>
        </div>

    </div>

    <form action="complete" method="post">
        <div class="inputBox">
            <span>card number</span>
            <input type="text" maxlength="16" class="card-number-input" id="numInput">
        </div>
        <div class="inputBox">
            <span>card holder</span>
            <input type="text" class="card-holder-input" id="nameInput">
        </div>
        <div class="flexbox">
            <div class="inputBox">
                <span>expiration mm</span>
                <select name="" id="inputmonth" class="month-input">
                    <option value="month" selected disabled>month</option>
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </div>
            <div class="inputBox">
                <span>expiration yy</span>
                <select name="" id="inputyear" class="year-input">
                    <option value="year" selected disabled>year</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                </select>
            </div>
            <div class="inputBox">
                <span>cvv</span>
                <input type="text" maxlength="4" id="inputcvv" class="cvv-input">
            </div>
        </div>
        <input type="hidden" name="order_address" value="${order_address}">
        <input type="hidden" name="order_name" value="${order_name}">
        <input type="hidden" name="order_phone" value="${order_phone}">
        <input type="submit" value="submit" class="submit-btn">
    </form>
  

 

</div>   
</body>
</html>