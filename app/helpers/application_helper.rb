module ApplicationHelper
  def currentUserTopLabel
    if current_user
      tag.div(class: "topLabel") do
        current_user.fullname
      end
    end
  end

  def linkToRoot
    link_to(image_tag('home-image.png', class: 'top-bar-link-img'), root_path)
  end

  def linkToDashboard
    if current_user
      link_to(image_tag('dashboard.png', class: 'top-bar-link-img-25'), dashboard_path)
    end
  end

  def linkToUsers
    if current_user
      link_to(image_tag('users.png', class: 'top-bar-link-img-25'), users_path, method: :get)
    end
  end

  def startChatButton
    if current_user
      button_tag(image_tag('chat.png', class: 'top-bar-link-img-25'), id: 'startChatButton', onClick: 'chat_clicked()')
    end
  end

  def linkToLogIn
    if !current_user && (controller_name != 'sessions')
      link_to(image_tag('login.png', class: 'top-bar-link-img-25'), new_session_path(:user))
    end
  end

  def linkToSignUp
    if !current_user && (controller_name != 'registrations') 
      link_to(image_tag('signup.png', class: 'top-bar-link-img-25'), new_registration_path(:user))
    end
  end

  def linkToForgot
    if controller_name == 'sessions' 
      link_to(image_tag('forgot.png', class: 'top-bar-link-img-25'), new_password_path(:user))
    end
  end

  def logoutButton
    if current_user
      link_to(image_tag('logout.png', class: 'top-bar-link-img-25'), destroy_user_session_path, method: :delete)
    end
  end

  def linkToMyPets
    tag.div(class: 'dashboard-button toMyPets') do
      link_to("My Pets", pets_path(owner: current_user))
    end
  end

  def linkToMyTreatment
    tag.div(class: 'dashboard-button toMyTreatments') do
      link_to("Treatment", user_treatments_path(user_id: current_user.id))
    end
  end

  def linkToMyAppointments
    tag.div(class: 'dashboard-button toMyAppointments') do
      link_to("Appointments", user_appointments_path(user_id: current_user.id))
    end
  end

  def images_store
    "https://storage.googleapis.com/pets_bucket_1/interface_images/"
  end

end
