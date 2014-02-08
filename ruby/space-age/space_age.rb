class SpaceAge
  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def orbital_periods
    {
     earth: 1.0,
     mercury: 0.2408467,
     venus: 0.61519726,
     mars: 1.8808158,
     jupiter: 11.862615,
     saturn: 29.447498,
     uranus: 84.016846,
     neptune: 164.79132
    }
  end

  def on_earth
    year_seconds = 31557600 * orbital_periods[:earth]
    (seconds / year_seconds).round(2)
  end

  def on_mercury
    year_seconds = 31557600 * orbital_periods[:mercury]
    (seconds / year_seconds).round(2)
  end

  def on_venus
    year_seconds = 31557600 * orbital_periods[:venus]
    (seconds / year_seconds).round(2)
  end

  def on_mars
    year_seconds = 31557600 * orbital_periods[:mars]
    (seconds / year_seconds).round(2)
  end

  def on_jupiter
    year_seconds = 31557600 * orbital_periods[:jupiter]
    (seconds / year_seconds).round(2)
  end

  def on_saturn
    year_seconds = 31557600 * orbital_periods[:saturn]
    (seconds / year_seconds).round(2)
  end

  def on_uranus
    year_seconds = 31557600 * orbital_periods[:uranus]
    (seconds / year_seconds).round(2)
  end

  def on_neptune
    year_seconds = 31557600 * orbital_periods[:neptune]
    (seconds / year_seconds).round(2)
  end

end
