module PetImagesHelper
  def petImageSelect(owner)
    if owner == current_user
      content_tag(:div, class:"detailsRow") do
        content_tag(:div, id:"newPhotoFile") do
        end + 
        content_tag(:div, class:"itemDetail") do
        end +
        content_tag(:div, class:"itemDetail",  id:"selectPhotoButtonContainer") do
          tag.input(value:"Select Photo", type:"button", id:"selectPhotoButton")
        end +
        content_tag(:div, class:"itemDetail",  id:"cancelUpdatePetImagePanel") do
          tag.input(value:"Cancel", type:"button", id:"cancelUpdatePetImageButton")
        end
      end
    end
  end

  def petImageEditButtons(owner)
    if owner == current_user
      content_tag(:div, class:"detailsRow") do
        content_tag(:div, class:"itemDetail linkBox flex-start") do
          link_to('Delete this Pet Image', pet_image_path(@pet_image, pet_id: @pet.id), method: :delete, data: { confirm: 'Are you sure you want to Delete this Photo ?' }, class: "redText")
        end +
        content_tag(:div, class:"itemDetail") do
        end +
        content_tag(:div, class:"itemDetail") do
          tag.input(value:"Update", type:"submit")
        end
      end
    end
  end

  def addPhotoButtonContainer(owner)
    if owner == current_user
      content_tag(:div, class:"addPhotoButtonContainer") do
        content_tag(:div, id: "newPhotoFile") do
        end +
        tag.input(value:"Add New Photo", type:"button", id:"addPhotoButton")
      end
    end
  end
end
