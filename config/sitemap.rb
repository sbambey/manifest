# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.manifest.space"

SitemapGenerator::Sitemap.public_path = 'tmp/'
# store on S3 using Fog
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
# inform the map cross-linking where to find the other maps
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3-us-west-2.amazonaws.com/"
# pick a namespace within your bucket to organize your maps
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'daily', priority: 0.9
  add completed_provider_path(id: 'spacex'), changefreq: 'daily', priority: 0.8
  Mission.find_each do |m|
  	add mission_path(m), priority: 1.0, lastmod: mission.updated_at
  end
end

