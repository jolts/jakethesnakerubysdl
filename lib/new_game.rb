#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/snake'
require 'lib/apple'
require 'lib/collision_handler'
require 'lib/carrot'
require 'lib/ghost'
require 'lib/helpers'

module JakeTheSnake
  include Sprite
  include Helpers

  class NewGame
    attr_reader :snake

    def initialize
      @snake = Snake.new
      @direction = 2 
      @points = 0
      @collision_handler = CollisionHandler.new
      $finished = false
      @apple = Apple.new
      @carrot = Carrot.new
      @carrots = Array.new
      @apples = Array.new
      
      1.times do
        x = rand(38) * 16 + 16
        y = rand(28) * 16 + 16
        @ghost = Ghost.new(x, y)
      end

      10.times do
        x = rand(38) * 16 + 16
        y = rand(28) * 16 + 16
        apple = Apple.new(x, y)
        @apples << apple
      end

      25.times do
        x = rand(38) * 16 + 16
        y = rand(28) * 16 + 16
        carrot = Carrot.new(x, y)
        @carrots << carrot
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
      end
    end
    
    def clock_tick
      @snake.move(@snake.direction)
      check_collisions

      @apples.each do |apple|
        apple.tick_interval += 1
      end

      @carrots.each do |carrot|
        carrot.tick_interval += 1
      end

      @ghost.tick_interval += 1

      if @ghost.tick_interval == 5
        @ghost.move(@snake.snake_body[0])
      end

      if @apples[-1].tick_interval == 20
        @apples[-1].move
        @apples[-1].tick_interval = 0
      end

      if @carrots[-1].tick_interval == 20
        @carrots[-1].move
        @carrots[-1].tick_interval = 0
      end
    end

    def check_collisions
      @apples.each do |apple|
        if @collision_handler.is_collision(@snake.snake_body[0], apple)
          Helpers::debug("Collision between Apple and Snake at x:#{apple.x}/y:#{apple.y}")
          @points += 5
          apple.move
          apple.draw($game.screen, apple)
          @snake.add_parts(1)
        end
      end

      @carrots.each do |carrot|
        if @collision_handler.is_collision(@snake.snake_body[0], carrot)
          Helpers.debug("Collision between Carrot and Snake at x:#{carrot.x}/y:#{carrot.y}")
          @points -= 10
          carrot.move
          carrot.draw($game.screen, carrot)
          @snake.remove_parts(@snake.parts / 3)
        end
      end

      if @collision_handler.is_collision(@snake.snake_body[0], @ghost)
        Helpers.debug("Collision between Ghost and Snake")
        @points -= 50
        @ghost.move(@snake.snake_body[0])
        @snake.remove_parts(@snake.parts / 2)
      end
      
      if @collision_handler.is_wall_collision(@snake.snake_body)
        Helpers::debug("Collision between Snake and Wall")
        Helpers::debug("Going back to menu...")
        $finished = true
      elsif @collision_handler.is_self_snake_collision(@snake.snake_body)
        Helpers::debug("Collision between self")
        Helpers::debug("Going back to menu...")
        $finished = true
      end

      if $finished
        SDL.delay(2000)
        Helpers::score(@points)
        $game.state = Menu.new
      end
    end

    def draw(surface)
      green_background = Sprite::load_image("./img/bg.bmp")
      Sprite::blit(green_background, surface, 16, 16)
      @snake.draw(surface)
      @apples.each do |apple|
        apple.draw(surface, apple)
      end
      @carrots.each do |carrot|
        carrot.draw(surface, carrot)
      end
      @ghost.draw(surface)
    end
  end
end
