/*
$(document).ready( function()
{

	$('#t7_searchfield').bind('keypress', function(e) {
    if(e.keyCode==13){
      ten7.search.submit();
    }
	});
	
	$('#t7_searchsubmit').bind('click', function() {
    ten7.search.submit();
	});
	
		
});

ten7 = {};


ten7.search =
{
	submit: function()
	{
		var domain = document.URL.split("/");
		window.location = "http://" + domain[2] + "/search/node/" + $('#search').val() ;
	}
};

*/
