module ApplicationHelper

  def image_full_path(relative_path)
    return image_full_path_helper(relative_path, "92")
  end

  def image_full_path_big(relative_path)
    return image_full_path_helper(relative_path, "185")
  end

  private
    def image_full_path_helper(relative_path, size)
      if relative_path.to_s.empty?
        return "No image available"
      else
        image_tag("http://image.tmdb.org/t/p/w" + size + relative_path)
      end
    end
end
