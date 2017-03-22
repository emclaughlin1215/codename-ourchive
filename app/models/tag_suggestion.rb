class TagSuggestion
  def self.seed
    Tag.find_each do |tag|
      text = tag.text
      if tag.type_key == 0
        type = 'fandom'
      elsif tag.type_key == 1
        type = 'character'
      elsif tag.type_key == 2
        type = 'primary_pairing'
      elsif tag.type_key == 3
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
    tag_type = get_tag_string(type)
    $redis.zrevrange "tag-suggestions:#{tag_type}:#{prefix.downcase}", 0, 9
  end
  def self.get_tag_string(type_key)
    if type_key == '0'
        type = 'fandom'
      elsif type_key == '1'
        type = 'character'
      elsif type_key == '2'
        type = 'primary_pairing'
      elsif type_key == '3'
        type = 'secondary_pairing'
      else
        type = 'other'
      end
      return type
  end
  def self.add_tag(tag)
      text = tag.text
      if tag.type_key == '0'
        type = 'fandom'
      elsif tag.type_key == '1'
        type = 'character'
      elsif tag.type_key == '2'
        type = 'primary_pairing'
      elsif tag.type_key == '3'
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
