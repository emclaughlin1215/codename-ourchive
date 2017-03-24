class TagSuggestion
  def self.seed
    Tag.find_each do |tag|
      text = tag.text
      type = TagConfig.config[tag.type_key.to_s]['system']
      1.upto(text.length - 1) do |n|
        prefix = text[0, n]
        $redis.zadd "tag-suggestions:#{type}:#{prefix.downcase}", 1, text.downcase
      end
    end
  end
  def self.terms_for(prefix, type)
    tag_type = TagConfig.config[type]['system']
    $redis.zrevrange "tag-suggestions:#{tag_type}:#{prefix.downcase}", 0, 9
  end
  def self.add_tag(tag)
      text = tag.text
      type = TagConfig.config[tag.type_key.to_s]['system']
      1.upto(text.length - 1) do |n|
        prefix = text[0, n]
        $redis.zadd "tag-suggestions:#{type}:#{prefix.downcase}", 1, text.downcase
      end
  end
end
