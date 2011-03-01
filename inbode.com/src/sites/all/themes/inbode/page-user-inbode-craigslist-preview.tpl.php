<style>
body { margin:0;padding:0;}

#t7_craigslist{
	margin: 0;
	padding: 0;
	background: url(http://inbode.ten7i.net/ui/climg/gradient.png) repeat-x #259eb0;
	width:100%;
}

#logo{
	position: absolute;
	top: 8px;
	right: 12px;
}

#t7_white_box_container{
	margin: 0px auto;
	width: 802px;
}

#t7_price{
	float:right;
	margin-right: 30px;
}

#t7_price .contact{
	background: url(http://inbode.ten7i.net/ui/climg/button.jpg) no-repeat;
	height: 24px;
	width: 149px;
	padding: 5px 20px;
	color: #fff;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	margin-top: 10px;
}

#t7_price .contact h3{
	font-weight: normal;
	font-size: 16px;
	margin: 0;
	text-align: center;
	color: #fff;
}

#t7_address{
	float: left;
	margin-left: 10px;
}

#t7_address ul{
	margin: 10px 0px 0px 0;
	padding: 0;
}

#t7_address ul li{
	color: #636363;
	list-style: none;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 13px;
	line-height: 18px;
}

#t7_white_box{
	width: 700px;
	background: url(http://inbode.ten7i.net/ui/climg/white_box_mid.png) repeat-y;
	margin: 0px auto;
	padding: 20px 41px 0px 61px;
	float: left;
}

#t7_white_box_top{
	width: 802px;
	background: url(http://inbode.ten7i.net/ui/climg/white_box_top.png) no-repeat;
	margin-top: 65px;
	padding: 0px;
	height: 29px;
	float: left;
}

#t7_white_box_bot{
	width: 802px;
	background: url(http://inbode.ten7i.net/ui/climg/white_box_bot.png) no-repeat;
	margin: 0px auto;
	padding: 0px;
	height: 29px;
	float: left;
}

#t7_white_box table{
	margin-left: 10px;
	margin-top: 25px;
	margin-bottom: 25px;
}

#t7_white_box table tr {
	margin: 20px 0px 20px 0px;
}

#t7_white_box h1{
	color: #464646;
	font-weight: normal;
	font-size: 24px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	margin: 0;
}


#t7_white_box table h2{
	color: #187987;
	font-weight: bold;
	font-size: 13px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	margin: 0;
	float: left;
	width: 90px;
}

#t7_white_box table p{
	color: #000101;
	font-weight: normal;
	font-size: 12px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	margin: 5px 0px 5px 40px;
	width: 410px;
	float: left;
}

#t7_white_box table ul {
	float: left;
	margin: 0;
	padding: 0;
	width: 100px;
}

#t7_white_box table ul li{
	list-style: none;
	color: #000101;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 12px;
	padding-left: 1em;
	text-indent: -1em;
}

#t7_white_box table ul li:before {
	content: "\002D \0020";
	}

#t7_white_box ul.images {
	border-top: 1px solid #a5a5a5;
	padding: 20px 0px;
	display: block;
	float: left;
	margin: 0;
}

#t7_white_box ul.images li{
	list-style-type: none;
	float: left;
	margin: 0px 10px 15px 10px;
}

#t7_touch #t7_white_box ul.images {
	border-top: 2px solid #a5a5a5;
	padding: 20px 0px;
	display: block;
	float: left;
	margin: 0;
}

#t7_touch #t7_white_box ul.images li{
	margin: 5px 10px 15px 10px;
}

#t7_touch #t7_white_box ul.images li a img{
	border: none;
}

#t7_touch #t7_white_box ul.images li.nav{
	margin: 15px 10px 15px 10px;
}

#t7_touch #t7_white_box ul.images li.details{
	color: #ffffff;
	width: 67px;
	height: 44px;
	padding: 15px;
	background: url(http://inbode.ten7i.net/ui/climg/unit_details.jpg) no-repeat;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	margin: 0px 10px 15px 10px;
}

#t7_touch #t7_white_box ul.images li.details h3{
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 16px;
	margin: 0;
	text-align: center;
}

</style>


<table id="t7_craigslist"><tr><td>
	
	<div id="logo"><img src="http://inbode.ten7i.net/ui/climg/inbode.png" width="172" height="56" /></div>
	
	<div id="t7_white_box_container">
		<div id="t7_white_box_top"></div>
		
		<div id="t7_white_box">
			

		<?php print $content; ?>
			
		
		</div>
		
		<div id="t7_white_box_bot"></div>
	</div>



</td></tr></table>