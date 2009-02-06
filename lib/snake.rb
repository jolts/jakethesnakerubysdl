#!/usr/bin/env ruby
require 'sdl'
require 'lib/sprite'

module JakeTheSnake
  class Snake < Sprite
    attr_accessor :snake_part, :snake_body, :rainbow, :parts_to_add, :direction, :x, :head

    def initialize
      @rainbow = false
      @direction = 2
      @length = 3
      @x = 128
      @y = 160
      @head = true
      @parts_to_add = 3
      @snake_body = Array.new
      
      @length.times do
        @snake_part = Hash.new
        @snake_part[:head] = @head
        @snake_part[:x] = @x
        @snake_part[:y] = @y
        self.snake_body << @snake_part
        self.x -= 16
        self.head = false
      end
    end

    def draw(surface)
      self.snake_body.each do |body_part|
        if body_part[:head]
          snake_surface = load_image("./img/player1_head.bmp")
        else
          unless @rainbow
            snake_surface = load_image("./img/player_body.bmp")
          else
            snake_surface = load_image("./img/player_rainbow.bmp")
          end
        end
        SDL::Surface.blit(snake_surface, 0, 0, 0, 0, surface, body_part[:x], body_part[:y])
      end
    end

    def move(direction) 
      self.direction = direction

      i = self.snake_body.length - 1
      self.snake_body.reverse_each do |body_part|
        body_part[:x] = self.snake_body[i-1][:x]
        body_part[:y] = self.snake_body[i-1][:y]
        i -= 1
      end

      case direction
      when 1
        self.snake_body[0][:y] -= 16
      when 2 
        self.snake_body[0][:x] += 16
      when 3
        self.snake_body[0][:y] += 16
      when 4
        self.snake_body[0][:x] -= 16
      end
    end

    def add_parts(parts)
      parts.times do
        @snake_part[:head] = false
        @snake_part[:x] = self.snake_body[-1][:x]
        @snake_part[:y] = self.snake_body[-1][:y]
        self.snake_body << @snake_part ## == @snake_body.insert(-1, @snake.part)
      end
    end

    def remove_parts(parts)
      parts.times do
        @snake_body.delete(-1)
      end
    end
  end
end
