/**
 * Specifies select behavior for levels.
 */
$('#container').delegate('.met_check', 'click', function () {
	var checked = this.checked;
	var checkboxes = $(this).closest('.skill').find(':checkbox');
	var this_index = jQuery.inArray(this, checkboxes);
	checkboxes.each(function(index, value){
		if( checked ){
			// Checks all boxes lower than the checked box.
			if( index <= this_index) { value.checked = checked; };
		} else {
			// Unchecks all boxes higher than the unchecked box.
			if( index > this_index) { value.checked = checked; };
		}
	});
});

$('#flash').live('click', function() {
  	$('#flash').slideUp('fast');
});

/**
 * Handles collapsing of slideable divs.
 */
$('#container').delegate('.slide-toggle', 'click', function () {
	//$(this).parents('.area').children('.matrix').toggle('fast');
	$(this).closest('div').find('.slideable').first().slideToggle('fast');
	return false;
});

/**
 * Ensures the 'add level' link disappears when the fourth level is added. 
 */
$('form a.add_nested_fields').live('click', function () {
	if ($(this).attr('data-association') === 'levels'){
		siblings = $(this).siblings('.fields:visible');
		if(siblings.length >= 3){
			$(this).hide();
		}
	} 
});

/**
 * Adds four levels when a new skill is added. 
 */
$('form').live('nested:fieldAdded', function (event) {
	
	if (event.association === 'skills'){
		$(this).children('.fields').last().find('.add_nested_fields').trigger('click');
		$(this).children('.fields').last().find('.add_nested_fields').trigger('click');
		$(this).children('.fields').last().find('.add_nested_fields').trigger('click');
		$(this).children('.fields').last().find('.add_nested_fields').trigger('click');
	}
});

/**
 * Ensures the 'add level' link appears when the number of levels drops below four. 
 */
$('form a.remove_nested_fields').live('click', function () {
	siblings = $(this).parentsUntil('.skill').children('.fields:visible');
	if(siblings.length <= 4){
		$(this).closest('.skill').children('.add_nested_fields').show();
	}
});

$(document).ready(function() {
    var fields = $('.skill').children('.add_nested_fields');

	if (fields.length > 0) {
		
		fields.each(function(){
			siblings = $(this).siblings('.fields');
			if(siblings.length >= 3){
				$(this).hide();
			} else {
				$(this).show();
			}
		});
	}
});