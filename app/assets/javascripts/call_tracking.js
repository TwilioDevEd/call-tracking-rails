$(document).ready(function() {
  // Make all charts responsive
  Chart.defaults.global.responsive = true;

  $.get('/statistics/leads_by_source/', function(data) {
    drawPie("#leads-by-source", data);
  });

  $.get('/statistics/leads_by_city/', function(data) {
    drawPie("#leads-by-city", data);
  });
});

var drawPie = function(selector, data) {
  var ctx = getContext(selector);
  new Chart(ctx).Pie(data);
}

var getContext = function(selector) {
  return $(selector).get(0).getContext("2d");
}
