// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

logo_image_change_interval = 5000;
logo_image_size = 17;
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

function addCodeToFunction(func,code){
    if(func == undefined)
        return code;
    else{
        return function(){
            func();
            code();
        }
    }
}

window.onload = addCodeToFunction(window.onload,function() {
    setTimeout( 'changeLogoImage( 1 );', logo_image_change_interval )
});

function showSubMenu( menu_id )
{
    document.getElementById(menu_id).style.display = 'block';
}
function hideSubMenu( menu_id )
{
    document.getElementById(menu_id).style.display = 'none';
}
