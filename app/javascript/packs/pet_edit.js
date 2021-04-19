function createEvents() {
  const selectPhotoButton = document.getElementById("selectPhotoButton");
  const selectPhotoButtonContainer = document.getElementById("selectPhotoButtonContainer");
  const pet_image_photo = document.getElementById("pet_image_photo");
  const cancelUpdatePetImagePanel = document.getElementById("cancelUpdatePetImagePanel");
  const cancelUpdatePetImageButton = document.getElementById("cancelUpdatePetImageButton");
  const newPhotoFile = document.getElementById("newPhotoFile");

  selectPhotoButton.onclick = function() {
    pet_image_photo.click();
  }

  cancelUpdatePetImageButton.onclick = function() {
    cancelUpdatePetImagePanel.style.visibility = "hidden";
    cancelUpdatePetImagePanel.style.display = "none";
    selectPhotoButtonContainer.style.visibility = "visible";
    selectPhotoButtonContainer.style.display = "inline-block";
    newPhotoFile.innerHTML = '';
    pet_image_photo.value = null;
  }

  pet_image_photo.onchange = function() {
    cancelUpdatePetImagePanel.style.visibility = "visible";
    cancelUpdatePetImagePanel.style.display = "inline-block";

    newPhotoFile.innerHTML = pet_image_photo.value
    selectPhotoButtonContainer.style.visibility = "hidden";
    selectPhotoButtonContainer.style.display = "none";
  }
}

createEvents();
