// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  if (document.location.pathname == '/users/sign_up') {
    runStepsForm();
  }
});

function runStepsForm() {
  var theForm = document.getElementById( 'theForm' );
  new stepsForm( theForm, {
    onSubmit : function( form ) {
    }
  });
}



