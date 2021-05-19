module TreatmentCategoriesHelper
  def categoryParent(item)
    item.parent.categoryName if item.parent
    'root' unless item.parent
  end
end
