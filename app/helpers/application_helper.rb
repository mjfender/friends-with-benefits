module ApplicationHelper

  def profile_pic(model)
    picture = "<div class='avatar'>" +
    link_to((image_tag model.avatar.url(:thumb), class: "thumbnail", title: "#{model.display_name(current_user)}"), model) +
    "</div>"
    picture.html_safe
  end

end

