module ApplicationHelper
  def current_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

  def current_site
    @current_site = t('it_exchange')
  end

  def current_title
    title = []
    title << current_site
    if content_for?(:title)
      title << content_for(:title)
    else
      title << params[:controller].split("/").last.titleize
    end
    title.uniq.join(" | ")
  end

  def title(elements=[])
    content_for :title, elements.to_a.compact.map{ |a| a.try(:name) || a.try(:title) || a.try(:id) || a.to_s.capitalize }.join(" | ")
  end

  def description(description="")
    content_for :description, description
  end

  def sanitize(content)
    ActionController::Base.helpers.sanitize(content)
  end

  def strip_tags_and_entities(string)
    if string.present?
      stripped = strip_tags(string)
      decoded = HTMLEntities.new.decode(stripped)
      decoded.squish.gsub(%r{/</?[^>]*>/}, "")
    end
  end

  def route_exists?(path)
    begin
      recognize_path = Rails.application.routes.recognize_path(path, method: :get)
      recognize_path.present? && recognize_path[:action] != "route_not_found"
    rescue StandardError
      false
    end
  end

  def content_for_or(name, default)
    if content_for?(name)
      content_for(name)
    else
      default
    end
  end

  def body_class(params)
    body = []
    return unless params[:controller]
    if params[:controller].include?("/")
      body << params[:controller].split("/").first
      body << params[:controller].gsub("/", "-")
    else
      body << params[:controller]
    end
    if params[:controller].include?("/")
      body << "#{params[:controller].gsub('/', '-')}-#{params[:action]}"
    else
      body << "#{params[:controller]}-#{params[:action]}"
    end
    if params.key?(:page)
      body << "#{params[:controller]}-#{params[:action]}-#{params[:page]}"
    end
    body.join(" ")
  end
  
  #Devise helper
  def resource_name
    :user
  end
  
  def resource
    @resource ||= User.new
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def resource_class
    devise_mapping.to
  end

end
