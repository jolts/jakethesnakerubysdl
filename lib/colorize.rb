def colorize(color, text)
  # Colors
  $none         = ""
  $black        = "\033[0;30m"
  $red          = "\033[0;31m"
  $green        = "\033[0;32m"
  $brown        = "\033[0;33m"
  $blue         = "\033[0;34m"
  $purple       = "\033[0;35m"
  $cyan         = "\033[0;36m"
  $yellow       = "\033[1;33m"
  $white        = "\033[1;37m"
  $default      = "\033[0m"
   
  case color
  when "black"
    my_color = $black
  when "red"
    my_color = $red
  when "green"
    my_color = $green
  when "brown"
    my_color = $brown
  when "blue"
    my_color = $blue
  when "purple"
    my_color = $purple
  when "cyan"
    my_color = $cyan
  when "white"
    my_color = $white
  when "yellow"
    my_color = $yellow
  end
    
  return my_color+text+$default
end
