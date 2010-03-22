# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def main_menu_link_to( _name, link_path )
        link_to( 
                _name, 
                link_path, 
                :class => 'main_menu',
                :onmouseover=>
"main_menu_td_"+_name+".setAttribute('class','main_menu_button_mouse_over');",
                :onmouseout=>
"main_menu_td_"+_name+".setAttribute('class','main_menu_button_mouse_out');"
                )
    end
    def main_menu_button( _name, _controller_name )
        result = "<td width='14%' id='main_menu_td_"+_name+"' class='main_menu_button_mouse_out' >"
        result += main_menu_link_to( _name, { :controller => _controller_name } )
        result += "</td>";
    end
    
    def main_menu_fishing_button(  )
        _name = "FISHING"
        _controller_name = { :controller => :fishing }
        result = "<td width='14%' id='main_menu_td_"+_name+"' class='main_menu_button_mouse_out' 
                        onmouseover='showSubMenu(\"fishing_programs\");' onmouseout='hideSubMenu(\"fishing_programs\");'>
                        <table align='center'><tr><td>"
        result += main_menu_link_to( _name, _controller_name )
        result += "
            <div id='fishing_programs' class='drop_down_menu'>
                <table><tr><td>
                <ul style='margin-left:-15px;'>"
        @menu_fishing_programs.each do |fp|
            result += "<li>"+ link_to( fp.title, fp, :class => 'main_menu' )
                fp.SubFishingPrograms.all(:conditions => { :visible => true } ).each do |sp|
                    result += "<ul style='margin-left:-15px;'><li>" + link_to( sp.title, sp, :class => 'main_menu' ) + "</li></ul>"
                end
            result += "</li>"
        end
        result += " </ul></td><td width='5'> </td>
                    </tr></table>
            </div></td></tr></table> 
            </td>";
    end
    
    def main_menu_gallery_button()
        _name = "GALLERY"
        _controller_name = @gallery_group
        result = "<td width='14%' id='main_menu_td_"+_name+"' class='main_menu_button_mouse_out' 
                        onmouseover='showSubMenu(\"gallery_groups\");' onmouseout='hideSubMenu(\"gallery_groups\");'>
                    <table align='center'><tr><td>"
        result += main_menu_link_to( _name, _controller_name )
        result += 
            "<div id='gallery_groups' class='drop_down_menu'>
                    <table><tr><td>"
        result += render :partial => 'layouts/gallery_drop_down_menu', :object => @gallery_group
        result += "</td><td width='5'> </td></tr></table>
                    </div>
                    </td></tr></table>
                </td>"
        
    end
    
    def weather_widget
        if ENV['RAILS_ENV'] == 'production'
            return '<div align="center"><script src="http://www.weatherforecastmap.com/weather100.php?zona=russia_murmansk"></script></div>'
        end
        return ""
    end
end
