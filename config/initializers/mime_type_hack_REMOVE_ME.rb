# I should be fixed in 2.3.3, remove me then please
# FIXME
# https://rails.lighthouseapp.com/projects/8994-ruby-on-rails/tickets/2658
# https://rails.lighthouseapp.com/projects/8994/tickets/2784-private-method-split-called-for-mimetype0x226f618


module Mime

class Type

def split(*args)
  to_s.split(*args)
end

end

end