module Cms
  module PagesHelper
    def markdown(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      markdown.render(text).html_safe if text
    end
  end
end
