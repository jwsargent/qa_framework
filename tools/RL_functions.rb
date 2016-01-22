def shirt_product_page_master
  test_640_breakpoint
  test_940_breakpoint
  verify_add_to_bag_button
  verify_size_chart
  verify_size_swatches
  verify_color_swatches
  verify_personalization_logo
  omniture_test
end

def nav_to_product_page
  visit 'http://localhost:8000/#/product/3175072'
  all('.product-brand-logo').length.should ==(1)
end

def test_640_breakpoint
  page.driver.browser.manage.window.resize_to(640, 1200)
  page.evaluate_script("$('.product-carousel-image')[0].clientWidth").should ==(294)
  page.evaluate_script("$('.product-carousel-image')[0].clientHeight").should ==(294)
  # test_size_chart_640
  # verify_first_accordion_open
  # verify_accordion_titles
  # verify_left_alignment_accordion_640
  puts '----Pages passes all 640 breakpoint tests----'
end

def test_940_breakpoint
  page.driver.browser.manage.window.resize_to(940, 1200)
  page.evaluate_script("$('.product-carousel-image')[0].clientWidth").should ==(432)
  page.evaluate_script("$('.product-carousel-image')[0].clientHeight").should ==(432)
  # test_size_chart_940
  # verify_first_accordion_open
  # verify_accordion_titles
  # verify_left_alignment_accordion_940
  puts '----Page passes all 940 breakpoint tests----'
end

def test_size_chart_640
  if ENV['DRIVER'].to_s.include? ('chrome')
    page.evaluate_script("$('.size-chart')[0].offsetLeft").should ==(188)
  elsif ENV['DRIVER'].to_s.include? ('firefox')
    page.evaluate_script("$('.size-chart')[0].offsetLeft").should ==(186)
  else
    page.evaluate_script("$('.size-chart')[0].offsetLeft").should ==(179)
  end
  puts 'text is right aligned'
end

def test_size_chart_940
  if ENV['DRIVER'].to_s.include? ('chrome')
    page.evaluate_script("$('.size-chart')[0].offsetLeft").should ==(326)
  elsif ENV['DRIVER'].to_s.include? ('firefox')
    page.evaluate_script("$('.size-chart')[0].offsetLeft").should ==(324)
  else
    page.evaluate_script("$('.size-chart')[0].offsetLeft").should ==(317)
  end
  puts 'text is right aligned'
end

def cyo_logo_size
  page.evaluate_script("$('img').clientWidth").should ==(131)
  page.evaluate_script("$('.product-brand-logo').clientHeight").should ==(35)
end

def verify_accordion_titles
  sleep 1
  all('.product-accordion').length.should ==(4)
  titles = ['SELECT YOUR DESIGN: USA DESIGN:USA', 'COLOR & SIZE: BLACK W/ RED', 'ENTER MONOGRAM: LEGACY 4', 'ENTER QUANTITY: 1 - +']
  iter = 0
  while iter < all('.product-accordion').length
    all('.product-accordion', visible: true)[iter].text.should ==(titles[iter])
    puts 'Verified text for ' + titles[iter]
    iter += 1
  end
end

def verify_size_swatches
  within('.size-listing', visible: true) do
    all('.size-swatch-item', visible: true).length.should ==(5)
  end
  puts 'size swatches'
end

def verify_color_swatches #TODO will not work until first in list
  all('.swatch-item', visible: true).length.should ==(9)
  all('.swatch-item.active', visible: true).length.should ==(2)
  puts 'color swatches'
end

# def color_swatches_clickable
#   iter = 1
#   while iter < all('.swatch-item').length do
#     find('.swatch-item')[iter].click
#     all('.swatch-item')[iter-1].include?('.active')
#     iter +=1
#     puts 'clicked on swatch'
#   end
# end


def verify_left_alignment_accordion_640
  # page.evaluate_script("$('.add-to-cart-button').offsetLeft").should ==(97)
  page.evaluate_script("document.querySelector('.product-accordion').offsetLeft;").should ==(333)
  if ENV['DRIVER'].to_s.include? ('chrome')
    if all('.promotion-banner', visible: true).length ==(0)
      page.evaluate_script("document.querySelector('.product-accordion').offsetTop;").should ==(191)
    else
      page.evaluate_script("document.querySelector('.product-accordion').offsetTop;").should ==(294)
    end
  elsif ENV['DRIVER'].to_s.include? ('safari')
    page.evaluate_script("document.querySelector('.product-accordion').offsetTop;").should ==(314)
  else
    page.evaluate_script("document.querySelector('.product-accordion').offsetTop;").should ==(294)
  end
  puts 'accordion on left and at top'
end

def verify_left_alignment_accordion_940
  # page.evaluate_script("$('.add-to-cart-button').offsetLeft").should ==(97)
  page.evaluate_script("document.querySelector('.product-accordion').offsetLeft;").should ==(489)
  if ENV['DRIVER'].to_s.include? ('chrome')
    if all('.promotion-banner', visible: true).length ==(1)
      page.evaluate_script("document.querySelector('.product-accordion').offsetTop;").should ==(312)
    else
      page.evaluate_script("document.querySelector('.product-accordion').offsetTop;").should ==()
    end
  # elsif ENV['DRIVER'].to_s.include? ('safari')
  #   page.evaluate_script("document.querySelector('.product-accordion').offsetTop;").should ==(314)
  # else
    page.evaluate_script("document.querySelector('.product-accordion').offsetTop;").should ==(312)
  end
  puts 'accordion on left and at top'
end

def verify_first_accordion_open
  sleep 1
  all('.title.open').length.should ==(1)
  puts '----First accordion is open on page load----'
end

def verify_add_to_bag_button
  all('.add-to-cart-button', visible: true).length.should ==(1)
  find('.add-to-cart-button', visible: true)[:value].should ==('Add To Shopping Bag')
end

def verify_size_chart #TODO will not work until accordion open by default
  first('.icon-rl-plus', visible: true).click
  all('.size-chart', visible: true).length.should ==(1)
  find_link('Size Chart')[:href].should == 'http://www.ralphlauren.com/contentPopup/index.jsp?productId=3175072&showSizeChart&ab=Sizechart&MobileOptOut=1'
  puts '----Size Chart is present and on the right----'
end

def omniture_test #TODO change when real ominiture deployed
  # first('.icon-rl-plus', visible: true).click
  page.evaluate_script("s.events").include? 'event44'
  puts 'event 44 present upon accordion click'
  # first('.icon-rl-minus', visible: true).click
  # !page.evaluate_script("s.events").include? 'event44'
  # puts 'event 44 not present upon clicking minus to close accordion'
  puts 'ominiture'
end

def verify_personalization_logo
  all('.product-brand-logo').length.should ==(1)
  puts 'personalization logo'
end
