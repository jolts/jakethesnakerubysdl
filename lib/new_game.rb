#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/snake'
require 'lib/high_score'
require 'lib/apple'
require 'lib/collision_handler'

module JakeTheSnake
  include Sprite
  class NewGame
    attr_reader :snake

    def initialize
      @snake = Snake.new
      @direction = 2 
      @collision_handler = CollisionHandler.new
      $finished = false
      @apple = Apple.new
      
      @apples = Array.new
      10.times do
        x = rand(608)
        y = rand(448)
        apple = Apple.new(x, y) unless @apples[-1] == x && @apples[-1] == y
        @apples << apple
      end
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
      when SDL::Key::A
        @snake.add_parts(1)
      when SDL::Key::D
        @snake.remove_parts(1)
      end
    end
    
    def clock_tick
      @snake.move(@snake.direction)
      @apple.move(@apples)
      check_collisions
      # Code which wont be used yet
      #if @snake.parts_to_add 
      #  @snake.add_parts(1)
      #  @snake.parts_to_add -= 1
    end
    
    def check_collisions
      @apples.each do |apple|
        if @collision_handler.is_collision(@snake.snake_body, apple)
          # Increment points and add one part
          #@snake.add_parts(1)
          #@apple.move
        end
      end

      def draw(surface)
        green_background = Sprite.load_image("./img/bg.bmp")
        Sprite.blit(green_background, surface, 16, 16)
        @snake.draw(surface)
        @apple.draw(surface, @apples)
        $finished = false
        
        if $finished
          SDL.delay(2000)
          high_score(@p1points)
          $game.state = HighScore.new
        end
      end
    end
  end
end
