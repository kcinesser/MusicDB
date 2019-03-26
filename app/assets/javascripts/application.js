// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

$( document ).ready(function() {

    var ajaxCall = function(e){
        console.log( "ready!" );


        e.preventDefault();

        var data = $('form.search').serialize();
        var artist_id = jQuery('input[name="artist_id"]').val();

        $.ajax({
            type: "GET",
            url: '/song_searches/index',
            data: data,
            dataType: 'json',
            success: function(json){
                $('.search-results tr').remove();

                var max_results;

                if (json.length < 5) {
                    max_results = json.length
                } else {
                    max_results = 5;
                }

                var output = "";

                for (i = 0; i < max_results; i++) {
                    var spotify_id = json[i].id;
                    var song_title = json[i].name;
                    var link = '<a rel="nofollow" data-method="create" href="/artists/' + artist_id + '/songs?song%5Bdifficulty%5D=0&song%5Bspotify_url%5D=' + spotify_id + '&amp;song%5Bstatus%5D=not_started&amp;song%5Btitle%5D=' + song_title + '"><i class="fas fa-plus"></i></a>';
                    var output = output + '<tr><td><img height=\'40px\' width=\'40px\' src=\'' + json[i].album.images[0].url + '\'/></td><td>' + json[i].name + '</td><td>' + json[i].album.name + '</td><td>' + link + '</td></tr>';
                }

                $('.search-results').append(output);
            }
        });
    }
    
    $("#song-search").on("input", ajaxCall);
});
