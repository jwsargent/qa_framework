def nav_to_case_study
  find('.caseStudyLink').click
  puts 'case study'
  sleep 2
  binding.pry
  within('.clear', visible: true) do
    find('.clear').click
  end
  puts 'close'
  # find_element(:class, 'close').click
  sleep 3
  find('.watch').click
  puts 'Video Plays'
  sleep 5
  find('.coverUp').click
  puts 'Test Complete'
end
