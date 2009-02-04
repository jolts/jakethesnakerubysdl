#!/usr/bin/env ruby
require 'sdl'

class GameEngine
  def initialize(screen)
    @@screen = screen
  end

  def start_game
    # Initializes the game
    if SDL.init(SDL::INIT_VIDEO)
      while event = SDL::Event.poll
        @game.state.draw(@game.screen)
      end
    end
  end
  
  def end_game
    SDL.quit
  end

  def load_image(filename)
    loaded_image = SDL::Surface.load_bmp(filename)
    if loaded_image
      optimized_image = loaded_image.display_format
    end
    optimized_image
  end
end 
end
