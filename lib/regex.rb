module Regex
  # ganked from Restful Auth
  EMAIL_NAME   = '[\w\.%\+\-]+'                          # what you actually see in practice
  #EMAIL_NAME   = '0-9A-Z!#\$%\&\'\*\+_/=\?^\-`\{|\}~\.' # technically allowed by RFC-2822
  DOMAIN_HEAD  = '(?:[A-Z0-9\-]+\.)+'
  DOMAIN_TLD   = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  EMAIL_OK     = /\A#{EMAIL_NAME}@#{DOMAIN_HEAD}#{DOMAIN_TLD}\z/i
end