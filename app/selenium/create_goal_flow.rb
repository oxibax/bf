require 'rubygems'
require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome

driver.navigate.to "https://oxi-goal-list.herokuapp.com/goals"
driver.manage.timeouts.implicit_wait = 500

new_goal_button = driver.find_element(:xpath, '//a[contains(@href, "/goals/new")]')

new_goal_button.click

wait = Selenium::WebDriver::Wait.new(timeout: 10)

wait.until { driver.find_element(:xpath, '//input[@name="goal[title]"]').displayed? }

title = driver.find_element(:xpath, '//input[@name="goal[title]"]')
title.click
title.send_keys 'Buy milk'

description = driver.find_element(:xpath, '//input[@name="goal[description]"]')
description.click
description.send_keys 'Description how I buy the milk'

priority = driver.find_element(:xpath, '//input[@name="goal[priority]"]')
priority.click
priority.send_keys 'low'

due_date = driver.find_element(:xpath, '//input[@name="goal[due_date]"]')
due_date.click
due_date.send_keys '11.02.2023'

create_goal_button = driver.find_element(:xpath, '//input[@type="submit"]')
create_goal_button.click

wait.until { driver.find_element(:xpath, '//dd[text()="Buy milk"]').displayed? }
driver.find_element(:xpath, '//dd[text()="Buy milk"]')

delete_button = driver.find_element(:xpath, '//a[@class="btn btn-danger"]')
delete_button.click

driver.quit