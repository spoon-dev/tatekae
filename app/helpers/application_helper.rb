module ApplicationHelper
  def link_to_event_fullpath(event)
    url = event_fullpath(event)
    link_to url, url
  end

  private
    def event_fullpath(event)
      "#{request.protocol}#{request.host_with_port}#{event_items_path(event)}"
    end
end
