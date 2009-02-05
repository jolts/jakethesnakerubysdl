#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/snake'

module JakeTheSnake
  class NewGame < Sprite
    def initialize
      @snake = Snake.new
      @finished = false
    end

    def key_pressed(key)
      puts 'in NewGame.key_pressed()'
      if key == SDL::Key::UP
        if @snake.direction != 3
          @snake.direction = 1
        end
      elsif key == SDL::Key::RIGHT
        if @snake.direction != 4
          @snake.direction = 2
        end
      elsif key == SDL::Key::DOWN
        if @snake.direction != 1
          @snake.direction = 3
        end
      elsif key == SDL::Key::LEFT
        if @snake.direction != 2
          @snake.direction = 4
        end
      end
    end

    def clock_tick
      @snake.move(@snake.direction)
      check_collisions

      if @snake.parts_to_add
        @snake.add_parts(1)
        @snake.parts_toadd -= 1
      end
    end

    def check_collisions
      puts "in NewGame.check_collisions()"
    end
    
    def draw(surface)
      green_background = SDL::Surface.new
      green_background.PixelFormat
      green_background.mapRGB(0x61,0xAD,0x2F)
      green_background.fillRect(0, 0, 608, 448)


  end
