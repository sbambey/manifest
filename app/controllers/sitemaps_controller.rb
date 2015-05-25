class SitemapsController < ApplicationController
  def show
  	redirect_to "https://s3-us-west-2.amazonaws.com/manifest-space-sitemap/sitemaps/sitemap.xml.gz"
  end
end
