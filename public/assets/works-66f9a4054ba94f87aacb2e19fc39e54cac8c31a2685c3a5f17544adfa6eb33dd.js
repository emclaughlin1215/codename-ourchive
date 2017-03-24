/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#multi_chapter').change ->
  		if (this.checked)
        	  $('#chapter_count').show()
        	  $('#multi_chapter_buttons').show() 
        	  $('#chapter_textbox').show()
        	  $('#work_textbox').hide()
    		else
        	  $('#chapter_count').hide()
        	  $('#chapter_textbox').hide()
        	  $('#work_textbox').show()
        	  $('#multi_chapter_buttons').hide()
		return
jQuery ->
	$('#is_series').change ->
  		if (this.checked)
        	  $('#series_id').show() 
    		else
        	  $('#series_id').hide()
		return
jQuery ->
	$('#work_type').change ->
		work_type = $('#work_type :selected').val()	
		if (work_type == '1')
			$('#1_form').show()
		else
			$('#1_form').hide() 
		return
jQuery ->
	$('#in_collection').change ->
  		if (this.checked)
        	$('#collection_id').show() 
    	else
        	$('#collection_id').hide()*/

//<script type="text/javascript">
    $(function() {

 // Below is the name of the textfield that will be autocomplete    
    $('#0_tags_filter').autocomplete({
	    appendTo: '#new_work_creation_form',
            source: '/tag_suggestions/?type=0',
            select: function(event, ui) {
                alert("hi");
		return false;
	    }
    })
});
/*jQuery ->
	$('#0_tags_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=0',
	   select: (event, ui) ->
	     event.preventDefault()
	     return
	return*/
/*jQuery ->
       $('#1_tags_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=1'
jQuery ->
       $('#2_tags_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=2'
jQuery ->
       $('#3_tags_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=3'
jQuery ->
       $('#4_tags_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=4' */
