#!/usr/bin/env ruby
require 'sdl'
require 'lib/sprite'

module JakeTheSnake
  include Sprite
  class Snake
    attr_accessor :snake_part, :snake_body, :rainbow, :parts_to_add, :direction, :x, :head

    def initialize
      @rainbow = false
      @direction = 2
      @parts = 4
      @x = 128
      @y = 160
      @head = true
      @snake_body = Array.new
      
      @parts.times do # For every part
        @snake_part = Hash.new
        @snake_part[:head] = @head
        @snake_part[:x] = @x
        @snake_part[:y] = @y
        @snake_body << @snake_part
        @x -= 16
        @head = false
      end
    end

    def draw(surface)
      @snake_body.each do |body_part|
        if body_part[:head]
          snake_surface = Sprite.load_image("./img/player1_head.bmp")
        else
          unless @rainbow
            snake_surface = Sprite.load_image("./img/player_body.bmp")
          else
            snake_surface = Sprite.load_image("./img/player_rainbow.bmp")
          end
        end
        Sprite.blit(snake_surface, surface, body_part[:x], body_part[:y])
      end
    end

    def move_head
      i = @snake_body.length - 1
      
      until i == 0
        @snake_body[i][:x] = @snake_body[i-1][:x]
        @snake_body[i][:y] = @snake_body[i-1][:y]
        i -= 1
      end
    end

    def move(direction) 
      @direction = direction

      case @direction
      when 1
        move_head
        @snake_body[0][:y] -= 16
      when 2 
        move_head
        @snake_body[0][:x] += 16
      when 3
        move_head
        @snake_body[0][:y] += 16
      when 4
        move_head
        @snake_body[0][:x] -= 16
      end
    end
    
    def add_parts(parts)
      @parts += parts
      parts.times do
        @snake_part = Hash.new
        @snake_part[:head] = false
        @snake_part[:x] = @snake_body[-1][:x]
        @snake_part[:y] = @snake_body[-1][:y]
        @snake_body << @snake_part
      end
    end

    def remove_parts(parts)
      unless @snake_body.length == 1
        @parts -= parts
        parts.times do
          @snake_body.pop
        end
      end
    end
  end
end
