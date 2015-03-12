$( document ).ready(function() {
  

  $(".reject_wants").submit(function(e) {
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
  url: "/users/:user_has_id/reject_wants",
  type: 'PUT',
  data: {values:values},
  success: function(data) {alert("Request rejected!");
  }
});
  });

$(".reject_has").submit(function(e) {
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
  url: "/users/:user_has_id/reject_has",
  type: 'PUT',
  data: {values:values},
  success: function(data) 
  {alert("Request rejected!");
  location.reload();

  }
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
  });


$(".accept").submit(function(e) {
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
  url: "/users/:user_has_id/accept",
  type: 'PUT',
  data: {values:values},
  success: function(data) {alert("Match Confirmed!");
  }
});

  });

});

