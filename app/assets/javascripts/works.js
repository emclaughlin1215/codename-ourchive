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
  var target = $(e.target).parent().parent();
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
    $(hiddenItem).val(hiddenTag + "," + val+"~" + tag_type);
  }
  else {
    $(hiddenItem).val(val+"~"+tag_type);
  }
}

$(document).ready(function() {  
  var work_type;
    work_type = $('#work_creation_form_work_type :selected').val();
    if (work_type == '1'){
      $('#work_text_label').show();
      $('#body_text_field').show();
      $('#work_image_label').hide();
      $('#body_image_field').hide();
    }

    else{
      $('#work_text_label').hide();
      $('#chapter_text_label').hide();
      $('#body_text_field').hide();
      $('#work_image_label').show();
      $('#body_image_field').show();
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
      $('#work_image_label').hide();
      $('#body_image_field').hide();
    }

    else{
      $('#work_text_label').hide();
      $('#chapter_text_label').hide();
      $('#body_text_field').hide();
      $('#work_image_label').show();
      $('#body_image_field').show();
    }    
  });
  $('#in_collection').change(function(){
      if ($(this).is(":checked")) {
        $('#collection_id').show()  
      } else {
        $('#collection_id').hide()
      }
  }); 

   $('#1_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=1',
    select: function(event, ui) {
      $('#1_tags_filter').val('');
      create_work_tag(ui.item.label, "#1_tags_div ul", "#tags_to_add", $('#1_tags_filter'), 1);
      return false;
    }
  });

   $('#0_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=0',
    select: function(event, ui) {
      $('#0_tags_filter').val('');
      create_work_tag(ui.item.label, "#0_tags_div ul", "#tags_to_add", $('#0_tags_filter'), 0);
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
        create_work_tag(oldVal, "#"+id+"_tags_div ul", "#tags_to_add", $(event.target), id);
        event.preventDefault();
      }
    }
  });


  $('#2_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=2',
    select: function(event, ui) {
      $('#2_tags_filter').val('');
      create_work_tag(ui.item.label, "#2_tags_div ul", "#tags_to_add", $('#2_tags_filter'), 2);
      return false;
    }
  });
  
  $('#3_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=3',
    select: function(event, ui) {
      $('#3_tags_filter').val('');
      create_work_tag(ui.item.label, "#3_tags_div ul", "#tags_to_add", $("#3_tags_filter"), 3);
      return false;
    }
  });
  $('#4_tags_filter').autocomplete({
    appendTo: '#new_work_creation_form',
    source: '/tag_suggestions/?type=4',
    select: function(event, ui) {
      $('#4_tags_filter').val('');
      create_work_tag(ui.item.label, "#4_tags_div ul", "#tags_to_add", $('#4_tags_filter'), 4);
      return false;
    }
  });

  $(".btn").mouseup(function(){
    $(this).blur();
  });

  $('.edit_chapter_link').click(function (event){
    var id = event.target.id.split("_").pop();
    $('#edit_partial_'+id).toggle();
  });

  $('#save-chapter-nums').click(function(event) {
    var numbers = document.querySelectorAll('.chapter-number');
    var updatedNumbers = document.querySelectorAll('.body-numbers');
    var index;
    for(index = 0; index < numbers.length; ++index)
    {
      numbers[index].innerHTML = updatedNumbers[index].value;
    }
  });

  $('.body-images').change(function (event){
    var id = event.target.id.split("_").pop();
    $('#stub_image_'+id).val("changed");
  });

  $('.body-audios').change(function (event){
    var id = event.target.id.split("_").pop();
    $('#stub_audio_'+id).val("changed");
  });
});
