$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  directors_arr = []
  directors_count = 0 
  
  while directors_count < source.length
    directors_arr << source[directors_count][:name]
    directors_count += 1
  end
  directors_arr
end

def total_gross(source)
  running_total = 0
  director_index = 0 
  list_var = list_of_directors(source)
  dir_total_var = directors_totals(source)
  
  while director_index < dir_total_var.length
    running_total += dir_total_var[list_var[director_index]]
    director_index += 1
  end

  running_total
end

def movies_with_directors_set(source)


end

test =[{:name=>"Stephen Spielberg",
  :movies=>
   [{:title=>"Jaws",
     :studio=>"Universal",
     :worldwide_gross=>260000000,
     :release_year=>1975},
    {:title=>"Close Encounters of the Third Kind",
     :studio=>"Columbia",
     :worldwide_gross=>135189114,
     :release_year=>1977},
    {:title=>"Raiders of the Lost Ark",
     :studio=>"Paramount",
     :worldwide_gross=>248159971,
     :release_year=>1981},
    {:title=>"E.T. the Extra-terrestrial",
     :studio=>"Universal",
     :worldwide_gross=>435110554,
     :release_year=>1982}]},
     {:name=>"Francis Ford Coppola",
  :movies=>
   [{:title=>"The Godfather",
     :studio=>"Paramount",
     :worldwide_gross=>134966411,
     :release_year=>1972},
    {:title=>"Apocalypse Now",
     :studio=>"MGM",
     :worldwide_gross=>83471511,
     :release_year=>1979}]}]
     
require 'pp'

pp directors_database


     
# Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total

