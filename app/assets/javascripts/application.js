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
//= require jquery-ui/effect-blind
//= require foundation
//= require turbolinks
//= require pikaday
//= require iCheck
//= require intro.js
//= require_tree .

var picker = new Pikaday({ field: $( '#quickq_question_duedate')[0]});

// $(document).ready(function(){
//   $('input').each(function(){
//     var self = $(this),
//       label = self.next(),
//       label_text = label.text();
//
//     label.remove();
//     self.iCheck({
//       checkboxClass: 'icheckbox_line',
//       radioClass: 'iradio_line',
//       insert: '<div class="icheck_line-icon"></div>' + label_text
//     });
//   });
// });

$("#button-show").click( function() {
    $('#qcreator').toggle(500);
  })

$("#index-help").click( function(){
  introJs().start();
})

$("#qcreator-help").click( function(){
  introJs(".qcreator").start();
})
