# Place all the behaviors and hooks related to the matching controller here.
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
jQuery ->
       $('#fandom_tags_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=0'
jQuery ->
       $('#character_tags_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=1'
jQuery ->
       $('#primary_pairing_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=2'
jQuery ->
       $('#secondary_pairing_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=3'
jQuery ->
       $('#theme_filter').autocomplete
           appendTo: '#new_work_creation_form',
           source: '/tag_suggestions/?type=4'
