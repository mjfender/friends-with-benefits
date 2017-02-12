module ApplicationHelper

  def profile_pic(model)
    picture = "<div class='avatar'>" +
    link_to( the_best_avatar(model, class: "thumbnail", title: "#{model.display_name(current_user)}"), model) +
    "</div>"
    picture.html_safe
  end

  def the_best_avatar(model, options = {})
    if model.avatar.file?
      image_tag model.avatar.url(:thumb), options
    else
      image_tag "user_default.png", options
    end
  end

end

