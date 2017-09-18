module WelcomeHelper

  def image_full_path(relative_path)
    image_tag("http://image.tmdb.org/t/p/w92" + relative_path)
  end

end
