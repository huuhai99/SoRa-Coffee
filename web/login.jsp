<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>


<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <title>Đăng nhập - Coffee Blend</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/signin_signup.css">
    <link rel="stylesheet" href="css/userStyle.css">

    <style>
        .form-control {
            height: 45px !important;
        }
    </style>

</head>
<body>
<%
    String err = "";
    if (request.getAttribute("err") != null) {
        err = (String) request.getAttribute("err");
    }
    String email = "";
    String pass = "";
    if (request.getAttribute("email") != null) {
        email = (String) request.getAttribute("email");
    }
    if (request.getAttribute("pass") != null) {
        pass = (String) request.getAttribute("pass");
    }
    String errorString = "";
    if(request.getAttribute("errorString") !=null){
        errorString = (String) request.getAttribute("errorString");
    }
%>
<!--Header-->
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Coffee<small>Blend</small></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav" class="menu">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="index.jsp" class="nav-link">Trang chủ</a></li>
                <li class="nav-item"><a href="menu.html" class="nav-link">Thực đơn</a></li>
                <!--                <li class="nav-item"><a href="services.html" class="nav-link">Dịch vụ</a></li>-->
                <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                <!--                <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">Cửa hàng</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="about.html">Về chúng tôi</a>
                        <a class="dropdown-item" href="shop.html">Cửa hàng</a>
                        <a class="dropdown-item" href="services.html">Dịch vụ</a>
                        <a class="dropdown-item" href="product-details.html">Chi tiết sản phẩm</a>
                        <a class="dropdown-item" href="cart.html">Giỏ hàng</a>
                        <a class="dropdown-item" href="checkout.html">Thanh toán</a>
                    </div>
                </li>
                <li class="nav-item"><a href="contact.html" class="nav-link">Liên hệ</a></li>
                <li class="nav-item active dropdown">
                    <a class="nav-link dropdown-toggle" href="shop.html" id="dropdown05" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false"><i class="icon-user"></i> Tài khoản</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown05">
                        <a class="dropdown-item" href="login.jsp">Đăng nhập</a>
                        <a class="dropdown-item" href="register.html">Đăng kí</a>
                        <a class="dropdown-item" href="IfoUser.html">Thông tin cá nhân</a>
                    </div>
                </li>

                <li class="nav-item cart"><a href="cart.html" class="nav-link"><span
                        class="icon icon-shopping_cart"></span><span
                        class="bag d-flex justify-content-center align-items-center"><small>1</small></span></a></li>
            </ul>
        </div>
    </div>
</nav>

<!--Content-->
<!-- The Modal Sign in-->
<div id="myModal-signIn" style="margin-top: 120px" class="col-md-12 pr-md-8">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Sign in Header -->
            <div class="modal-header">
                <h4 class="modal-title">ĐĂNG NHẬP</h4>
            </div>

            <!-- Sign in body -->
            <div class="modal-body">
                <!--form-->
                <form action="LoginController" method="post">
                    <!--container-->
                    <div class="container">
                        <p style="color: white;"><%=err%>
                        <p style="color: white;"><%=errorString%>
                        </p>
                        <div class="form-group">
                            <label for="email_1">Email:</label>
                            <input type="email" class="form-control" name="email_1" id="email_1" value="<%=email%>">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Mật khẩu:</label>
                            <input type="password" class="form-control" name="password" id="pwd" value="<%=pass%>">
                        </div>
                        <!-- reCAPTCHA -->
                        <div class="g-recaptcha"
                             data-sitekey="6LdqcrkZAAAAAHqVmA7iVJBmubB_i3y0-HphLIdO"></div>


                        <button type="submit" style="margin-top: 20px" class="btn btn-success w-100"><i class="icon-sign-in"></i>&nbsp; Đăng
                            nhập
                        </button>

                    </div>
                </form>
              <button  class="btn btn-success w-100" style="margin-top: 20px" > <a href="https://www.facebook.com/dialog/oauth?client_id=2720474321608029&redirect_uri=http://localhost:8080/cnpm_nhom03/login_facebook" style="color:white;">Login Facebook</a></button>
                <button class="btn btn-success w-100" style="margin-top: 20px"><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/cnpm_nhom03/login_google&response_type=code
    &client_id=508591481116-tna9n07ahv5il3j14gnguvk01m3bd55g.apps.googleusercontent.com&approval_prompt=force"  style="color:white;">Login With Google</a>
                </button>


            </div>

            <!-- Sign in footer -->
            <div class="modal-footer">
                <h6 class="w-100">Quên mật khẩu?</h6>
                <a href="register.html" class="btn btn-danger w-100"><i class="icon-user-plus"></i>&nbsp; Đăng ký
                    ngay</a>
            </div>

        </div>
    </div>
</div>


<!--Footer-->
<footer class="ftco-footer ftco-section img">
    <div class="overlay"></div>
    <div class="container">
        <div class="row mb-5">
            <div class="col-lg-4 col-md-6 mb-5 mb-md-5">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Giới thiệu</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there
                        live the blind texts.</p>
                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                        <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-5 mb-md-5">
                <div class="ftco-footer-widget mb-4 ml-md-4">
                    <h2 class="ftco-heading-2">Thành viên</h2>
                    <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block"><i class="icon-user"></i>&nbsp;&nbsp;Vũ Huỳnh Như Anh</a>
                        </li>
                        <li><a href="#" class="py-2 d-block"><i class="icon-user"></i>&nbsp;&nbsp;Nguyễn Hữu Hải</a>
                        <li><a href="#" class="py-2 d-block"><i class="icon-user"></i>&nbsp;&nbsp;Vũ Quốc Huy</a></li>
                        </li>
                        <!--                        <li><a href="#" class="py-2 d-block">Mixed</a></li>-->
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-5 mb-md-5">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Thông tin cửa hàng</h2>
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span class="text">Trường Đại học Nông Lâm Thành phố Hồ Chí Minh, Quận Thủ Đức, Phường Linh Trung.</span>
                            </li>
                            <li><a href="#"><span class="icon icon-phone"></span><span
                                    class="text">+ 1234 5678 90</span></a></li>
                            <li><a href="#"><span class="icon icon-envelope"></span><span class="text">coffeeBlendNlu@gmail.com</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">

                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                    Coffee Blend. All rights reserved.
                    <!--                    This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a-->
                    <!--                            href="https://colorlib.com" target="_blank">Colorlib</a>-->
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </div>
        </div>
    </div>
</footer>


<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<script src="js/user.js"></script>
<script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
<script>

</script>
<script>

    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        console.log('statusChangeCallback');
        console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            testAPI();
        } else {                                 // Not logged into your webpage or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this webpage.';
        }
    }


    function checkLoginState() {               // Called when a person is finished with the Login Button.
        FB.getLoginStatus(function (response) {   // See the onlogin handler
            statusChangeCallback(response);
        });
    }


    window.fbAsyncInit = function () {
        FB.init({
            appId: '324735758666786',
            cookie: true,                     // Enable cookies to allow the server to access the session.
            xfbml: true,                     // Parse social plugins on this webpage.
            version: ' v7.0'           // Use this Graph API version for this call.
        });


        FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
            statusChangeCallback(response);        // Returns the login status.
        });
    };

    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function (response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
        });
    }

</script>



</body>
</html>