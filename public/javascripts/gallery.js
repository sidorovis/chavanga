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
    inner_html = '<img src="'+image_tag+'" width=650 />';
    zoomer_div.innerHTML = inner_html;
    handler_div.style.left = 'auto';
    handler_div.style.right = 'auto';
    handler_div.style.top = '10pt';
    handler_div.style.bottom = 'auto';
    handler_div.style.position = 'fixed';
    handler_div.style.display = 'block';
}