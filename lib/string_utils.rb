module StringUtils
  def self.money(money)
    "$#{money/100}.#{"%02d" % (money % 100)}"
  end
end