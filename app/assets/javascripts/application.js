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
//= require jquery-ui
//= require turbolinks
//= require_tree .


  $(function() {
    $( "#verse span.drag" ).draggable();
    $( "span.place" ).droppable({
      drop: function( event, ui ) {
        $( this );
        place_value = this.attributes['data-id'].value;
        drag_value = ui.draggable[0]["attributes"][1]["value"];
        console.log("place: " + place_value + " drag: " + drag_value);   
        if (place_value == drag_value) {
          $(ui.draggable).attr("class", "match");
     // $(this).attr("class", "").addClass( $(ui.draggable).attr("class") );
        }
        console.log(this.attributes['data-id']);
        console.log(ui.draggable);
        console.log();     
         // .addClass( "ui-state-highlight" )
         // .find( "p" )
         //   .html( "Dropped!" );
      }
    });
  });
