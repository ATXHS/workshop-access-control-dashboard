module ApplicationHelper
  ##
  # Generate a menu list item, checking for the active path
  ##
  def menu_item(text, path)
    item_class = current_page?(path) ? 'is-active' : ''

    "<li class=#{item_class}>#{link_to text, path}</li>".html_safe
  end
end
