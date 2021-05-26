module TreatmentsHelper
  def petColumn(pet_id)
    if pet_id

    end
  end

  def categoryItem(treatment)
    if treatment.category
      if treatment.item
        treatment.category.categoryName + (treatment.item.length > 0 ? ' - ' + treatment.item : '')
      else
        treatment.category.categoryName
      end
    end
  end
end
