function remove_work_tag(tag) {
    $(tag).remove();
}

function create_work_tag(val, item, hiddenItem, inputItem) {
  var tag = $('<li id="tag_li"><span>'+val+'</span></li>');
  var removeTag = $('<a class="close_icon_link"><span class="close_icon">\xd7</span></a>')
    .click(function(e) {
      remove_work_tag(tag);
    });
  tag.append(removeTag);
  inputItem.detach();
  $(item).append(tag);
  $(item).append(inputItem);
  inputItem.focus();
  var hiddenTag = $(hiddenItem).val();
  if (hiddenTag != '') {
    $(hiddenItem).val(hiddenTag + "," + val);
  }
  else {
    $(hiddenItem).val(val);
  }
}

$(document).ready(function() {  
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
      $('#0_tags_filter').val('');
      var inputItem = $('#0_tags_filter');
      console.log(inputItem);
      create_work_tag(ui.item.label, "#0_tags_div ul", "#0_tags_hidden", inputItem);
      return false;
    }
  });

  $( "#0_tags_filter" ).keypress(function( e ) {
    var characterPressed = String.fromCharCode(e.which);
    if (characterPressed == ',') {
      var tmpVal = $('#0_tags_filter').val();
      if (tmpVal != '') {
        $('#0_tags_filter').val('');
        create_work_tag(tmpVal, "#0_tags_div ul", "#0_tags_hidden", $('#0_tags_filter'));
        e.preventDefault();
      }
    }
  });

  $('#1_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=1',
    select: function(event, ui) {
      $('#1_tags_filter').val('');
      $("#1_tags_div ul").append('<li>'+ ui.item.label + '</li>');
      return false;
    }
  });

  $('#2_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=2',
    select: function(event, ui) {
      $('#2_tags_filter').val('');
      $("#2_tags_div ul").append('<li>'+ ui.item.label + '</li>');
      return false;
    }
  });

  $('#3_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=3',
    select: function(event, ui) {
      $('#3_tags_filter').val('');
      $("#3_tags_div ul").append('<li>'+ ui.item.label + '</li>');
      return false;
    }
  });

  $('#4_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=4',
    select: function(event, ui) {
      $('#4_tags_filter').val('');
      $("#4_tags_div ul").append('<li>'+ ui.item.label + '</li>');
      return false;
    }
  });

});
