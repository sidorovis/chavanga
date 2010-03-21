class MapsController < ApplicationController
  def index
  end

  def habarovsk_region
    @group = ImageGalleryGroup.find(:first, :conditions => { :id => 45 })
  end


  def kamchatka_peninsula
    @group = ImageGalleryGroup.find(:first, :conditions => { :id => 46 })
  end

  def kola_peninsula
    @group = ImageGalleryGroup.find(:first, :conditions => { :id => 47 })
  end

end
