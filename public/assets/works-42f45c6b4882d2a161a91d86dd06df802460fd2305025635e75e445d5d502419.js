(function() {
  jQuery(function() {
    return $('#multi_chapter').change(function() {
      if (this.checked) {
        $('#chapter_count').show();
        $('#multi_chapter_buttons').show();
        $('#chapter_textbox').show();
        return $('#work_textbox').hide();
      } else {
        $('#chapter_count').hide();
        $('#chapter_textbox').hide();
        $('#work_textbox').show();
        return $('#multi_chapter_buttons').hide();
      }
    });
  });

  jQuery(function() {
    return $('#is_series').change(function() {
      if (this.checked) {
        return $('#series_id').show();
      } else {
        return $('#series_id').hide();
      }
    });
  });

  jQuery(function() {
    return $('#work_type').change(function() {
      var work_type;
      work_type = $('#work_type :selected').val();
      alert(work_type);
      return $('#1_form').show();
    });
  });

  jQuery(function() {
    return $('#in_collection').change(function() {
      if (this.checked) {
        return $('#collection_id').show();
      } else {
        return $('#collection_id').hide();
      }
    });
  });

  jQuery(function() {
    return $('#0_tags_filter').autocomplete({
      appendTo: '#new_work_creation_form',
      source: '/tag_suggestions/?type=0'
    });
  });

  jQuery(function() {
    return $('#1_tags_filter').autocomplete({
      appendTo: '#new_work_creation_form',
      source: '/tag_suggestions/?type=1'
    });
  });

  jQuery(function() {
    return $('#2_tags_filter').autocomplete({
      appendTo: '#new_work_creation_form',
      source: '/tag_suggestions/?type=2'
    });
  });

  jQuery(function() {
    return $('#3_tags_filter').autocomplete({
      appendTo: '#new_work_creation_form',
      source: '/tag_suggestions/?type=3'
    });
  });

  jQuery(function() {
    return $('#4_tags_filter').autocomplete({
      appendTo: '#new_work_creation_form',
      source: '/tag_suggestions/?type=4'
    });
  });

}).call(this);
