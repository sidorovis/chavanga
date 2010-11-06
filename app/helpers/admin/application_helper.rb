# Methods added to this helper will be available to all templates in the application.
#module Admin

module Admin
module ApplicationHelper
    def admin_title_tag
        if ENV['RAILS_ENV'] == 'production'
            return "<title> Admin Chavanga - "+ 
                controller.controller_name.capitalize.split("_").join(" ") +
            "</title>"
        end
        return "<title> Admin Developming Localhost Chavanga - "+
                controller.controller_name.capitalize.split("_").join(" ") +
            "</title>"
    end
    def admin_main_menu_link_to( _name, link_path )
        link_to( 
                _name, 
                link_path,
                :class => 'main_menu'
                )
    end
    def admin_main_menu_button( _name, _controller_name, style_name = "main_menu_admin_button" )
        id = _name.split(" ").join("_")
        result = "<div class='" + style_name + "'> 
                    <div id='main_menu_td_"+id+"' class='main_menu_button_element'
            onmouseover='main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element_mouse_over\");'
            onmouseout='main_menu_td_"+id.to_s+".setAttribute(\"class\",\"main_menu_button_element\");' >"
        result += admin_main_menu_link_to( _name, { :controller => _controller_name } )
        result += "</div></div>";
    end

    def admin_main_menu_fishing_button( style_name = "main_menu_admin_button" )
        _name = "FISHING"
        id = _name
        _controller_name = { :controller => :fishing_programs }
        result = "<div class='" + style_name + "'> 
                    <div id='main_menu_td_"+id+"' class='main_menu_button_element'
                    onmouseover='showSubMenu(\"fishing_programs\");main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element_mouse_over\");' 
                    onmouseout='hideSubMenu(\"fishing_programs\");main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element\");'>"
        result += admin_main_menu_link_to( _name, _controller_name )
        result += "<div id='fishing_programs' class='drop_down_menu'>
             <div class='drop_down_menu_element'>
                <ul style='margin-left:-15px;'>"
        @menu_fishing_programs.each do |fp|
            result += "<li>"+ link_to( fp.title, [:admin,fp], :class => 'drop_down_main_menu' )
                fp.SubFishingPrograms.all(:conditions => { :visible => true } ).each do |sp|
                    result += "<ul style='margin-left:-15px;'><li>" + link_to( sp.title, [:admin,sp], :class => 'drop_down_main_menu' ) + "</li></ul>"
                end
            result += "</li>"
        end
        result += "</ul>
             </div></div></div></div>";

    end

    def admin_main_menu_gallery_button( style_name = "main_menu_admin_button" )
        _name = "GALLERY"
        id = _name
        _controller_name = [:admin,@gallery_group]
        result = "<div class='" + style_name + "'> 
                    <div id='main_menu_td_"+_name+"' class='main_menu_button_element'
                    onmouseover='showSubMenu(\"gallery_groups\");main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element_mouse_over\");' 
                    onmouseout='hideSubMenu(\"gallery_groups\");main_menu_td_"+id+".setAttribute(\"class\",\"main_menu_button_element\");'>"
        result += admin_main_menu_link_to( _name, _controller_name )
        result += "<div id='gallery_groups' class='drop_down_menu'>
                    <div class='drop_down_menu_element'>"
        result += render :partial => 'layouts/admin/gallery_drop_down_menu', :object => @gallery_group
        result += "</div></div>"+
                "</div></div>"
    end
end
end