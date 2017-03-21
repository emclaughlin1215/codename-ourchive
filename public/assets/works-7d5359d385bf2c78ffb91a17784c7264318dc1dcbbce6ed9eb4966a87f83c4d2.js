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

}).call(this);
