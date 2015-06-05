window.onload = function() {
  var tags = [];
  var href = window.location.origin + window.location.pathname;
  
  function tagLoop() {
    if (this.value === "all") {
      window.location.href = href;
    } else {
      window.location.href = href +"?tags=" + this.value;
    }
  };
  
  tags = document.getElementsByClassName("tag_radio");
  
  for (var i = 0; i < tags.length; i++) {
    tags[i].addEventListener("click", tagLoop)
  }
};
  