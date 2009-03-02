#!/usr/bin/env ruby

require 'sdl'

require File.dirname(__FILE__) + '/sprite'
require File.dirname(__FILE__) + '/helpers'

module JakeTheSnake
  include Sprite
  include Helpers

  class Snake
    sattr_reader :body
    sattr_writer :rainbow
    sattr_accessor :parts, :direction

    self.rainbow = false
    self.direction = 2
    self.parts = 4
    @x = 128
    @y = 160
    @body = Array.new
    @body << {:head => true, :x => @x, :y => @y}
    @head = body[0]

    @parts.times do
      snake_part = {:head => false, :x => @x, :y => @y}
      @body << snake_part
      @x -= 16
    end

    def self.draw(surface)
      @body.each do |body_part|
        if body_part[:head]
          snake_surface = Sprite::load_image("./img/player1_head.bmp")
        else
          unless @rainbow
            snake_surface = Sprite::load_image("./img/player_body.bmp")
          else
            snake_surface = Sprite::load_image("./img/player_rainbow.bmp")
          end
        end
        Sprite::blit(snake_surface, surface, body_part[:x], body_part[:y])
      end
    end

    def self.move_head
      i = @body.length - 1
      begin 
        @body[i][:x] = @body[i-1][:x]
        @body[i][:y] = @body[i-1][:y]
        i -= 1
      end until i == 0
    end

    def self.move(direction) 
      @direction = direction

      case @direction
      when 1
        move_head
        @head[:y] -= 16
      when 2 
        move_head
        @head[:x] += 16
      when 3
        move_head
        @head[:y] += 16
      when 4
        move_head
        @head[:x] -= 16
      end
    end

    def self.add_parts(parts)
      Log.debug("Adding snake parts")
      @parts += parts
      parts.times do
        snake_part = {:head => false, :x => @body[-1][:x], :y => @body[-1][:y]}
        @body << snake_part
      end
    end

    def self.remove_parts(parts)
      Log.debug("Removing snake parts")
      @parts -= parts
      parts.times do
        @body.pop
      end
    end
  end
end
