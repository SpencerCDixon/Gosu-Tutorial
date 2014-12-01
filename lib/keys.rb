module Keys
  def button_down(id)
    case id
    when Gosu::MsLeft
      @locs << [mouse_x, mouse_y]
    end
  end
end
