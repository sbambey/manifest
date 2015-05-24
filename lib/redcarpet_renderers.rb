module Redcarpet
  module Render
    class HTMLWithoutBlockElements < HTML
      include SmartyPants

      def initialize(opts = {})
        opts[:tables] = false
        super(opts)
      end

      def block_code(code, language)
        code
      end

      def block_quote(quote)
        quote
      end

      def block_html(raw_html)
        raw_html
      end

      def header(text, header_level)
        "#{text} "
      end

      def hrule
        " "
      end

      def list(contents, list_type)
        " #{contents}"
      end

      def list_item(text, list_type)
        "* #{text}"
      end

      def paragraph(text)
        text
      end

      # Span-level calls

      def linebreak
        " "
      end

      def link(link, title, alt_text)
        "<a target=\"_blank\" href=\"#{link}\">#{alt_text}</a>"
      end

      def autolink(link, link_type)
        "<a target=\"_blank\" href=\"#{link}\">#{link}</a>"
      end

      def postprocess(document)
        document.gsub("\n", ' ').strip
      end
    end

    class HTMLTargetBlankRenderer < HTML
      def initialize(extensions = {})
        super extensions.merge(link_attributes: { target: "_blank" })
      end
    end
  end
end