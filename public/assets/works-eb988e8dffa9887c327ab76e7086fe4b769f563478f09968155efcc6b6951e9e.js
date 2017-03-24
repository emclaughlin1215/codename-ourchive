$(document).on("page:change", function() {  
  $('#multi_chapter').change(function(){
      if ($(this).is(":checked")){ 
        $('#chapter_count').show()
        $('#multi_chapter_buttons').show() 
        $('#chapter_textbox').show()
        $('#work_textbox').hide()
      } else {
        $('#chapter_count').hide()
        $('#chapter_textbox').hide()
        $('#work_textbox').show()
        $('#multi_chapter_buttons').hide()
      }
  });

  $('#is_series').change(function(){
      if ($(this).is(":checked")) {
        $('#series_id').show() 
      } else {
        $('#series_id').hide()
      }
  });

$('#work_type').change(function() {
  var work_type;

  work_type = $('#work_type :selected').val();
  if (work_type == '1'){
    $('#1_form').show();
  }
          
  else{
    $('#1_form').hide() 
  }
});
  $('#in_collection').change(function(){
      if ($(this).is(":checked")) {
        $('#collection_id').show()  
      } else {
        $('#collection_id').hide()
      }
  }); 

  $('#0_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=0',
    select: function(event, ui) {
      $('#0_tags_filter').val(ui.item.label);
      return false;
    }
  });

  $('#1_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=1',
    select: function(event, ui) {
      $('#1_tags_filter').val(ui.item.label);
      $("#1_tags_div ul").append('<li>'+ ui.item.label + '</li>');
      return false;
    }
  });

  $('#2_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=2',
    select: function(event, ui) {
      $('#2_tags_filter').val(ui.item.label);
      return false;
    }
  });

  $('#3_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=3',
    select: function(event, ui) {
      $('#3_tags_filter').val(ui.item.label);
      return false;
    }
  });

  $('#4_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=4',
    select: function(event, ui) {
      $('#4_tags_filter').val(ui.item.label);
      return false;
    }
  });
});
