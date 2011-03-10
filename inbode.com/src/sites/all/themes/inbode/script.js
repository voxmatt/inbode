$(document).ready(function() {



/* 	WHY DOESN'T THIS WORK??? */
	$('table.swfupload').wrap('<div class="table_wrap"></div>');
    
    // -- CHANGES BGCOLOR OF STATUS ACCORDING TO SELECTED -- //
    $('#edit-field-unit-status-value-wrapper').addClass('listed');
    $('#edit-field-unit-status-value-wrapper select').change(function() {
    	$(this).parent().removeClass('listed');
    	$(this).parent().removeClass('rented');
    	$(this).parent().removeClass('inactive');
        $(this).parent().addClass($('#edit-field-unit-status-value-wrapper option:selected').val());
    });


	/* activates iframe shtuff */
	$('#t7_bldng_add_header').click(function(){
		$(this).hide();
		$('#t7_bldng_icontain').fadeIn();	
	});
	

	$('#t7_unit_add_header').click(function(){
		$(this).hide();
		$('#t7_unit_icontain').fadeIn();
	});


    //	-------------	//
    //	ADD UNIT FORM	//
    //	--------------	//
    // SETTING FORM VALUES
    $('.unit-entry #edit-title').val('Unit Number');
    $('.unit-entry #edit-field-unit-price-0-amount').val('Price');
    $('.unit-entry #edit-field-unit-area-0-value').val('Sq. Ft.');
    $('.unit-entry #edit-field-unit-description-0-value').val('Unit Description');
    // ON FOCUS TAKE OUT DEFAULT VALUE
    $('.unit-entry .form-text, .unit-entry .form-textarea').focus(function() {

        if ($(this).val() === 'Unit Number' || $(this).val() === 'Price' || $(this).val() === '0.00' || $(this).val() === 'Sq. Ft.' || $(this).val() === '0' || $(this).val() === 'Unit Description') {

            $(this).val('');

        }


    });
    //ON BLUR, IF FIELD IS EMPTY PUT DEFAULT VALUE BACK IN
    $('.unit-entry .form-text, .unit-entry .form-textarea').blur(function() {

        if ($(this).val() === '') {

            switch ($(this).attr('id')) {

            case 'edit-title':
                $(this).val('Unit Number');
                break;

            case 'edit-field-unit-price-0-amount':
                $(this).val('Price');
                break;

            case 'edit-field-unit-area-0-value':
                $(this).val('Sq. Ft.');
                break;

            case 'edit-field-unit-description-0-value':
                $(this).val('Unit Description');
                break;
            }
        }
    });



    //	-----------------	//
    //						//
    //	ADD BUILDING FORM	//
    //						//
    //	-----------------	//
    // SETTING FORM VALUES
    $('.building-entry #edit-title').val('Building Number');
    $('.building-entry #').val('Street');
    $('.building-entry #').val('City');
    $('.building-entry #').val('State');
    $('.building-entry #').val('Zip');
    $('.building-entry #').val('Building Description');

    // ON FOCUS TAKE OUT DEFAULT VALUE
    $('.building-entry .form-text, .building-entry .form-textarea').focus(function() {

        if ($(this).val() === 'Building Number' || $(this).val() === 'Street' || $(this).val() === 'City' || $(this).val() === 'State' || $(this).val() === 'Zip' || $(this).val() === 'Building Description') {

            $(this).val('');

        }


    });
    //ON BLUR, IF FIELD IS EMPTY PUT DEFAULT VALUE BACK IN
    $('.building-entry .form-text, .building-entry .form-textarea').blur(function() {

        if ($(this).val() === '') {

            switch ($(this).attr('id')) {

            case 'edit-title':
                $(this).val('Building Number');
                break;

            case 'edit-field-building-address-0-street':
                $(this).val('Street');
                break;

            case 'edit-field-building-address-0-city':
                $(this).val('City');
                break;

            case 'edit-field-building-address-0-province':
                $(this).val('State');
                break;

            case 'edit-field-building-address-0-postal-code':
                $(this).val('Zip');
                break;

            case 'edit-field-building-description-0-value':
                $(this).val('Building Description');
                break;


            }
        }
    });



});
