class ArrayTypecaster < Typecaster
  def typecast(value)
    value.split(',').map(&:strip)
  end
end