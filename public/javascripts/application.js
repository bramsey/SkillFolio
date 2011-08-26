$('#container').delegate('.met_check', 'click', function () {
	var checked = this.checked;
	var checkboxes = $(this).closest('.skill').find(':checkbox');
	var this_index = jQuery.inArray(this, checkboxes);
	checkboxes.each(function(index, value){
		if( checked ){
			if( index <= this_index) { value.checked = checked; };
		} else {
			if( index > this_index) { value.checked = checked; };
		}
	});
});


$('form a.add_nested_fields').live('click', function () {
	if ($(this).attr('data-association') === 'levels'){
		siblings = $(this).siblings('.fields:visible');
		if(siblings.length >= 3){
			$(this).hide();
		}
	} 
});

$('form').live('nested:fieldAdded', function (event) {
	
	if (event.association === 'skills'){
		$(this).children('.fields').last().find('.add_nested_fields').trigger('click');
		$(this).children('.fields').last().find('.add_nested_fields').trigger('click');
	}
});

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