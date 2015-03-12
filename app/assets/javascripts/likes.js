$( document ).ready(function() {
  

  $("#reject_wants").submit(function(e) {
    e.preventDefault();
    // get all the inputs into an array.
    var $inputs = $('#myForm :input');

    // not sure if you wanted this, but I thought I'd add it.
    // get an associative array of just the values.
    var values = {};
    $inputs.each(function() {
        values[this.name] = $(this).val();
    });

    $.getJSON("/users/:user_has_id/home/:user_wants_id/:resource_category/reject_wants", {values:values}, function(data){

    });
  });

$("#reject_has").submit(function(e) {
    e.preventDefault();
    // get all the inputs into an array.
    var $inputs = $('#myForm :input');

    // not sure if you wanted this, but I thought I'd add it.
    // get an associative array of just the values.
    var values = {};
    $inputs.each(function() {
        values[this.name] = $(this).val();
    });

    $.getJSON("/users/:user_wants_id/home/:user_has_id/:resource_category/reject_has", {values:values}, function(data){

    });
  });

$(".like").submit(function(e) {
    e.preventDefault();
    console.log("hello world");
 var user_wants_id = $("#user_wants_user_id").val();
 var user_has_id = $("#user_has_user_id").val();
 console.log(user_has_id);
 var resource_category = $("#user_resource_category").val();
 console.log(user_wants_id);
 console.log(resource_category);
 var values = {user_wants_id:user_wants_id, user_has_id:user_has_id, resource_category:resource_category};
 console.log(values);
    
$.ajax({
  url: "/users/:user_wants_id/home/:user_has_id/:resource_category",
  type: 'PUT',
  data: {values:values},
  success: function(data) {alert("User Liked!");
  }
});
    // $.getJSON("/users/:user_wants_id/home/:user_has_id/:resource_category/reject_has", {values:values}, function(data){

    // });


  });


$(".accept").submit(function(e) {
    e.preventDefault();
    // get all the inputs into an array.
    var $inputs = $('#myForm :input');

    // not sure if you wanted this, but I thought I'd add it.
    // get an associative array of just the values.
    var values = {};
    $inputs.each(function() {
        values[this.name] = $(this).val();
    });

    $.getJSON("/users/:user_wants_id/home/:user_has_id/:resource_category/reject_has", {values:values}, function(data){

    });
  });







});

