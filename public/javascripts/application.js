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