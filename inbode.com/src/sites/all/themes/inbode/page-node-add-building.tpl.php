<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language; ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>">
<!-- 

         _       __              __   
        (_)___  / /_  ____  ____/ /__ 
       / / __ \/ __ \/ __ \/ __  / _ \
      / / / / / /_/ / /_/ / /_/ /  __/
     /_/_/ /_/_.___/\____/\__,_/\___/ 

     inbode.com is made in America
     by the people of ten7i.com
       ______          ______                      
      /_  __/___  ____/__  (_) _________  ____ ___ 
       / /  / _ \/ __ \ / / / / ___/ __ \/ __ `__ \
      / /  /  __/ / / // / /_/ /__/ /_/ / / / / / /
     /_/   \___/_/ /_//_/_/(_)___/\____/_/ /_/ /_/ 


 -->
 
 	<head>

		<meta name="author" content="Inbode Inc." />
		<title><?php print $head_title; ?></title>
		<?php print $head; ?>
		<?php print $styles; ?>
		<?php print $scripts; ?>
	</head>
<!--[if lt IE 7 ]> <body class="ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <body class="ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <body class="ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <body class="not_ie" lang="en"> <!--<![endif]-->
	
		<?php
		
			global $user;
			// the logo should point to the user's home page if logged in
			$homelink="/";
			if ($user->roles[2]) {
				$homelink="/user/".$user->uid."/inbode";	
			}
		
		?>

		<!-- header -->
		<div id="t7_header_wrap">
  		<div id="t7_header">
  		  <div id="t7_inbode_logo"><a href="<?php print $homelink; ?>"><img src="/<?php echo path_to_theme(); ?>/images/inbode-logo.png" border="0" width="230" height="79" alt="inbode" title="inbode" /></a></div>
  		  <div id="t7_greeting"><?php print $header; ?></div>  			
  		</div>
		</div>


		<!-- main content container -->
		<div id="t7_container" class="building-entry">


			<!-- main content -->
			<div id="t7_content">

				<?php if ($messages): ?>				
					<?php print $messages; ?>
				<?php endif; ?>

				<?php
				
				// only show tabs if you have the admin role or you're user=1 (super admin)
				if ($tabs) {
					if ($user->uid==1 || isset($user->roles[3])) {
						print "<div class=\"tabs\">$tabs</div>";				
					}
				}

				?>
				
								
				<?php if ($help): ?>				
					<?php print $help; ?>
				<?php endif; ?>

				<?php print $content; ?>

			</div> 

			<!-- footer -->
			<div id="t7_footer">
				<?php print $footer; ?>

				<?php if ($footer_message): ?>
					<p><?php print $footer_message; ?></p>
				<?php endif; ?>
						
			</div> 
			
			

		</div>


		<?php print $closure; ?>

	</body>
	
</html>
