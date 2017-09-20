module WelcomeHelper

  def image_full_path(relative_path)
    if relative_path.to_s.empty?
      return "No image available"
    else
      image_tag("http://image.tmdb.org/t/p/w92" + relative_path)
    end
  end

end
