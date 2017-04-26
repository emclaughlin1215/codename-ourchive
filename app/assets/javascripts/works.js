function remove_work_tag(tag) {
    $(tag).remove();
}

function add_chapter_first_click() {
  $('#chapter_count').show();
  $('#multi_chapter_buttons').show();
  var work_type;
  work_type = $('#work_creation_form_work_type :selected').val();
  if (work_type == '1'){
    $('#work_text_label').hide();
    $('#chapter_text_label').show();
  }
  else {
    $('#chapter_external_label').show();
    $('#work_external_label').hide();
  }
}
function removetag(e)
{
  var target = $(event.target).parent().parent();
  remove_work_tag(target);
  var id = $(target).attr('id');
  var hiddenTag = $('#tags_to_remove').val();
  if (hiddenTag != '') {
    $('#tags_to_remove').val(hiddenTag + "," + id);
  }
  else {
    $('#tags_to_remove').val(id);
  }
}
function create_work_tag(val, item, hiddenItem, inputItem, tag_type) {
  alert(val);
  var tag = $('<li class="tag_li"><span>'+val+'</span></li>');
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
    $(hiddenItem).val(hiddenTag + "," + val+",," + tag_type);
  }
  else {
    $(hiddenItem).val(val);
  }
}

$(document).ready(function() {  
  var work_type;
    work_type = $('#work_creation_form_work_type :selected').val();
    if (work_type == '1'){
      $('#work_text_label').show();
      $('#body_text_field').show();
    }

    else{
      $('#work_text_label').hide();
      $('#body_text_field').hide();
      $('#work_external_label').show();
      $('#body_external_field').show();
    }
  $('#add_chapter_link').one('click', function() {
    add_chapter_first_click();
  });

  $('#is_series').change(function(){
      if ($(this).is(":checked")) {
        $('#series_id').show() 
      } else {
        $('#series_id').hide()
      }
  });

  $('#work_creation_form_work_type').change(function() {
    $('#new_chapters').empty();
    $('#add_chapter_link').one('click', function() {
      add_chapter_first_click();
    });
    var work_type;
    work_type = $('#work_creation_form_work_type :selected').val();
    if (work_type == '1'){
      $('#work_text_label').show();
      $('#body_text_field').show();
      $('#work_external_label').hide();
      $('#body_external_field').hide();
      $('#chapter_external_label').hide();
    }

    else{
      $('#work_text_label').hide();
      $('#chapter_text_label').hide();
      $('#body_text_field').hide();
      $('#work_external_label').show();
      $('#body_external_field').show();
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
      create_work_tag(ui.item.label, "#0_tags_div ul", "#0_tags_hidden", inputItem);
      return false;
    }
  });

  $( ".new_textBox" ).keypress(function( event ) {
    var characterPressed = String.fromCharCode(event.which);
    if (characterPressed == ',') {
      var tmpVal = $(event.target);
      if (tmpVal.val() != '') {
        var oldVal = tmpVal.val();
        tmpVal.val('');
        var id = event.target.id.charAt(0);
        create_work_tag(oldVal, "#"+id+"_tags_div ul", "#"+id+"_tags_hidden", $(event.target));
        event.preventDefault();
      }
    }
  });

  $('#1_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=1',
    select: function(event, ui) {
      $('#1_tags_filter').val('');
      create_work_tag(ui.item.label, "#1_tags_div ul", "#1_tags_hidden", $('#1_tags_filter'));
      return false;
    }
  });

  $( "#1_tags_filter" ).keypress(function( e ) {
    var characterPressed = String.fromCharCode(e.which);
    if (characterPressed == ',') {
      var tmpVal = $('#1_tags_filter').val();
      if (tmpVal != '') {
        $('#1_tags_filter').val('');
        create_work_tag(tmpVal, "#1_tags_div ul", "#1_tags_hidden", $('#1_tags_filter'));
        e.preventDefault();
      }
    }
  });

  $('#2_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=2',
    select: function(event, ui) {
      $('#2_tags_filter').val('');
      create_work_tag(ui.item.label, "#2_tags_div ul", "#2_tags_hidden", $('#2_tags_filter'));
      return false;
    }
  });
  
  $( "#2_tags_filter" ).keypress(function( e ) {
    var characterPressed = String.fromCharCode(e.which);
    if (characterPressed == ',') {
      var tmpVal = $('#2_tags_filter').val();
      if (tmpVal != '') {
        $('#2_tags_filter').val('');
        create_work_tag(tmpVal, "#2_tags_div ul", "#2_tags_hidden", $('#2_tags_filter'));
        e.preventDefault();
      }
    }
  });
  $('#3_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=3',
    select: function(event, ui) {
      $('#3_tags_filter').val('');
      create_work_tag(ui.item.label, "#3_tags_div ul", "#3_tags_hidden", $("#3_tags_filter"));
      return false;
    }
  });
  $( "#3_tags_filter" ).keypress(function( e ) {
    var characterPressed = String.fromCharCode(e.which);
    if (characterPressed == ',') {
      var tmpVal = $('#3_tags_filter').val();
      if (tmpVal != '') {
        $('#3_tags_filter').val('');
        create_work_tag(tmpVal, "#3_tags_div ul", "#3_tags_hidden", $('#3_tags_filter'));
        e.preventDefault();
      }
    }
  });
  $('#4_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=4',
    select: function(event, ui) {
      $('#4_tags_filter').val('');
      create_work_tag(ui.item.label, "#4_tags_div ul", "#4_tags_hidden", $('#4_tags_filter'));
      return false;
    }
  });
  $( "#4_tags_filter" ).keypress(function( e ) {
    var characterPressed = String.fromCharCode(e.which);
    if (characterPressed == ',') {
      var tmpVal = $('#4_tags_filter').val();
      if (tmpVal != '') {
        $('#4_tags_filter').val('');
        create_work_tag(tmpVal, "#4_tags_div ul", "#4_tags_hidden", $('#4_tags_filter'));
        e.preventDefault();
      }
    }
  });
});
