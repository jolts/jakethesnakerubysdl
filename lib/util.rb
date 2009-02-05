module JakeTheSnake
  class Util
    attr_reader :color

    def initialize(color)
      @@color = color
    end

    def colorize(text)
      $colors = { 
        "black" => "\033[0;30m",
        "red" => "\033[0;31m",
        "green" => "\033[0;32m",
        "blue" => "\033[0;34m",
        "purple" => "\033[0;35m",
        "cyan" => "\033[0;36m",
        "yellow" => "\033[1;33m",
        "default" => "\033[0m"
      }
      $colors.default = "default"

      return $colors[@@color]+text+$colors["default"]
    end
  end
end
