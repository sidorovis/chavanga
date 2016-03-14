// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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

function changeLogoImage(i)
{
    document.getElementById("under_construction").style.top=i+'px';
    if (i >= -10) return;
    nextImageFunc = "changeLogoImage( "+(i+1)+" );";
    setTimeout( nextImageFunc, 5 );
}


window.onload = addCodeToFunction(
    window.onload,function()
    {
        setTimeout( 'changeLogoImage(-250)', 700 )
    }
);


function showSubMenu( menu_id )
{
    document.getElementById(menu_id).style.display = 'block';
}
function hideSubMenu( menu_id )
{
    document.getElementById(menu_id).style.display = 'none';
}
