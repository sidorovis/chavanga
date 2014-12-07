module ApplicationHelper

    def title_tag        
        result = "<title>"
        if (ENV['RAILS_ENV'] == 'production')
            result += "Chavanga - "
        else
            result += "Development Localhost Chavanga - "
        end
        result += controller.title
        return result + "</title>"
    end
    def description_tag
        "<meta name=\"Description\" content=\"" + controller.description + "\">"
    end
    def keywords_tag
        "<meta name=\"Keywords\" content=\"" + controller.keywords + "\">"
    end
    def main_menu_link_to( _name, link_path )
        link_to( 
                _name, 
                link_path,
                :class => 'main_menu'
                )
    end
    def main_menu_button( _name, _controller_name )
        id = _name.split(" ").join("_")
        result = 
"<div class='main_menu_button'>" +
    "<div id='main_menu_td_"+id+"' class='main_menu_button_element'"+
    "onmouseover='document.getElementById(\"main_menu_td_"+id.to_s+"\").setAttribute(\"class\",\"main_menu_button_element_mouse_over\");'"+
    "onmouseout='document.getElementById(\"main_menu_td_"+id.to_s+"\").setAttribute(\"class\",\"main_menu_button_element\");' >"
        result += main_menu_link_to( _name, { :controller => _controller_name } )
        result += "</div></div>";
    end

    def main_menu_fishing_button(  )
        _name = "FISHING TOURS"
        id = _name
        _controller_name = { :controller => :fishing }
        result = "<div class='main_menu_button'>"+
                    "<div id='main_menu_td_"+id+"' class='main_menu_button_element'"+
                    "onmouseover='showSubMenu(\"fishing_programs\");document.getElementById(\"main_menu_td_"+id+"\").setAttribute(\"class\",\"main_menu_button_element_mouse_over\");' "+
                    "onmouseout='hideSubMenu(\"fishing_programs\");document.getElementById(\"main_menu_td_"+id+"\").setAttribute(\"class\",\"main_menu_button_element\");'>"
        result += main_menu_link_to( _name, _controller_name )
        result += "<div id='fishing_programs' class='drop_down_menu'>"+
             "<div class='drop_down_menu_element'>"+
                "<ul style='margin-left:-15px;'>"
        @menu_fishing_programs.each do |fp|
            result += "<li>"
    	    result += image_tag(@all_images[ (rand()*@all_images.size).to_i ].photo.url(:small), :height => 20 )
    	    result += "&nbsp;&nbsp;"
			if ( fp.page_content == "" )
				result += "<big>" + fp.title + "</big>"
			else
            	result += "<big>" + link_to( fp.title, fp, :class => 'drop_down_main_menu' ) + "</big>"
            end
			if (Time.now - fp.created_at < 4.month)
                result += image_tag('home/new.png')
            end
                fp.SubFishingPrograms.all(:conditions => { :visible => true } ).each do |sp|
                    result += "<ul style='margin-left:-15px;'><li>"
                    result += image_tag(@all_images[ (rand()*@all_images.size).to_i ].photo.url(:small), :height => 20 )
                    result += "&nbsp;&nbsp;<big>"
                    result += link_to( sp.title, sp, :class => 'drop_down_main_menu' );
                    result += "</big></li></ul>"
                end
            result += "</li>"
        end
        result += "</ul></div></div></div></div>";

    end

    def main_menu_gallery_button()
        _name = "GALLERY"
        id = _name
        _controller_name = @gallery_group
        result = raw("<div class='main_menu_button'>"+
                    "<div id='main_menu_td_"+_name+"' class='main_menu_button_element'"+
                    "onmouseover='showSubMenu(\"gallery_groups\");document.getElementById(\"main_menu_td_"+id+"\").setAttribute(\"class\",\"main_menu_button_element_mouse_over\");' "+
                    "onmouseout='hideSubMenu(\"gallery_groups\");document.getElementById(\"main_menu_td_"+id+"\").setAttribute(\"class\",\"main_menu_button_element\");'>")
        result += main_menu_link_to( _name, _controller_name )
        result += raw("<div id='gallery_groups' class='drop_down_menu'>"+
                    "<div class='drop_down_menu_element'>")
        result += raw(render :partial => 'layouts/gallery_drop_down_menu', :object => @gallery_group)
        result += raw("</div></div>"+
                "</div></div>")
        
    end
    
    def weather_widget
        if ENV['RAILS_ENV'] == 'production'
            return raw('<iframe id="WeatherBugSticker_125x125_v2" src="http://weather.weatherbug.com/desktop-weather/web-widgets/getSticker.html?CityCode=74463&ZCode=z5545&Size=125x125&StationID=ULMM&units=1&Version=2" width="123" height="70" frameborder="0" scrolling="no" allowtransparency="yes"></iframe> ');
        end
        return ""
    end
    
    def counter_widget
        if ENV['RAILS_ENV'] == 'production'
            return raw('<img src="http://www.easycounter.com/counter.php?rilley_elf" border="0" alt="visit counter">');
        end
        return ""
    end
    
    def resizer_module()
        result = raw javascript_include_tag "image_resizer"
        result += raw(
"<div style='display:none;position:fixed;background-color:white' 
    onclick=\"this.style.display='none';\" 
    onmouseover=\"document.body.style.cursor = 'pointer';\",
    onmouseout=\"document.body.style.cursor = 'default';\"
    id='photo_zoomer_handler'>
  <table bgcolor=black><tr><td bgcolor=white><p align=center><b>Click to hide</b></p>
    <div id='photo_zoomer'>
    </div>
  </td></tr></table>
</div>")
    end
    def print_gallery_drop_down_menu_group( group )
        if group.visible
            return raw("<ul style='margin-left:-15px;'>" + render(:partial=>'layouts/admin/gallery_drop_down_menu', :object => group) +"</ul>")
        end
        ""
    end
    def print_gallery_drop_down_menu_link gallery_drop_down_menu
        result = "<li>"+ link_to(gallery_drop_down_menu.title, [:admin,gallery_drop_down_menu], :class => 'drop_down_main_menu')
        result += raw(image_tag('home/new.png')) if Time.now - gallery_drop_down_menu.created_at < 4.month
        result += raw("</li>")
        
    end
    def show_banner( banner )
        result = link_to( banner.value, banner.href, :alt => banner.alt, :class => 'banner' )
        if (banner.image && banner.image.size != 0)
            result += raw(image_tag( banner.image ))
        end
        result
    end
    def id_tags( str, image_tag_params = {}, params = nil )
        r = Regexp.new( /\[(\d+)\]/ )
        while (match = str.match( r ))
            index = match[1]
            image = ImageGalleryImage.all( :conditions => {:id => index} )
            if (image.size > 0)
                str[r] = raw(image_tag( image[0].photo.url( params ), image_tag_params ))
            else
                str[r] = ""
            end
        end
        raw str
    end
end
