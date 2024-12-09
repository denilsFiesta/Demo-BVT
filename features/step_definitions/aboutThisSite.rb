# Then I should see a list of the following technologies:
Then('I should see a list of the following technologies:') do |table|
  expected_technologies = table.raw.flatten
  technologies_list = all(:xpath, '/html/body/div/center/table/tbody/tr[2]/td[1]/blockquote/ul/li')
  expect(technologies_list.count).to eq(expected_technologies.count)
  expected_technologies.each_with_index do |technology, index|
    expect(technologies_list[index].text.strip).to eq(technology)
  end
end

  