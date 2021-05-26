module ApplicationHelper
  def currentUserTopLabel
    if current_user
      tag.div(class: "topLabel") do
        current_user.fullname
      end
    end
  end

  def linkToRoot
    tip = content_tag(:div, "Home", :class => "tiptext left bottom")
    link = link_to(image_tag('home-image.png', class: 'top-bar-link-img') + tip, root_path, class: 'tipped')

    link
  end

  def linkToDashboard
    if current_user
      tip = content_tag(:div, "Dashboard", :class => "tiptext bottom")
      link_to(image_tag('dashboard.png', class: 'top-bar-link-img-25') + tip, dashboard_path, class: 'tipped')
    end
  end

  def linkToUsers
    if current_user
      tip = content_tag(:div, "Users", :class => "tiptext bottom")
      link_to(image_tag('users.png', class: 'top-bar-link-img-25') + tip, users_path, class: 'tipped', method: :get)
    end
  end

  def startChatButton
    if current_user
      tip = content_tag(:div, "Chat", :class => "tiptext bottom")
      button_tag(image_tag('chat.png', class: 'top-bar-link-img-25') + tip, id: 'startChatButton', class: 'tipped', onClick: 'chat_clicked()')
    end
  end

  def linkToLogIn
    if !current_user && (controller_name != 'sessions')
      tip = content_tag(:div, "Log In", :class => "tiptext bottom right")
      link_to(image_tag('login.png', class: 'top-bar-link-img-25') + tip, new_session_path(:user), class: 'tipped')
    end
  end

  def linkToSignUp
    if !current_user && (controller_name != 'registrations')
      tip = content_tag(:div, "Sign Up", :class => "tiptext right bottom")
      link_to(image_tag('signup.png', class: 'top-bar-link-img-25') + tip, new_registration_path(:user), class: 'tipped')
    end
  end

  def linkToForgot
    if controller_name == 'sessions'
      tip = content_tag(:div, "Forgot password", :class => "tiptext bottom")
      link_to(image_tag('forgot.png', class: 'top-bar-link-img-25') + tip, new_password_path(:user), class: 'tipped')
    end
  end

  def logoutButton
    if current_user
      tip = content_tag(:div, "Log Out", :class => "tiptext right bottom")
      link_to(image_tag('logout.png', class: 'top-bar-link-img-25') + tip, destroy_user_session_path, class: 'tipped', method: :delete)
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

  def calendarView(show)
    if show
      render partial: 'layouts/datetimeSelector'
    end
  end
end
