require 'shellwords'

class Cow
  class << self
    def all
      lines = `cowsay -l`.split("\n")
      [].tap do |cows|
        lines[1..-1].each do |line|
          line.split.each do |c|
            cows << Cow.new(c)
          end
        end
      end
    end

    def get(name)
      all.detect{|cow|
        cow.name == name
      }
    end
  end
end

class Cow
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def say(string)
    `cowsay -f #{name} #{Shellwords.escape(string)}`
  end
end
