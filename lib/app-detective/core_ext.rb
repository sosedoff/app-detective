class Array
  def include_all?(values)
    (values - self).empty?
  end

  def include_any?(values)
    (self & values).any?
  end
end

class Hash
  def include_all?(keys)
    self.keys.include_all?(keys)
  end

  def include_any?(keys)
    self.keys.include_any?(keys)
  end
end