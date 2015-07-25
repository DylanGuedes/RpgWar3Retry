module ApplicationHelper
  def in_percentage max, min
    return 100*min/max
  end
end
