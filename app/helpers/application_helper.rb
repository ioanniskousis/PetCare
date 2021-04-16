module ApplicationHelper
  def linkToUsers
    if current_user
      link_to("Users", users_path, method: :get)
    end
  end

  def logoutButton
    if current_user
      button_to("Logout", destroy_user_session_path, method: :delete)
    end
  end

  def linkToMyPets
    tag.div(class: 'home-page-link-button home-page-link-ToMyPets') do
      link_to("My Pets", pets_path(owner: current_user))
    end
  end

  def linkToMyTreatment
    tag.div(class: 'home-page-link-button home-page-link-ToMyAppointments') do
      link_to("Treatment", user_appointments_path(user_id: current_user.id))
    end
  end

  def linkToMyAppointments
    tag.div(class: 'home-page-link-button home-page-link-ToMyAppointments') do
      link_to("Appointments", user_appointments_path(user_id: current_user.id))
    end
  end
end
