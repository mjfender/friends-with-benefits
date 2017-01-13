module ApplicationHelper

  def profile_pic(model)
    picture = "<div class='avatar'>" +
    link_to((image_tag model.avatar.url(:thumb), class: "thumbnail"), model) +
    "</div>"
    picture.html_safe
  end

end

