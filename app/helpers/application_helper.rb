module ApplicationHelper
  def page_title
    title = I18n.t('page.title')
    title = "#{I18n.t('page.short_description')} | #{title}"
    title = "#{@event.title} | #{title}" if @event
    title
  end

  def link_to_event_fullpath(event)
    url = event_fullpath(event)
    link_to url, url
  end

  private
    def event_fullpath(event)
      "#{request.protocol}#{request.host_with_port}#{event_items_path(event)}"
    end
end
