class NavbarLink
  include ActionView::Helpers::UrlHelper

  def initialize(text, link, controller)
    @text = text
    @link = link
    @controller = controller
  end

  def render
    link_to(@text, @link)
  end

  def current?(controller)
    if @controller == controller
      "current"
    else
      nil
    end
  end

end
