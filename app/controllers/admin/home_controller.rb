require 'rss/2.0'
require 'open-uri'

module Admin
    class HomeController < ApplicationController

    before_filter :set_blog_news_count
    def set_blog_news_count
        @blogNewsCount = 12
    end 
    class BlogNews
        attr_reader :title, :link, :description, :image_link
        def initialize( title, link, description )
            @title, @link, @description = title, link, description
            @image_link = get_image( link )
        end
        def get_image( link )
            data = open(link).read

            ind_begin = data.index("<img")
            href_begin = data.index("src=", ind_begin)+5
            ind_end = data.index("\"",href_begin)
            image_link = data[ href_begin, ind_end - href_begin ]
            if image_link.include?("blogspot.com")
                return image_link
            end
            return nil
        end
    end
  private
    def get_data_from_src( doc, type )
        data_array = []
        doc.elements.each( "rss/channel/item/" + type ) { |element| data_array << element.text }
        data_array
    end
    def getBlogNews
        response = open("http://blog.chavanga.com/feeds/posts/default?alt=rss").read
        doc = REXML::Document.new( response )
        titles = get_data_from_src( doc, "title" )
        links = get_data_from_src( doc, "link" )
        descriptions = get_data_from_src( doc, "atom:summary" )
        max = (@blogNewsCount < titles.size ? @blogNewsCount : titles.size)
        result = []
        (0..max-1).each { |i| result << BlogNews.new( titles[i], links[i], descriptions[i] ) }
        result
    end
  public
    def load_news_from_blog
        begin
            @blogNews = getBlogNews
            render :partial => 'news'
        rescue
            @blogNews = []
            render :partial => 'news'
        end
    end
  
    def index
    end

    end
end
