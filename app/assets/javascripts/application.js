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
//= require bootstrap
//= require select2
//= require_tree .


$(document).ready(function() {
  

  function locationFormatResult(location) {
      var markup = "<table class='location-result'><tr>";
      // if (movie.posters !== undefined && movie.posters.thumbnail !== undefined) {
      //     markup += "<td class='movie-image'><img src='" + movie.posters.thumbnail + "'/></td>";
      // }
      markup += "<td class='location-info'><div class='location-title'>" + location.name + "</div>";
      // if (movie.critics_consensus !== undefined) {
      //     markup += "<div class='movie-synopsis'>" + movie.critics_consensus + "</div>";
      // }
      // else if (movie.synopsis !== undefined) {
      //     markup += "<div class='movie-synopsis'>" + movie.synopsis + "</div>";
      // }
      markup += "</td></tr></table>";
      return markup;
  }

  function locationFormatSelection(location) {
      return location.name;
  }


$("#foursquare_location_select").select2({
    placeholder: "Search for a place",
    minimumInputLength: 1,
    ajax: { // instead of writing the function to execute the request we use Select2's convenient helper
        url: "http://localhost:3000/v1/foursquare",
        dataType: 'json',
        data: function (term, page) {
            return {
                query: term, // search term
            };
        },
        results: function (data, page) { // parse the results into the format expected by Select2.
            // since we are using custom formatting functions we do not need to alter remote JSON data
            console.log(data);
            return {results: data};
        }
    },
    initSelection: function(element, callback) {
        // the input tag has a value attribute preloaded that points to a preselected movie's id
        // this function resolves that id attribute to an object that select2 can render
        // using its formatResult renderer - that way the movie name is shown preselected
        var id=$(element).val();
        if (id!=="") {
            $.ajax("http://localhost:3000/v1/foursquare/"+id+".json", {
                dataType: "json"
            }).done(function(data) { callback(data); });
        }
    },
    formatResult: locationFormatResult, // omitted for brevity, see the source of this page
    formatSelection: locationFormatSelection,  // omitted for brevity, see the source of this page
    dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
    escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
});
});
