Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert false, "Unimplmemented"
end

Then /I should (not )?see the movies: (.*)/ do |_not, movie_list|
  movie_list.split(", ").each do |movie|
    step %{I should #{_not}see "#{movie}"}
  end
end

When /I (un)?check the following ratings: (.*)/ do |un, rating_list|
  rating_list.split(", ").each do |rating|
    step %{I #{un}check "ratings_#{rating}"}
  end
end

When /I (un)?check all the ratings/ do |un|
  step %{I #{un}check the following ratings: PG, R, G, PG-13, NC-17}
end
