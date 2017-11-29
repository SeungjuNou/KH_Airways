<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>KH - Airline</title>

<link rel="stylesheet" type="text/css" href="_css/Icomoon/style.css" />
<link rel="stylesheet" type="text/css" href="_css/animated-header.css?ver=0"/>
<link rel="stylesheet" href="_css/flickity-docs.css" media="screen">
<link rel="stylesheet" type="text/css" href="_css/card.css" />


<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js"></script>


<script type="text/javascript" src="_scripts/animated-header.js"></script>
<script type="text/javascript" src="_scripts/card.js"></script>
<script type="text/javascript" src="_scripts/flickity.pkgd.min.js"></script>


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
               <div id="last-info-inner">
                 
                 <!--반복요소 시작-->
                  <div class="line3_1">
                     <ul id="line3_ul">
                        <li id="line5">탑승자1</li>
                        <li id="line6">예약정보를 확인 하시기 바랍니다.</li>
                        <li class="line_more2">
                              <img src="_assets/arrow.png" />
                        </li>
                     </ul>
                     <ul class="hide" id="hide2">
                        
                        <li>
                           탑승자 성명: 김준혁 수화물: 없음  
                        </li>
                        
                        
                     </ul>
                  </div>
                  <!--반복요소 종료-->

               

                  <!--반복요소 시작-->
                  <div class="line3_1">
                     <ul id="line3_ul">
                        <li id="line5">탑승자1</li>
                        <li id="line6">예약정보를 확인 하시기 바랍니다.</li>
                        <li class="line_more2">
                              <img src="_assets/arrow.png" />
                        </li>
                     </ul>
                     <ul class="hide" id="hide2">
                        
                        <li>
                           탑승자 성명: 김준혁 수화물: 없음  
                        </li>
                        
                        
                     </ul>
                  </div>
                  <!--반복요소 종료-->

               </div>

               <div id="total_last">
                        <ul>
                            <li>
                                <h2>총 금액(마일리지)</h2>
                            </li>
                            <li>
                                <h3>1,300,000 KRW</h3>
                            </li>
                            <li>
                                <input type="button" id="credit" value="신용카드 결제" />
                                <input type="button" value="마일리지 결제" />
                            </li>

                        </ul>
                </div>



            </div><!-- flight_list -->
            
         </div>

      </div> <!-- tab-headline -->

   </div>


    <div id="card_pay">
        <div class="demo-container">
            <h2>카드정보 입력</h2>
            <div class="card-wrapper"></div>
  
            <div class="form-container active">
                <form action="" id="card_info">
                    Card number :&nbsp;&nbsp;<input placeholder="Card number" type="text" name="number">
                    Card holder &nbsp;&nbsp;:&nbsp;&nbsp;<input placeholder="Full name" type="text" name="name">
                    Expiry date &nbsp;&nbsp;:&nbsp;&nbsp;<input placeholder="MM/YY" type="text" name="expiry">
                    CVC number :&nbsp;&nbsp;<input placeholder="CVC" type="text" name="cvc">
                    <input type="reset" value="초기화" />
                    <input type="submit" value="결제" />
                </form>
            </div>
        </div>      

        <div id="close5">
            <img src="_assets/close.png" alt="" />
        </div>  
        
   </div>




  





</div>


<script>

    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $("#credit").click(function(){
            $("#card_pay").fadeIn(450);
        });

        $("#close5>img").click(function(){
            $("#card_pay").fadeOut(450);
        });

    });


     $('.active form').card({
            container: $('.card-wrapper')
    })


</script>




</body>
</html>