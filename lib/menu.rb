class Menu
  def initialize
    @@choice = 1
    @@choice_y = 176
  end

  def draw(surface)
    puts 'in draw()'
    menu_screen = load_image("background_and_wall_menu.bmp")
    apple = load_image("apple_menu.bmp")
    SDL::Surface.blit($screen, 0, 0, 0, 0, menu_screen, 0, 0)
    SDL::Surface.blit($screen, 0, 0,0,0, apple, 168, 176)
  end
end
