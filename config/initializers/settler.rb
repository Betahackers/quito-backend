class ArrayTypecaster < Typecaster
  def typecast(value)
    value.split(',').map(&:strip)
  end
end

class TranslatedHashTypecaster < Typecaster
  def typecast(value)
    values = value.split(',').map(&:strip)
    hash = {}
    values.each {|v| hash[v] = I18n.t(v)}
    hash
  end
end