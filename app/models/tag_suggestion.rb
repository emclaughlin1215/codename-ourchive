class TagSuggestion
  def self.seed
    Tag.find_each do |tag|
      text = tag.text
      1.upto(text.length - 1) do |n|
        prefix = text[0, n]
        $redis.zadd "tag-suggestions:#{prefix.downcase}", 1, text.downcase
      end
    end
  end
  def self.terms_for(prefix)
    $redis.zrevrange "tag-suggestions:#{prefix.downcase}", 0, 9
  end
end
