#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/snake'
require 'lib/high_score'
require 'lib/apple'
require 'lib/collision_handler'
require 'lib/helpers'

module JakeTheSnake
  include Sprite
  include Helpers

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
        x = rand(608).to_i % 38 * 16 + 16
        y = rand(448).to_i % 28 * 16 + 16
        apple = Apple.new(x, y)
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
        $game.spawn_menu
      when SDL::Key::A
        @snake.add_parts(1)
      when SDL::Key::D
        @snake.remove_parts(1)
      end
    end
    
    def clock_tick
      @snake.move(@snake.direction)
      #@apples[-1].move 
      check_collisions
    end
    
    def check_collisions
      @apples.each do |apple|
        if @collision_handler.is_sprite_collision(@snake.snake_body, apple)
          Helpers::debug("Collision between Apple and Snake")
          apple.move
        end
      end
      
      if @collision_handler.is_wall_collision(@snake.snake_body)
        Helpers::debug("Collision between Snake and Wall")
        $finished = true
      elsif @collision_handler.is_self_snake_collision(@snake.snake_body)
        Helpers::debug("Collision between self")
        $finished = true
      end

      if $finished
        SDL.delay(2000)
        $game.state = Menu.new
        #high_score(@p1points)
        #$game.state = HighScore.new
      end
    end

    def draw(surface)
      Helpers::debug("In NewGame.draw")
      green_background = Sprite.load_image("./img/bg.bmp")
      Sprite.blit(green_background, surface, 16, 16)
      @snake.draw(surface)
      @apples.each do |apple|
        apple.draw(surface, apple)
      end
    end
  end
end
