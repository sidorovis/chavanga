class PressController < ApplicationController
    def title
        return "Press - " + action_name.capitalize.split("_").join(" ") if (action_name != "index")
        return "Press"
    end
    def index
    end
    def partir_pecher
    end
    def peshe_mouche
    end
    def wedkarstwo39
    end
    def wedkarstwo56
    end
end
