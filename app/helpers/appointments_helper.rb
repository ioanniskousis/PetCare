module AppointmentsHelper
  def appointmentsIndexNewAppointmentLink(user)
    link_to_edit = link_to('New', new_user_appointment_path(user), class: 'pageLink') if user == current_user
  end

  def appointmentPanelLinks(appointment, user)
    link_to_edit = content_tag(:div)
    link_to_edit = link_to('Edit', edit_user_appointment_path(appointment, user_id: user.id)) if user == current_user
    link_to_delete = link_to('Delete', user_appointment_path(appointment, user_id: user.id), method: :delete, data: { confirm: 'Are you sure?' }) if user == current_user

    content_tag :div, class: "petLinks" do
      content_tag(:div, class: "petLinks-left") do
      end + 
      content_tag(:div, class: "petLinks-right") do
        link_to_edit +
        link_to_delete
      end
    end
  end

end
