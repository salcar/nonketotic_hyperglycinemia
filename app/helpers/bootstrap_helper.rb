module BootstrapHelper
  def menu_item(key, link_text, link, var = @menu_key)
    klass = var && var.first == key ? "active" : nil

    content_tag(:li, :class => klass) do
      content_tag(:a, :href => link) do
        link_text
      end
    end
  end

  def alert_message(text, klass)
    if text =~ /\*\*(.*)\*\*/
      content = content_tag(:p) do
        content_tag(:b, $1) +
            text.gsub($0, "")
      end
    else
      content = content_tag(:p) { text }
    end

    content_tag(:div, :class => "alert alert-block alert-#{klass}") do
      content_tag(:a, :class => "close", "data-dismiss" => "alert", :href => "#") { "x" } +
          content
    end
  end

  def render_flashes
    elements = []

    elements << alert_message(flash[:error], "error") if flash[:error]
    elements << alert_message(flash[:warning], "warning") if flash[:warning]
    elements << alert_message(flash[:notice], "info") if flash[:notice]
    elements << alert_message(flash[:success], "success") if flash[:success]

    return nil if elements.empty?

    content_tag(:div, :class => "row") do
      tag(:br) +
      content_tag(:div, :class => "span12") { elements.join("\n").html_safe }
    end
  end
end