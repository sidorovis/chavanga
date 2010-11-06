module ApplicationHelper
    def title_tag
        if ENV['RAILS_ENV'] == 'production'
            return "<title> Chavanga - "+ 
                controller.controller_name.capitalize.split("_").join(" ") +
            "</title>"
        end
        return "<title> Developming Localhost Chavanga - "+
                controller.controller_name.capitalize.split("_").join(" ") +
            "</title>"
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
        result = "<div class='main_menu_button'>
                    <div id='main_menu_td_"+id+"' class='main_menu_button_element'
            onmouseover='main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element_mouse_over\");'
            onmouseout='main_menu_td_"+id.to_s+".setAttribute(\"class\",\"main_menu_button_element\");' >"
        result += main_menu_link_to( _name, { :controller => _controller_name } )
        result += "</div></div>";
    end

    def main_menu_fishing_button(  )
        _name = "FISHING"
        id = _name
        _controller_name = { :controller => :fishing }
        result = "<div class='main_menu_button'>
                    <div id='main_menu_td_"+id+"' class='main_menu_button_element'
                    onmouseover='showSubMenu(\"fishing_programs\");main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element_mouse_over\");' 
                    onmouseout='hideSubMenu(\"fishing_programs\");main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element\");'>"
        result += main_menu_link_to( _name, _controller_name )
        result += "<div id='fishing_programs' class='drop_down_menu'>
             <div class='drop_down_menu_element'>
                <ul style='margin-left:-15px;'>"
        @menu_fishing_programs.each do |fp|
            result += "<li>"+ link_to( fp.title, fp, :class => 'drop_down_main_menu' )
                fp.SubFishingPrograms.all(:conditions => { :visible => true } ).each do |sp|
                    result += "<ul style='margin-left:-15px;'><li>" + link_to( sp.title, sp, :class => 'drop_down_main_menu' ) + "</li></ul>"
                end
            result += "</li>"
        end
        result += "</ul>
             </div></div></div></div>";

    end

    def main_menu_gallery_button()
        _name = "GALLERY"
        id = _name
        _controller_name = @gallery_group
        result = "<div class='main_menu_button'>
                    <div id='main_menu_td_"+_name+"' class='main_menu_button_element'
                    onmouseover='showSubMenu(\"gallery_groups\");main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element_mouse_over\");' 
                    onmouseout='hideSubMenu(\"gallery_groups\");main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element\");'>"
        result += main_menu_link_to( _name, _controller_name )
        result += "<div id='gallery_groups' class='drop_down_menu'>
                    <div class='drop_down_menu_element'>"
        result += render :partial => 'layouts/gallery_drop_down_menu', :object => @gallery_group
        result += "</div></div>"+
                "</div></div>"
        
    end
    
    def weather_widget
        if ENV['RAILS_ENV'] == 'production'
            return '<iframe id="WeatherBugSticker_125x125_v2" src="http://weather.weatherbug.com/desktop-weather/web-widgets/getSticker.html?CityCode=74463&ZCode=z5545&Size=125x125&StationID=ULMM&units=1&Version=2" width="123" height="70" frameborder="0" scrolling="no" allowtransparency="yes"></iframe> ';
        end
        return ""
    end
    
    def counter_widget
        if ENV['RAILS_ENV'] == 'production'
            return '<img src="http://www.easycounter.com/counter.php?rilley_elf" border="0" alt="visit counter">';
        end
        return ""
    end
    
    def resizer_module
        result = javascript_include_tag "image_resizer"
        result += 
"<div style='display:none;position:fixed;background-color:white' 
    onclick=\"this.style.display='none';\" 
    onmouseover=\"document.body.style.cursor = 'pointer';\",
    onmouseout=\"document.body.style.cursor = 'default';\"
    id='photo_zoomer_handler'>
  <table bgcolor=black><tr><td bgcolor=white><p align=center><b>Click to hide</b></p>
    <div id='photo_zoomer'>
    </div>
  </td></tr></table>
</div>
"
    end
    def show_banner( banner )
        result = link_to( banner.value, banner.href, :alt => banner.alt, :class => 'banner' )
        if (banner.image && banner.image.size != 0)
            result += image_tag( banner.image )
        end
        result
    end
end
