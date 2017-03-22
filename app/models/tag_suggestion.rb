class TagSuggestion
  def self.seed
    Tag.find_each do |tag|
      text = tag.text
      if tag.is_fandom
        type = 'fandom'
      elsif tag.is_character
        type = 'character'
      elsif tag.is_primary_pairing
        type = 'primary_pairing'
      elsif tag.is_secondary_pairing
        type = 'secondary_pairing'
      else
        type = 'other'
      end 
      1.upto(text.length - 1) do |n|
        prefix = text[0, n]
        $redis.zadd "tag-suggestions:#{type}:#{prefix.downcase}", 1, text.downcase
      end
    end
  end
  def self.terms_for(prefix, type)
    $redis.zrevrange "tag-suggestions:#{type}:#{prefix.downcase}", 0, 9
  end
end
