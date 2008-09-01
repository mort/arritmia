Factory.define :user do |f|
  f.login 'mort'
  f.email 'manuel@simplelogica.net'
  f.salt '7e3041ebc2fc05a40c60028e2c4901a81035d3cd'
  f.crypted_password '00742970dc9e6319f8019fd54864d3ea740f04b1' # test
  f.created_at  5.days.ago.to_s(:db)
end

Factory.define :unit do |f|
  f.body 'a'
  f.created_at Time.now
end