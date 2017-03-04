module BoardsHelper
  def content_excerpt(c)
    return unless c
    truncate(c, :length => 20)
  end
end
