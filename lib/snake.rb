#!/usr/bin/env ruby
require 'sdl'
require 'lib/sprite'

module JakeTheSnake

  class SnakePart
    attr_accessor :head, :x, :y
  end

  class Snake < Sprite
    attr_accessor :snake_part, :snake_body, :rainbow, :parts_to_add

    def initialize
      @rainbow = false
      @direction = 2
      @length = 3
      @x = 128
      @y = 160
      @head = false
      @parts_to_add = 3
      @snake_body = Array.new
      @snake_part = SnakePart.new

      @length.times do
        @snake_part.head = @head
        @snake_part.x = @x
        @snake_part.y = @y
        @snake_body << @snake_part
        @x -= 16
        @head = false
      end
    end

    def draw(surface)
      @snake_body.each do |body_part|
        if body_part
          snake_surface = load_image("./img/player1_head.bmp")
        elsif @rainbow
          snake_surface = load_image("./img/player_rainbow.bmp")
        else
          snake_surface = load_image("./img/player_body.bmp")
        end
        SDL::Surface.blit(snake_surface, 0, 0, 0, 0, surface, 0, 0)
      end
    end

    def move(direction) 
      self.direction = direction

      case direction
      when 1
        i = 1
        @snake_body.each do |body_part|
          body_part.x = @snake_body[i-1].x
          body_part.y = @snake_body[i-1].y
          i += 1
        end
        @snake_body[0].y -= 16
      when 2 
        @snake_body.each do |body_part|
          body_part.x = @snake_body[i-1].x
          body_part.y = @snake_body[i-1].y
          i += 1
        end
        @snake_body[0].x += 16
      when 3 
        @snake_body.each do |body_part|
          body_part.x = @snake_body[i-1].x
          body_part.y = @snake_body[i-1].y
          i += 1
        end
        #@snake_body[0].y += 16
      when 4
        @snake_body.each do |body_part|
          body_part.x = @snake_body[i-1].x
          body_part.y = @snake_body[i-1].y
          i += 1
        end
        #@snake_body[0].x -= 16
      end
    end

    def add_parts(parts)
      parts.times do
        @snake_part = Struct.new(:head,:x,:y)
        #@snake_part.head = false
        #@snake_part.x = @snake_body[-1].x
        #@snake_part.y = @snake_body[-1].y
        @snake_body << snake_part
      end
    end

    def remove_parts(parts)
      parts.times do
        @snake_body.pop
      end
    end
  end
end
