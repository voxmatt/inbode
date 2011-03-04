$(document).ready( function()
{

	$('.t7_swapout:first').fadeIn();
	$('.t7-thumb-image').click(function(){
		var w=$(this).attr('id');
		var f=w.split('-');
		$('.t7_swapout').fadeOut();
		$('#t7-item-'+f[2]).fadeIn();
		
	})

	$('.t7-thumb-image').hover(function(){
		$(this).css('cursor','pointer');
	},
	function(){
		$(this).css('cursor','default');	
	})

	
});