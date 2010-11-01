require 'rss/2.0'
require 'open-uri'

class HomeController < ApplicationController
  private
    def get_title doc
        doc.elements.each("rss/channel/item/title") { |element| return element.text }
    end
    def get_link doc
        doc.elements.each("rss/channel/item/link") { |element| return element.text }
    end
    def get_description doc
        doc.elements.each("rss/channel/item/atom:summary") { |element| return element.text }
    end
    def get_data
        response = open("http://blog.chavanga.com/feeds/posts/default?alt=rss").read
        doc = REXML::Document.new( response )
        title = get_title doc
        link = get_link doc
        description = get_description doc
        [title, link, description]
    end
  public
    def load_news_from_blog
        @title, @link, @description = get_data
        render :partial => 'news'
    end
  
    def index
    end

end
