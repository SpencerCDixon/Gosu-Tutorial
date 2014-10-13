module Keys
  def button_down(id)
    case id
    when id == Gosu::KbUp
      puts "Up"
    when id == Gosu::KbDown
      puts "Down"
    when id == Gosu::KbLeft
      puts "Left"
    when id == Gosu::KbRight
      puts "Right"
    end
  end

  def button_up(id)
    case id
    when id == Gosu::KbUp
      puts "Up"
    when id == Gosu::KbDown
      puts "Down"
    when id == Gosu::KbLeft
      puts "Left"
    when id == Gosu::KbRight
      puts "Right"
    end
  end
end
