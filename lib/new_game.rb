#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/sprite'
require File.dirname(__FILE__) + '/snake'
require File.dirname(__FILE__) + '/collision_handler'
require File.dirname(__FILE__) + '/sprites/apple'
require File.dirname(__FILE__) + '/sprites/carrot'
require File.dirname(__FILE__) + '/sprites/ghost'
require File.dirname(__FILE__) + '/helpers'

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
      @carrots = Sprite::spawn('carrot', 25) do |x, y| Carrot.new(x, y) end
      @apples = Sprite::spawn('apple', 10) do |x, y| Apple.new(x, y) end
      @ghost = Sprite::spawn('ghost', 1) do |x, y| Ghost.new(x, y) end
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
        $game.init
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
        @ghost.tick_interval = 0
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
          Log.debug("Collision between Apple and Snake at x:#{apple.x}/y:#{apple.y}")
          @points += 5
          apple.move
          apple.draw($game.screen, apple)
          @snake.add_parts(1)
        end
      end

      @carrots.each do |carrot|
        if @collision_handler.is_collision(@snake.snake_body[0], carrot)
          Log.debug("Collision between Carrot and Snake at x:#{carrot.x}/y:#{carrot.y}")
          @points -= 10
          if @snake.parts <= 2
            $finished = true
          end
          carrot.move
          carrot.draw($game.screen, carrot)
          @snake.remove_parts(@snake.parts / 3)
        end
      end

      if @collision_handler.is_ghost_collision(@snake.snake_body, @ghost)
        Log.debug("Collision between Ghost and Snake at x:#{@ghost.x}/y:#{@ghost.y}")
        @points -= 50
        if @snake.parts <= 2  
          $finished = true
        end
        @ghost.respawn
        @snake.remove_parts(@snake.parts / 2)
      end

      if @collision_handler.is_wall_collision(@snake.snake_body)
        Log.debug("Collision between Snake and Wall")
        Log.info("Going back to menu...")
        $finished = true
      end

      if @collision_handler.is_self_snake_collision(@snake.snake_body)
        Log.debug("Collision between self")
        Log.info("Going back to menu...")
        $finished = true
      end

      if $finished
        SDL.delay(2000)
        Helpers::score(@points)
        $game.state = Menu.new
      end
    end

    def draw(surface)
      threads = []
      green_background = Sprite::load_image("./img/bg.bmp")
      Sprite::blit(green_background, surface, 16, 16)
      threads << Thread.new { @snake.draw(surface) }
      @apples.each do |apple|
        threads << Thread.new { apple.draw(surface, apple) }
      end
      @carrots.each do |carrot|
        threads << Thread.new { carrot.draw(surface, carrot) }
      end
      threads << Thread.new { @ghost.draw(surface) }
      threads.each { |t| t.join } 
    end
  end
end
