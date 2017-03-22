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
      work_type = $('#work_type :selected').text();
      if (work_type === 'Fanfic') {
        return $('#fanfic_form').show();
      } else {
        return $('#fanfic_form').hide();
      }
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
    return $('#fandom_tags_filter').autocomplete({
      appendTo: '#new_work_creation_form',
      source: '/tag_suggestions/?type=0'
    });
  });

  jQuery(function() {
    return $('#character_tags_filter').autocomplete({
      appendTo: '#new_work_creation_form',
      source: '/tag_suggestions/?type=1'
    });
  });

}).call(this);
