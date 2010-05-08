// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function change_fishing_program_image( object, image_name )
{
    // alert( object );
    // alert( image_name );
}

function show_full_image( image_tag )
{
    handler_div = document.getElementById('photo_zoomer_handler');
    zoomer_div = document.getElementById('photo_zoomer');
    window_size = document.body.clientWidth - 100;
    inner_html = '<img src="'+image_tag+'" width='+window_size+' />';
    zoomer_div.innerHTML = inner_html;
    handler_div.style.left = '50px';
    handler_div.style.right = 'auto';
    y_place = window.pageYOffset+7;
    handler_div.style.top = y_place+'px';
    handler_div.style.bottom = 'auto';
    handler_div.style.position = 'absolute';
    handler_div.style.display = 'block';
}