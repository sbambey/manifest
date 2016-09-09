class WikipediaService
	require 'wikipedia'
	require 'json'

	def initialize(params = nil)
		#@page = Wikipedia.find(params[:name], {rvsection: "0"})
	end

	def test
		#@page.title
    "test"
	end

	def overview
		#self.class.sanitize(@page.content)
    "test"
	end

	def self.sanitize( s )
    if s
      s = s.dup

      # strip anything inside curly braces!
      while s =~ /\{\{[^\{\}]+?\}\}/
        s.gsub!(/\{\{[^\{\}]+?\}\}/, '')
      end

      # strip info box
      s.sub!(/^\{\|[^\{\}]+?\n\|\}\n/, '')

      # strip internal links
      s.gsub!(/\[\[([^\]\|]+?)\|([^\]\|]+?)\]\]/, '\2')
      s.gsub!(/\[\[([^\]\|]+?)\]\]/, '\1')

      # strip images and file links
      s.gsub!(/\[\[Image:[^\[\]]+?\]\]/, '')
      s.gsub!(/\[\[File:[^\[\]]+?\]\]/, '')

      # convert bold/italic to html
      s.gsub!(/'''''(.+?)'''''/, '<b><i>\1</i></b>')
      #s.gsub!(/'''(.+?)'''/, '<b>\1</b>')
      s.gsub!(/'''(.+?)'''/, '\1')
      s.gsub!(/''(.+?)''/, '<i>\1</i>')

      # misc
      s.gsub!(/<ref[^<>]*>[\s\S]*?<\/ref>/, '')
      s.gsub!(/<!--[^>]+?-->/, '')
      s.gsub!('  ', ' ')
      s.strip!

      # create paragraphs
      sections = s.split("\n\n")
      if sections.size > 1
        s = sections.map {|s| "<p>#{s.strip}</p>" }.join("\n")
      end

      s
    end
  end
end