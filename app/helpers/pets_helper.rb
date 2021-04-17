module PetsHelper
  def petFirstPhoto(pet)
    if pet.pet_images.count.positive?
      if pet.pet_images.first.photo.persisted?
        image_tag(pet.pet_images.first.photo, size: "200")
      end
    end
  end
end
