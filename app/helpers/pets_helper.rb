module PetsHelper
  def petFirstPhoto(pet)
    if pet.pet_images.count.positive?
      if pet.pet_images.first.photo.persisted?
        if pet.pet_images.first.photo.metadata['width'] > pet.pet_images.first.photo.metadata['height']
          image_tag(pet.pet_images.first.photo, height: "200")
        else
          image_tag(pet.pet_images.first.photo, width: "200")
        end
      end
    end
  end

  def petsIndexOwnerCaption(owner)
    pets = owner.pets
    content_tag(:h3) do
      owner.fullname + ': ' + pets.length.to_s + ' Pet' + (pets.length == 1 ? '' : 's')
    end
  end

  def petsIndexNewPetLink(owner)
    link_to_edit = link_to('New Pet', new_pet_path(owner: owner), class: 'pageLink') if owner == current_user
  end

  def petPanelLinks(owner, pet)
    link_to_more = link_to('More..', pet)
    link_to_edit = link_to('Edit', edit_pet_path(pet)) if owner == current_user

    content_tag :div, :class => "petLinks" do
      content_tag(:div, :class => "petLinks-left") do
        link_to('Treatment', pet_treatments_path(pet))
      end + 
      content_tag(:div, :class => "petLinks-right") do
        link_to_more +
        link_to_edit
      end
    end
  end

  def petShowEditLinks(owner, pet)
    content_tag :div, :class => "petLinks-right" do
      if owner == current_user
        link_to('Edit', edit_pet_path(pet)) +
        link_to('Delete this pet', pet, method: :delete, data: { confirm: 'Are you sure you want to Delete this pet ?' }, class: "redText")
      end
    end
  end

end
