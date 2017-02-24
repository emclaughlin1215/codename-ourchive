(function() {
  jQuery(function() {
    return $('#multi_chapter').change(function() {
      if (this.checked) {
        $('#chapter_count').show();
      } else {
        $('#chapter_count').hide();
      }
      $('#is_series').change(function() {});
      if (this.checked) {
        return $('#series_id').show();
      } else {
        return $('#series_id').hide();
      }
    });
  });

}).call(this);
