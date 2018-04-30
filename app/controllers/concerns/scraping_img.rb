module ScrapingImg
  extend ActiveSupport::Concern
  def scrape_img(url)
    meta = MetaInspector.new(url)
    return meta.images.best
  end
end
