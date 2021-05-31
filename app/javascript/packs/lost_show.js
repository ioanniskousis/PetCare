function createEvents() {
  const addPhotoButton = document.getElementById("addPhotoButton");
  const pet_image_photo = document.getElementById("lost_photo");
  const cancelNewPhoto = document.getElementById("cancelNewPhoto");
  const newPhotoFile = document.getElementById("newPhotoFile");

  addPhotoButton.onclick = function() {
    pet_image_photo.click();
  }

  cancelNewPhoto.onclick = function() {
    addPetPhotoPanel.style.visibility = "hidden";
    addPhotoButton.style.visibility = "visible";
    newPhotoFile.innerHTML = '';
  }

  pet_image_photo.onchange = function() {
    const addPetPhotoPanel = document.getElementById("addPetPhotoPanel");
    addPetPhotoPanel.style.visibility = "visible";
    
    newPhotoFile.innerHTML = pet_image_photo.value;

    addPhotoButton.style.visibility = "hidden";
  }


}

createEvents();
