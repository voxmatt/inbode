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
	<body>



		<!-- main content container -->
		<div id="t7_container" class="building-entry">
				<?php if ($messages): ?>				
					<?php print $messages; ?>
				<?php endif; ?>

		  <div id="t7_add_contain">
			<!-- main content -->
			<div id="t7_content">



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

			
		  </div><!-- .t7_add_contain END -->

		</div>

	</body>
	
</html>
