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

}).call(this);
