require 'base64'

class Hodor
  def self.hodor(str)
    base64 = Base64.encode64(str)
    result = ''
    0.upto(base64.size-1) do |i|
      if base64[i] == '='
        result << '!'
      elsif result == ''
        result << to_hodor(base64[i])
      elsif result[-1] != "\n" && Random.rand(20) == 0
        result << "\n#{to_hodor(base64[i])}"
      else
        result << " #{to_hodor(base64[i])}"
      end
    end
    result
  end

  def self.hodorhodor(str)
    base64 = ''
    str.each_line do |line|
      line.split(/\s+/).each do |hodor|
        base64 << from_hodor(hodor)
      end
    end
    Base64.decode64(base64)
  end

  def self.to_hodor(ch)
    if ch >= 'A' && ch <= 'Z'
      val = ch.ord - 'A'.ord
    elsif ch >= 'a' && ch <= 'z'
      val = ch.ord - 'a'.ord + 26
    elsif ch >= '0' && ch <= '9'
      val = ch.ord - '0'.ord + 52
    elsif ch == '+'
      val = 62
    else
      val = 63
    end
    result = 'hodor'
    4.downto(0) do |i|
      result[i] = result[i].upcase if val & (1 << i) != 0
    end
    if val & (1 << 5) != 0
      result << %w(, . ... ;)[Random.rand(4)]
    end
    result
  end

  def self.from_hodor(hodor)
    # ! translates to =
    if hodor[hodor.size-1] == '!'
      return "#{from_hodor(hodor[0,hodor.size-1])}="
    end

    # If it's a hodor with punctuation, the 6th bit is 1
    val = hodor.size > 5 ? (1 << 5) : 0

    4.downto(0) do |i|
      val = val | (1 << i) if hodor[i] == hodor[i].upcase
    end
    if val >= 0 && val < 26
      (val+'A'.ord).chr
    elsif val >= 26 && val < 52
      (val-26+'a'.ord).chr
    elsif val >= 52 && val < 62
      (val-52+'0'.ord).chr
    elsif val == 62
      '+'
    else
      '/'
    end
  end
end
