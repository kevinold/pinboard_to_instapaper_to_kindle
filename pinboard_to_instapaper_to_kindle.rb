require 'httparty'
require 'mechanize'
require 'highline/import'
require 'pp'
require 'yaml'

INSTAPAPER = "http://www.instapaper.com"
CONFIG = YAML.load_file("#{File.dirname(__FILE__)}/config.yml")

def add_to_instapaper(url, title)
  puts "Adding '#{title}' to instapaper..."
  response = HTTParty.post('https://www.instapaper.com/api/add',
  :basic_auth => {
    :username => CONFIG["instapaper_username"],
    :password => CONFIG["instapaper_password"]
  },
  :default_params => {
    :url => url,
    :title => title
  })
end

def resave_to_pinboard(url, title, tags)
  puts "Resaving '#{title}' to pinboard..."
  response = HTTParty.get('https://api.pinboard.in/v1/posts/add',
  :basic_auth => {
    :username => CONFIG["pinboard_username"],
    :password => CONFIG["pinboard_password"]
  },
  :default_params => {
    :url => url,
    :title => title,
    :description => title,
    :tags => tags.join(' '),
    :replace => 'yes'
  })
  #puts response.body, response.code, response.message, response.headers.inspect
end

def pinboard_to_instapaper

  toread_bookmarks = HTTParty.get("http://feeds.pinboard.in/json/v1/u:#{CONFIG['pinboard_username']}/t:toread")

  # Push the first 20 to instapaper
  toread_bookmarks.shift(20).each do |b|
    url = b['u']
    title = b['d']
    tags = b['t']

    # pinboard stores tags with space at the end, just double checking here
    tags.delete('toread')
    tags.delete('toread ')

    # Add instalicousd tag
    tags.push('instaliciousd')

    add_to_instapaper(url, title)
    resave_to_pinboard(url, title, tags)
  end
end

def instapaper_to_kindle

  # Use mechanize to drive instapaper
  a = Mechanize.new { |agent| agent.redirect_ok = 1, agent.user_agent_alias = 'Mac FireFox' }

  a.get("#{INSTAPAPER}/user/login") do |page|
  
    puts "Logging into instapaper..."
    instapaper = page.form_with(:action => '/user/login') do |f|
      f.username = CONFIG["instapaper_username"]
      f.password = CONFIG["instapaper_password"]
    end.click_button
    puts "Logged into instapaper"

    kindle_page = a.get("#{INSTAPAPER}/user/kindle")
    puts "Sending to Kindle now..."
    kindle_page.form_with(:action => '/user/kindle_send_now').submit
    
    unread_page = a.get("#{INSTAPAPER}/u")
    unread_page.form_with(:action => '/bulk-archive').submit
    puts "Stories archived!"

  end
end

pinboard_to_instapaper
instapaper_to_kindle
