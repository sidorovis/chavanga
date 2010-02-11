// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

logo_image_change_interval = 5000;
logo_image_size = 12;
logo_pictures = new Array();
for( i = 0 ; i < logo_image_size ; i++)
{
    logo_pictures[i] = new Image()
    logo_pictures[i].src = '/images/logo/1A-'+(i+1)+'.jpg';
}

function changeLogoImage(i)
{
    document.logo_image.src = logo_pictures[i].src;
    if (i == logo_pictures.length - 1) i = -1;
    nextImageFunc = "changeLogoImage( "+(i+1)+" );";
    setTimeout( nextImageFunc, logo_image_change_interval );
}

window.onload = addCodeToFunction(window.onload,function() {
    setTimeout( 'changeLogoImage( 1 );', logo_image_change_interval )
});
