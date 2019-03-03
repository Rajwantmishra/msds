<script language="JavaScript">

var pass1="CUNY";
  document.addEventListener("DOMContentLoaded", function(event) {
  
    alert('hidin');
  document.getElementById("event-date-feb-22").style.display = 'none';
  password();
      // - Code to execute when all DOM content is loaded. 
      // - including fonts, images, etc.
  });

window.addEventListener('load', function() {
    console.log('All assets are loaded')
})


function password() {
  var pass = prompt('What was the first country we visited together?');
  if (pass == pass1)
  {
    document.getElementById("event-date-feb-22").style.display = 'block';
  } else { 
    alert('sorry, try again!');
    document.getElementById("event-date-feb-22").style.display = 'none';
  }
}
</script>

