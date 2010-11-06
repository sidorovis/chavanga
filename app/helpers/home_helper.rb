module HomeHelper
    def generate_link_to_image(bn)
        if bn.image_link
            return "<img src='" + bn.image_link.to_s + "' width='200' />"
        end
        return ""
    end
    def generate_news_div
        
    end
end
