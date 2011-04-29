document.observe("dom:loaded", function() {
  Element.hide('prereqs');
  $$('.subsection > div:nth-child(even)').each(function(div) {
    div.addClassName('even');
  });
});

var show_prereq = true;
function toggle_prereqs() {
  $('prereqs').toggle();
  if (show_prereq) {
    show_prereq = false;
    $('prereq_toggle_button').update('hide');
  } else {
    show_prereq = true;
    $('prereq_toggle_button').update('show');
  }
}

var show_resources = false;
function toggle_resources() {
  $('resources').toggle();
  if (show_resources) {
    show_resources = false;
    $('resources_toggle_button').update('hide');
  } else {
    show_resources = true;
    $('resources_toggle_button').update('show');
  }
}

