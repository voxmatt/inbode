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

		<!-- Mr. Main Container! -->
		<div id="t7_container">

			<?php if ($header): ?>
			<!-- header -->
			<div id="t7_header">
				<?php print $header; ?>
			</div>
			<?php endif; ?>


			<?php if ($content_top): ?>
			<!-- top content container -->
			<div id="t7_content_top">
				<?php print $content_top; ?>
			</div> 
			<?php endif; ?>


			<?php if ($left): ?>
			<!-- left navigation -->
			<div id="t7_nav_left">
				<?php print $left; ?>
			</div>
			<?php endif; ?>
					
			<!-- main content -->
			<div id="t7_content">

				<?php if ($title): ?>
					<h1><?php print $title; ?></h1>
				<?php endif; ?>

				<?php if ($messages): ?>				
					<?php print $messages; ?>
				<?php endif; ?>

				<?php if ($tabs): ?>
					<div class="tabs"><?php print $tabs; ?></div>
				<?php endif; ?>
				
				<?php if ($help): ?>				
					<?php print $help; ?>
				<?php endif; ?>

				<?php if ($breadcrumb): ?>
					<?php print $breadcrumb; ?>
				<?php endif; ?>

				<?php print $content; ?>
			</div> 

			<?php if ($right): ?>
			<!-- right navigation -->
			<div id="t7_nav_right">
				<?php print $right; ?>
			</div>
			<?php endif; ?>
			


			<?php if ($content_bottom): ?>
			<!-- bottom content container -->
			<div id="t7_content_bottom">
				<?php print $content_bottom; ?>
			</div> 
			<?php endif; ?>
			

			<?php if ($footer): ?>
			<!-- footer -->
			<div id="t7_footer">
				<?php print $footer; ?>

				<?php if ($footer_message): ?>
					<p><?php print $footer_message; ?></p>
				<?php endif; ?>
						
			</div> 
			<?php endif; ?>			
			
			
			<div id="t7_extender"></div>


		</div>


		<?php print $closure; ?>

	</body>
	
</html>
