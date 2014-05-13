// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function()
{
        var marca = $("#marca");
        $("#listaMarca li ").on("click", function () {
            var selecion = $(this).text();
            marca.text(selecion);
            $("#laMarca").attr('value', selecion);

            $.ajax({
                type: "GET",
                url: "/ad_controller/showAdModels/"+selecion,
                success: function(result)
                {
                    $("#listaModelo").html(result);
                }
            });

        });

        var modelo = $("#modelo");
        $("#listaModelo ").on("click","li",function () {
            var selecion =  $(this).text();
            modelo.text(selecion);
            $("#elModelo").attr('value', selecion);
        });



});