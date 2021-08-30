require 'json'
require 'open-uri'

url = 'https://opendata.paris.fr/api/records/1.0/search/?dataset=liste-des-ehpad&q=&rows=50&facet=nom_de_l_ehpad&facet=adresse&facet=ville&facet=code_postal'
serialized_url = URI.open(url).read
ehpad_infos = JSON.parse(serialized_url)

ehpad_infos['records'].each do |info|
  puts "#{info['fields']['nom_de_l_ehpad']}, #{info['fields']['adresse']}, #{info['fields']['code_postal']}, #{info['fields']['ville']}. tel: #{info['fields']['telephone']} "
end
