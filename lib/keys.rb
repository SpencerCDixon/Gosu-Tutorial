module Keys
  def button_down(id)
    case id
    when Gosu::MsLeft
      @mouse_locations << [mouse_x, mouse_y]
    end
  end
end
