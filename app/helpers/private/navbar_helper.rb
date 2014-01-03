#encoding:utf-8
require 'navbar_link'

module Private::NavbarHelper

  def navbar_links(controller)
    links = [
      NavbarLink.new("Abonnés", private_subscribers_path, "private/subscribers"),
      NavbarLink.new("Menus", private_menu_templates_path, "private/menu_templates"),
      NavbarLink.new("Recettes", private_recipes_path, "private/recipes")
    ]

    html = ""
    items = []
    links.each do |link|
      items << content_tag(:li, link.render.html_safe, class: link.current?(controller)).html_safe
    end
    html << content_tag(:ul, items.join.html_safe)
    return html.html_safe
  end

end
