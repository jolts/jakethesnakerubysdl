#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/snake'
require 'lib/high_score'
require 'lib/util'

module JakeTheSnake
  class NewGame < Sprite
    def initialize
      @snake = Snake.new
      @finished = false
    end

    def key_pressed(key)
      $stderr.puts "Currently in: %s" % Util.new("red").colorize("NewGame.key_pressed()")
      if key == SDL::Key::UP
        if @snake.direction != 3
          @snake.direction = 1
          $stderr.puts Util.new("yellow").colorize("KeyUp")+" pressed."
        end
      elsif key == SDL::Key::RIGHT
        if @snake.direction != 4
          @snake.direction = 2
          $stderr.puts Util.new("yellow").colorize("KeyRight")+" pressed."
        end
      elsif key == SDL::Key::DOWN
        if @snake.direction != 1
          @snake.direction = 3
          $stderr.puts Util.new("yellow").colorize("KeyDown")+" pressed."
        end
      elsif key == SDL::Key::LEFT
        if @snake.direction != 2
          @snake.direction = 4
          $stderr.puts Util.new("yellow").colorize("KeyLeft")+" pressed."
        end
      elsif key == SDL::Key::Q
        $game.state = Menu.new
        $stderr.puts Util.new("yellow").colorize("Q_Q")+" pressed."
      end
    end

    def clock_tick
      @snake.move(@snake.direction)
      check_collisions

      if @snake.parts_to_add
        @snake.add_parts(3)
        @snake.parts_to_add -= 1
      end
    end

    def check_collisions
      $stderr.puts "Currently in: %s" % Util.new("red").colorize("NewGame.check_collisions()")
    end
    
    def draw(surface)
      green_background = load_image("./img/bg.bmp")
      SDL::Surface.blit(green_background, 16, 16, 608, 448, surface, 16, 16)
      @snake.draw(surface)
      finished = false
      
      if finished
        SDL.delay(2000)
        high_score(@p1points)
        $state = HighScore.new
      end
    end
  end
end
