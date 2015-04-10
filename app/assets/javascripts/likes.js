$( document ).ready(function() {

  $.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});
  
// primary use of these methods is to keep carousel from reloading when user is liked/rejected

$(".reject_wants").submit(function(e) {         // reject a user from within the carousel
  e.preventDefault();
  var user_wants_id = $("#user_wants_user_id").val();
  var user_has_id = $("#user_has_user_id").val();
  var resource_category = $("#user_resource_category").val();
  var values = {user_wants_id:user_wants_id, user_has_id:user_has_id, resource_category:resource_category};
    
  $.ajax({
    url: "/likes/reject_wants",
    type: 'PUT',
    data: {values:values},
    success: function(data) {alert("Request rejected!");
    }
  });
});

$(".reject_has").submit(function(e) {         // reject a confirmation someone has already sent to me.
  e.preventDefault();
  var user_wants_id = $("#user_wants_user_id").val();
  var user_has_id = $("#user_has_user_id").val();
  var resource_category = $("#user_resource_category").val();
  var values = {user_wants_id:user_wants_id, user_has_id:user_has_id, resource_category:resource_category};
    
  $.ajax({
    url: "/likes/reject_has",
    type: 'PUT',
    data: {values:values},
    success: function(data) 
    {alert("Request rejected!");
    location.reload();                          // on rejection, reload the window.location
    }
  });
});

$(".like").submit(function(e) {                // a like on the carousel
  e.preventDefault();
  var user_wants_id = $("#user_wants_user_id").val();
  var user_has_id = $("#user_has_user_id").val();
  var resource_category = $("#user_resource_category").val();
  var values = {user_wants_id:user_wants_id, user_has_id:user_has_id, resource_category:resource_category};
    
  $.ajax({
    url: "/likes/like",
    type: 'PUT',
    data: {values:values},
    success: function(data) {alert("User Liked!");
    }
  });
});


$(".accept").submit(function(e) {
  e.preventDefault();
  var user_wants_id = $("#user_wants_user_id").val();
  var user_has_id = $("#user_has_user_id").val();
  var resource_category = $("#user_resource_category").val();
  var values = {user_wants_id:user_wants_id, user_has_id:user_has_id, resource_category:resource_category};
  
  $.ajax({
    url: "/likes/accept",
    type: 'PUT',
    data: {values:values},
    success: function(data) {alert("Match Confirmed!");
    location.reload();
    }
  });
  });
});