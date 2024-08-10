module ClothingIndexHelper
  def clothing_index(constitution_id)
    clothing_index_tag = []
    clothing_index_tag << clothing_image_tag(constitution_id)
    clothing_index_tag
  end

  private

  def clothing_image_tag(constitution_id)
    case constitution_id
    when 1 then image_tag('clothing_index1.png', style: 'width: 100%; height: auto;') # 暑がり
    when 2 then image_tag('clothing_index2.png', style: 'width: 100%; height: auto;') # やや暑がり
    when 4 then image_tag('clothing_index4.png', style: 'width: 100%; height: auto;') # やや寒がり
    when 5 then image_tag('clothing_index5.png', style: 'width: 100%; height: auto;') # 寒がり
    else image_tag('clothing_index3.png', style: 'width: 100%; height: auto;')        # 標準
    end
  end
end
