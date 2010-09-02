module Admin
    class ColorController < ApplicationController
        def index
            @all_colors = Color.all
        end
    end
end
