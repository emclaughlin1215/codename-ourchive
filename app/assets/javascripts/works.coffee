# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#multi_chapter').change ->
  		if (this.checked)
        	$('#chapter_count').show() 
        	$('#chapter_textbox').show()
        	$('#work_textbox').hide()
    	else
        	$('#chapter_count').hide()
        	$('#chapter_textbox').hide()
        	$('#work_textbox').show()
jQuery ->
	$('#is_series').change ->
  		if (this.checked)
        	$('#series_id').show() 
    	else
        	$('#series_id').hide()
jQuery ->
	$('#work_type').change ->
  		work_type = $('#work_type :selected').text()
  		if work_type == 'Fanfic'
      		$('#fanfic_form').show() 
    	else
      		$('#fanfic_form').hide() 
jQuery ->
	$('#in_collection').change ->
  		if (this.checked)
        	$('#collection_id').show() 
    	else
        	$('#collection_id').hide()
