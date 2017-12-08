<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>KH - Airline</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" href="../_css/Icomoon/style.css" />
<link rel="stylesheet" type="text/css" href="../_css/animated-header.css?ver=0"/>
<link rel="stylesheet" href="../_css/flickity-docs.css" media="screen">
<link rel="stylesheet" type="text/css" href="../_css/card.css" />


<script type="text/javascript" src="../_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="../_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="../_scripts/jquery.isotope.min.js"></script>


<script type="text/javascript" src="../_scripts/animated-header.js"></script>
<script type="text/javascript" src="../_scripts/card.js"></script>
<script type="text/javascript" src="../_scripts/flickity.pkgd.min.js"></script>


</head>
<body>

<!--  top_header -->
<div id="wrapper">
   <div id="header">
      <div id="header-inner">
         <div id="header-inner-logo">
            <div id="header-inner-logo-icon">
               
               <img src="_assets/icon.png" id="main_icon"  />

            </div>
         </div>
         <div id="header-inner-nav">
            <ul>
               <li><p><b>항공권예매</b></p></li>
               <li><p><b>마일리지</b></p></li>
               <li><p><b>마이페이지</b></p></li>
               <li id="member">
                  <p><b>Seungju Nou</b></p>
                  <ul>
                     <li>로그아웃</li>
                     <li>마이페이지</li>
                  </ul>
               </li>
            </ul>
         </div>
      </div>
   </div>




   <div class="tab" data-section="1">
      
      <img src="_assets/1.jpg" alt="" />
   
      
      <div class="tab-headline2">

         <div id="search_dep2">

            <div id="flight_choice">
               
               <div id="flight_title">

               

               </div>
            </div>

            <div id="last-info-wrap">
               <div id="middle-info-inner">
                 
                 <!--반복요소 시작-->
                  <div class="line3">
                     <ul>
                        <li id="line">탑승자1</li>
                        <li id="line2">인천국제공항(ICN)</li>
                        <li id="line">15:30</li>
                        <li id="line2">프랑크푸르트(FRA)</li>
                        <li id="line">19:20</li>
                        <li class="line_more">
                              <img src="_assets/arrow.png" />
                        </li>
                     </ul>
                     <ul class="hide" id="hide2">
                        
                        <div id="per_line1">
                           <div>한글이름</div>
                           <div>영문 성</div>
                           <div>영문 이름</div>
                        </div>

                        <div id="per_line2">
                           <div><input type="text" /></div>
                           <div><input type="text" id="last" onkeyup="Upper(event,this)" 
                           onkeydown="if (event.ketCode == 13) handled = true" onblur="handled = false"/></div>
                           <div><input type="text" id="first" onkeyup="Upper(event,this)" 
                           onkeydown="if (event.ketCode == 13) handled = true" onblur="handled = false" /></div>
                        </div>

                        <div id="per_line1">
                           <div>성별</div>
                           <div>연락처</div>
                           <div>이메일</div>
                        </div>

                        <div id="per_line3">
                           <div><input type="text" /></div>
                           <div><input type="text" /></div>
                           <div><input type="text" /></div>
                        </div>
   
                        <div id="per_line4">
                           <div>&nbsp;</div>
                           <div class="choice">
                              <button value="LH713">저장</button>
                           </div>
                           <div>&nbsp;</div>
                        </div>
                        
                     </ul>
                  </div>
                  <!--반복요소 종료-->

               </div>

            </div><!-- flight_list -->
            
         </div>

      </div> <!-- tab-headline -->

   </div>


</div>


<script>

   
     


</script>




</body>
</html>