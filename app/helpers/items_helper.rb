module ItemsHelper
  include ActsAsTaggableOn::TagsHelper

  def tags_to_json
    category = Item.find(0).tag_list
    result = []
    Hash[(0...category.size).zip category].each do |k,v|
      result.push Hash[:id =>v, :text => v]
    end
    result.to_json
  end
end
