# string.rb
class String
  def i?
    !(self =~ /\A[-+]?[0-9]+\z/).nil?
  end
end
