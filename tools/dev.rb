def nav_to_page

  # visit 'http://www.tonicdesign.com'
  driver.navigate.to 'http://www.tonicdesign.com'
  driver.find_element(:class, 'caseStudyLink').click
  sleep 4
  driver.find_element(:class, 'close').click
  sleep 3
  driver.find_element(:class, 'watch').click
  puts 'Video Plays'
  sleep 5
  driver.find_element(:class, 'coverUp').click

  puts 'Test Complete'
  driver.quit
end
