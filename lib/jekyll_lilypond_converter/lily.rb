module JekyllLilyPondConverter
  class Lily
    attr_reader :snippet

    def initialize(id, extension, snippet)
      @id = id
      @extension = extension
      @snippet = snippet
    end

    def code_filename
      "#{id}.ly"
    end

    def image_filename
      "#{id}.#{extension}"
    end

    def image_link
      "![](/lily_images/#{image_filename})\n"
    end

    def code
      strip_delimiters(snippet)
    end

    private
    attr_reader :id, :extension

    def strip_delimiters(snippet)
      snippet.gsub(/```lilypond\n/, "").gsub(/```\n/, "")
    end
  end
end
