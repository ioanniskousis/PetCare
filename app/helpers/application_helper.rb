module ApplicationHelper
  def currentUserTopLabel
    if current_user
      tag.div(class: "topLabel") do
        current_user.fullname
      end
    end
  end

  def linkToDashboard
    if current_user
      link_to("Dashboard", root_path)
    end
  end

  def linkToUsers
    if current_user
      link_to("Users", users_path, method: :get)
    end
  end

  def linkToLogIn
    if !current_user && (controller_name != 'sessions')
      link_to("Log in", new_session_path(resource_name))
    end
  end

  def linkToSignUp
    if !current_user && (controller_name != 'registrations') 
      link_to("Sign up", new_registration_path(resource_name))
    end
  end

  def linkToForgot
    if !current_user && (controller_name != 'passwords') && (controller_name != 'registrations') 
      link_to("Forgot Password", new_password_path(resource_name))
    end
  end

  def logoutButton
    if current_user
      button_to("Logout", destroy_user_session_path, method: :delete)
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
end
