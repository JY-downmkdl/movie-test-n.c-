<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린시네마</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/header footer.css">
<link rel="stylesheet" href="/resources/css/index.css">
<link rel="stylesheet" href="/resources/css/moviechart.css">
<link rel="stylesheet" href="/resources/css/theaters.css">
<link rel="stylesheet" href="/resources/css/search.css">
<link rel="stylesheet" href="/resources/css/ticket.css">
<link rel="stylesheet" href="/resources/css/myPage.css">
<link rel="stylesheet" href="/resources/css/detailMovie.css">

<link rel="stylesheet" href="/resources/swiper/swiper.css"  href="style.css?ver=1.3"> 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="header">
	<div class="header_content">
        <div class="contents">
            <h2>
                <a href="/index"><img alt="로고"src="/resources/img/logoRed.png"></a>
            </h2>
            <ul class="memberInfo_wrap">
            	<!-- 권한따라 로그인/ 로그아웃 -->
	            <sec:authentication property="principal" var="principal" />
				<sec:authorize access="isAuthenticated()">
	                <li>
	                	<form action="/logout" method="post" name="logoutform"><a href="#" onclick="logout()">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                       	<img src="/resources/img/loginPassword.png" alt="">
	                      	<span>로그아웃</span>
	                    </a></form>
					</li>
					<!-- 권한따라 로그인/ 로그아웃 끝 -->
					
	                <li>
	                	<form action="/member/mypage" method="post" name="mpform"><a href="#" onclick="goMypage()" >
	                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                		<input type="hidden" name="userid" value="﻿<sec:authentication property='principal.username'/>" />
	                   		<img src="/resources/img/loginMember.png" alt="">
	                    	<span>myCGV</span>
	                    </a></form>
	                </li>
	                 <script>
	                 	function logout(){
	                 		let form = document.logoutform;
	                 		form.submit();
	                 	}
	                	function goMypage(){
	                		let form = document.mpform;
	                		let userid = $("input[name=userid]").val().trimStart();
	                		$("input[name=userid]").val(userid);
	                		form.submit();
	                	}
	                </script>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
	                <li><a href="/member/login">
	                    <img src="/resources/img/loginPassword.png" alt="">
	                    <span>로그인</span>
	                </a></li>
	                <li><a href="/member/join">
	                    <img src="/resources/img/loginJoin.png" alt="">
	                    <span>회원가입</span>
	                </a></li>
	                <!-- 권한따라 로그인/ 로그아웃 끝 -->
	                <li><a href="/member/mypage">
	                    <img src="/resources/img/loginMember.png" alt="">
	                    <span>myCGV</span>
	                </a></li>
				</sec:authorize>
	                <li><a href="">
	                    <img src="/resources/img/loginCustomer.png" alt="">
	                    <span>고객센터</span>
	                </a></li>
            </ul>
        </div>
    </div>
    <div class="nav">
        <div class="contents">
            <ul class="nav_menu">
            	<sec:authorize access="hasRole('ROLE_ADMIN')">
            		<li>
	                    <h2><a href="/admin/moviechart">영화</a></h2>
	                    <dl class="nav_overMenu">
	                        <dt><a href="/movies/moviechart">영화</a></dt>
	                        <dd></dd>
	                        <dd></dd>
	                        <dd></dd>
	                    </dl>
	                </li>
            	</sec:authorize>
            	
            	 <sec:authorize access="!hasRole('ROLE_ADMIN')">
            		<li>
	                    <h2><a href="/movies/moviechart">영화</a></h2>
	                    <dl class="nav_overMenu">
	                        <dt><a href="/movies/moviechart">영화</a></dt>
	                        <dd></dd>
	                        <dd></dd>
	                        <dd></dd>
	                    </dl>
	                </li>
            	</sec:authorize>
                
                <li>
                    <h2><a href="/theaters/location?thname=울산">극장</a></h2>
                    <dl class="nav_overMenu">
                        <dt><a href="/theaters/location">극장</a></dt>
                        <dd></dd>
                        <dd></dd>
                        <dd></dd>
                    </dl>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
	                <li>
	                    <h2><a href="/admin/tickets">예매내역</a></h2>
	                    <dl class="nav_overMenu">
	                        <dt><a href="/admin/tickets">예매내역</a></dt>
	                        <dd></dd>
	                        <dd></dd>
	                        <dd></dd>
	                    </dl>
	                </li>
                </sec:authorize>
               <sec:authorize access="!hasRole('ROLE_ADMIN')">
	                <li>
	                    <h2><a href="/tickets/ticket">예매</a></h2>
	                    <dl class="nav_overMenu">
	                        <dt><a href="/tickets/ticket">예매</a></dt>
	                        <dd></dd>
	                        <dd></dd>
	                        <dd></dd>
	                    </dl>
	                </li>
                </sec:authorize>
                <div class="totalSearch_wrap">
                	<form method="get" action="/search/all" class="searchform" style="border-left: 1px solid #ddd; padding-left: 5px;">
	                    <input type="text" name="keyword">
                    <button type="submit" class="btn_totalSearch" id="btn_header_search"><i class="material-icons"></i></button>
                    </form>
                </div>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('.nav_menu > li > h2 > a').on({
            mouseenter: function (e) {
                var target = e.target;
                $(target).parents('.nav_menu').find('.nav_overMenu').slideDown(function () {
                    $('.nav').addClass('active');
                });
            },
            click: function (e) {
                var target = e.target;
                if (!$('.nav').hasClass('active')) {
                    $(this).trigger('mouseenter');
                } else {
                    $('.nav').trigger('mouseleave');
                }
            }
        });

        /********************************************************
        //서브메뉴 구글 GA Analytics 로그 처리 - 2022.01.12 myilsan
        ********************************************************/
        //cgv화이트 메뉴클릭
        $('.nav > .contents > h1 > a').on({
             click: function (e) {
                 gaEventLog('PC_GNB', '홈', '');
            }
        });

        //주메뉴 클릭
        $('.nav_menu > li > h2 > a').on({
            click: function (e) {
                gaEventLog('PC_GNB', '주메뉴_' + this.text, '');
            }
        });

        //주메뉴 하위메뉴 클릭
        $('.nav_overMenu > dd > h3 > a').on({
            click: function (e) {
                var target = e.target;
                var parText = $(target).parents('.nav_overMenu').find('dt')[0].innerText;
                gaEventLog('PC_GNB', parText + '_' + this.text, '');
            }
        });

        //하위메뉴 최상위 클릭
        $(".nav_overMenu > dt > h2 > a").on({
            click: function (e) {
                gaEventLog('PC_GNB',this.text + '_' + this.text, '');
            }
        });

        //------------------end----------------------- [@,.o]>

        $('.nav').on({
            mouseleave: function (e) {
                $(this).find('.nav_overMenu').slideUp(200, function () {
                    $('.nav').removeClass('active');
                });
            }
        });

        $('.totalSearch_wrap input[type=text]').on({
            focusin: function () {
                $('.totalSearch_wrap').addClass("active");
            }
        });

        $('.btn_totalSearchAutocomplete_close').on({
            click: function () {
                $('.totalSearch_wrap').removeClass("active");
            },
            focusout: function (e) {
                //     $('.totalSearch_wrap').removeClass("active");

            }
        });

        $(this).on({
            scroll: function (e) {
                /* S GNB fixed */
                var headerOffsetT = $('.header').offset().top;
                var headerOuterH = $('.header').outerHeight(true);
                var fixedHeaderPosY = headerOffsetT + headerOuterH;
                var scrollT = $(this).scrollTop();
                var scrollL = $(this).scrollLeft();

                if (scrollT >= fixedHeaderPosY) {
                    $('.nav').addClass('fixed');
                    $('.fixedBtn_wrap').addClass('topBtn');
                } else {
                    $('.nav').removeClass('fixed');
                    $('.fixedBtn_wrap').removeClass('topBtn');
                }

                /* S > GNB fixed 좌우 스크롤
                Description
                - GNB가 fixed 되었을때 좌우 스크롤 되게 처리
                */
                if ($('.nav').hasClass('fixed')) {
                    $('.nav').css({ 'left': -1 * scrollL })
                } else {
                    $('.nav').css({ 'left': 0 })
                }
                /* E > GNB fixed 좌우 스크롤 */
                /* S GNB fixed */
            }
        });

        $('.btn_gotoTop').on({
            click: function () {
                $('html, body').stop().animate({
                    scrollTop: '0'
                }, 400);
            }
        });
 
        //통합검색 상단 검색 버튼
        $('#btn_header_search').on('click', function (e) {
        	e.preventDefault();
        	let form = $("form.searchform");
        	if ($("input[name='keyword']").val() == "") {
                alert("검색어를 입력해 주세요");
                $("input[name='keyword']").focus();
                return false;
            }
			form.submit();
			
        });

        //통합검색 검색어 입력창
        $('#header_keyword').keyup(function (e) {
            if (e.keyCode == 13) goSearch($('#header_keyword'));
        });


    }); 

    
    //통합검색
    function goSearch() {
		
        if ($("input[name=keyword]").val() == "") {
            alert("검색어를 입력해 주세요");
            $objKeyword.focus();
            return false;
        }

        //GA 검색로그
        gaEventLog('PC_GNB', '검색', $objKeyword.val());
        location = "/search/?query=" + escape($objKeyword.val());
    }
</script>
</body>
</html>