(function() {
  jQuery(function() {
    return $('#multi_chapter').change(function() {
      if (this.checked) {
        return $('#chapter_count').show();
      } else {
        return $('#chapter_count').hide();
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
      return console.log(work_type);
    });
  });

}).call(this);
