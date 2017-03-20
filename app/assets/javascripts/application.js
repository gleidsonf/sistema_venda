// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap.min
//= require jquery-bootstrap-modal-steps.min
//= require app.min
//= require jquery_ujs
//= require turbolinks
//= require select2
//= require_tree .

sendEvent = function() {
    $('#demo-modal').trigger('next.m.2');
}

$(function(){
    //Yes! use keydown 'cus some keys is fired only in this trigger,
    //such arrows keys
    $("body").keydown(function(e){
         //well you need keep on mind that your browser use some keys 
         //to call some function, so we'll prevent this
         // e.preventDefault();

         //now we caught the key code, yabadabadoo!!
         var keyCode = e.keyCode || e.which;
         if(keyCode == 45) {
            console.log('acertou')
            $('.modal').modal('show');

         }
         console.log(keyCode);       
    });
});


function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("example1");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}

window.onload = function() {

  $("#select_products").select2();

    $(function(){

    //Yes! use keydown 'cus some keys is fired only in this trigger,
    //such arrows keys
        $("body").keydown(function(e){
            //well you need keep on mind that your browser use some keys 
            //to call some function, so we'll prevent this
            // e.preventDefault();

            var input = $('#sale_item_product_id').is(':focus')

            //now we caught the key code, yabadabadoo!!
            var keyCode = e.keyCode || e.which;
            if(keyCode == 113) {

            if(input){
            document.getElementById("sale_item_quantity").focus();
           $('#sale_item_quantity').select() 
            } else {
            document.getElementById("sale_item_product_id").focus();
            // $("#sale_item_quantity").select();
            }
            console.log('acertou');
            // $('.modal').modal('show');

            }

        });
    });
};

