#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/snake'
require 'lib/high_score'

module JakeTheSnake
  class NewGame < Sprite
    def initialize
      @snake = Snake.new
      @finished = false
    end

    def key_pressed(key)
      case key
      when SDL::Key::UP
        unless @snake.direction == 3
          @snake.direction = 1
        end
      when SDL::Key::RIGHT
        unless @snake.direction == 4
          @snake.direction = 2
        end
      when SDL::Key::DOWN
        unless @snake.direction == 1
          @snake.direction = 3
        end
      when SDL::Key::LEFT
        unless @snake.direction == 2
          @snake.direction = 4
        end
      when SDL::Key::Q
        $game.state = Menu.new
      end
    end

    def clock_tick
      @snake.move(@snake.direction)
      check_collisions
     
      if @snake.parts_to_add
        @snake.add_parts(1)
        @snake.parts_to_add -= 1
      end
    end

    def check_collisions
    end
    
    def draw(surface)
      green_background = load_image("./img/bg.bmp")
      SDL::Surface.blit(green_background, 16, 16, 608, 448, surface, 16, 16)
      @snake.draw(surface)
      finished = false
      
      if finished
        SDL.delay(2000)
        high_score(@p1points)
        $game.state = HighScore.new
      end
    end
  end
end
