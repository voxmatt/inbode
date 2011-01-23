<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language; ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>">
  <!--
  
  
  
  



      Digitally crafted using perfect pixels
      with some bits and bytes by wunderkids
      at Ten Seven Interactive. Shaa-zaaamm!

     ______          _____                    
    /_  __/__  ____ / ___/___ _   _____  ____ 
     / / / _ \/ __ \\__ \/ _ \ | / / _ \/ __ \
    / / /  __/ / / /__/ /  __/ |/ /  __/ / / /
   /_/  \___/_/ /_/____/\___/|___/\___/_/ /_/ 


          http://ten7i.com/shaa-zaaamm
                   1256732626




  
  
  
  
  
  -->	
	<head>

		<meta name="author" content="Ten Seven, Interactive. LLC -- http://www.tenseveninteractive.com/" />
		<title><?php print $head_title; ?></title>
		<?php print $head; ?>
		<?php print $styles; ?>
		<?php print $scripts; ?>

	</head>
	<body>
	
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
		<div id="t7_container">


			<!-- main content -->
			<div id="t7_content">

				<?php if ($messages): ?>				
					<?php print $messages; ?>
				<?php endif; ?>

				<?php
				
				// only show tabs if you have the admin role or you're user=1 (super admin)
				if ($tabs) {
					if ($user->uid==1 || $user->roles[3]) {
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
