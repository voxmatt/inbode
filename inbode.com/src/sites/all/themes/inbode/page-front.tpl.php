<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>inbode</title>
    <link rel="stylesheet" href="/sites/all/themes/inbode/teaser/css/style.css" />
	<script src="/sites/all/themes/inbode/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="/sites/all/themes/inbode/modernizr-1.7.min.js"></script>
   
<!--[if lt IE 9] -->
	<script src="/sites/all/themes/inbode/IE9.js"></script>
<!-- <![endif]-->

</head>
<!--[if lt IE 7 ]> <body class="ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <body class="ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <body class="ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <body class="not_ie" lang="en"> <!--<![endif]-->

    <div id="header-bg">
    </div>

    <div id="container">
        
        <div id="header" class="clearfix">
        </div>

        <div id="primary" class="clearfix">
		<p id="signup">Be the first to know when we launch</p>
		<!-- Begin MailChimp Signup Form -->
		<script type="text/javascript">
		// delete this script tag and use a "div.mce_inline_error{ XXX !important}" selector
		// or fill this in and it will be inlined when errors are generated
		var mc_custom_error_style = '';
		</script>
		<div id="mc_embed_signup">
		<form action="http://inbode.us2.list-manage2.com/subscribe/post?u=265fb8487aa0a0cd6d110dd39&amp;id=a73a231956" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank">
			<fieldset>

		<div class="mc-field-group">
		<input type="text" value="" name="EMAIL" class="required email" id="mce-EMAIL"><input type="submit" value="subscribe" name="subscribe" id="mc-embedded-subscribe" class="btn">
		</div>
				<div id="mce-responses">
					<div class="response" id="mce-error-response" style="display:none"></div>
					<div class="response" id="mce-success-response" style="display:none"></div>
				</div>
			</fieldset>
		</form>
		</div>
		<script  type="text/javascript">
		try {
		    var jqueryLoaded=jQuery;
		    jqueryLoaded=true;
		} catch(err) {
		    var jqueryLoaded=false;
		}
		if (!jqueryLoaded) {
		    var head= document.getElementsByTagName('head')[0];
		    var script= document.createElement('script');
		    script.type= 'text/javascript';
		    script.src= 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js';
		    head.appendChild(script);    
		}
		</script>
		<script type="text/javascript" src="http://downloads.mailchimp.com/js/jquery.form-n-validate.js"></script>

		<script type="text/javascript">
		var fnames = new Array();var ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';var err_style = '';
		try{
		    err_style = mc_custom_error_style;
		} catch(e){
		    err_style = 'margin: 1em 0 0 0; padding: 1em 0.5em 0.5em 0.5em; background: ERROR_BGCOLOR none repeat scroll 0% 0%; font-weight: bold; float: left; z-index: 1; width: 80%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; color: ERROR_COLOR;';
		}
		var head= document.getElementsByTagName('head')[0];
		var style= document.createElement('style');
		style.type= 'text/css';
		if (style.styleSheet) {
		  style.styleSheet.cssText = '.mce_inline_error {' + err_style + '}';
		} else {
		  style.appendChild(document.createTextNode('.mce_inline_error {' + err_style + '}'));
		}
		head.appendChild(style);
		$(document).ready( function($) {
		  var options = { errorClass: 'mce_inline_error', errorElement: 'div', onkeyup: function(){}, onfocusout:function(){}, onblur:function(){}  };
		  var mce_validator = $("#mc-embedded-subscribe-form").validate(options);
		  options = { url: 'http://inbode.us2.list-manage1.com/subscribe/post-json?u=265fb8487aa0a0cd6d110dd39&id=a73a231956&c=?', type: 'GET', dataType: 'json', contentType: "application/json; charset=utf-8",
		                beforeSubmit: function(){
		                    $('#mce_tmp_error_msg').remove();
		                    $('.datefield','#mc_embed_signup').each(
		                        function(){
		                            var txt = 'filled';
		                            var fields = new Array();
		                            var i = 0;
		                            $(':text', this).each(
		                                function(){
		                                    fields[i] = this;
		                                    i++;
		                                });
		                            $(':hidden', this).each(
		                                function(){
		                                	if ( fields[0].value=='MM' && fields[1].value=='DD' && fields[2].value=='YYYY' ){
		                                		this.value = '';
											} else if ( fields[0].value=='' && fields[1].value=='' && fields[2].value=='' ){
		                                		this.value = '';
											} else {
			                                    this.value = fields[0].value+'/'+fields[1].value+'/'+fields[2].value;
			                                }
		                                });
		                        });
		                    return mce_validator.form();
		                }, 
		                success: mce_success_cb
		            };
		  $('#mc-embedded-subscribe-form').ajaxForm(options);

		});
		function mce_success_cb(resp){
		    $('#mce-success-response').hide();
		    $('#mce-error-response').hide();
		    if (resp.result=="success"){
		        $('#mce-'+resp.result+'-response').show();
		        $('#mce-'+resp.result+'-response').html(resp.msg);
		        $('#mc-embedded-subscribe-form').each(function(){
		            this.reset();
		    	});
		    } else {
		        var index = -1;
		        var msg;
		        try {
		            var parts = resp.msg.split(' - ',2);
		            if (parts[1]==undefined){
		                msg = resp.msg;
		            } else {
		                i = parseInt(parts[0]);
		                if (i.toString() == parts[0]){
		                    index = parts[0];
		                    msg = parts[1];
		                } else {
		                    index = -1;
		                    msg = resp.msg;
		                }
		            }
		        } catch(e){
		            index = -1;
		            msg = resp.msg;
		        }
		        try{
		            if (index== -1){
		                $('#mce-'+resp.result+'-response').show();
		                $('#mce-'+resp.result+'-response').html(msg);            
		            } else {
		                err_id = 'mce_tmp_error_msg';
		                html = '<div id="'+err_id+'" style="'+err_style+'"> '+msg+'</div>';

		                var input_id = '#mc_embed_signup';
		                var f = $(input_id);
		                if (ftypes[index]=='address'){
		                    input_id = '#mce-'+fnames[index]+'-addr1';
		                    f = $(input_id).parent().parent().get(0);
		                } else if (ftypes[index]=='date'){
		                    input_id = '#mce-'+fnames[index]+'-month';
		                    f = $(input_id).parent().parent().get(0);
		                } else {
		                    input_id = '#mce-'+fnames[index];
		                    f = $().parent(input_id).get(0);
		                }
		                if (f){
		                    $(f).append(html);
		                    $(input_id).focus();
		                } else {
		                    $('#mce-'+resp.result+'-response').show();
		                    $('#mce-'+resp.result+'-response').html(msg);
		                }
		            }
		        } catch(e){
		            $('#mce-'+resp.result+'-response').show();
		            $('#mce-'+resp.result+'-response').html(msg);
		        }
		    }
		}
		</script>
		<!-- End mc_embed_signup -->
		<p id="email_disclaimer">(we will <i>never</i> share your email address)
		<div id="links" class="clearfix">
			<div id="blog_link">
				<a href="http://blog.inbode.com/">inbode blog</a>
			</div>
			<div id="facebook_link">
				<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Finbode&amp;width=292&amp;colorscheme=light&amp;show_faces=false&amp;stream=false&amp;header=false&amp;height=62" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:62px;" allowTransparency="true"></iframe>
			</div>
			<div id="twitter_link">
				<a href="http://www.twitter.com/inbode"><img src="http://twitter-badges.s3.amazonaws.com/follow_me-a.png" alt="Follow inbode on Twitter"/></a>
    		</div>
        </div> <!-- secondary -->

        <div id="footer" class="clearfix">
            <p id="copyright">&copy; 2011 inbode inc.</p>
        </div>

        <div class="clearfix"></div>

    </div> <!-- container -->
    
</body>
</html>