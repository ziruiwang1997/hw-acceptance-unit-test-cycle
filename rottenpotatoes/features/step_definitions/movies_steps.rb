Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  movie = Movie.find_by_title(arg1)
  expect(movie.director).to eq arg2
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  expect(page.body).to match(regexp)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  expect(page).to have_css("table#movies tbody tr", count: Movie.count)
end