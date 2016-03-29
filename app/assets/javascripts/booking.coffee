# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 $ ->
  $('#txtFrom').datepicker
    dateFormat: 'dd/mm/yy'
    onSelect: (selected) ->
      dt = new Date(selected)
      dt = $.datepicker.formatDate("mm/dd/yy", dt)
      $('#txtTo').datepicker('option', 'minDate', dt)
      return
  
  $('#txtTo').datepicker
    dateFormat: 'dd/mm/yy'
    onSelect: (selected) ->
      dt = new Date(selected)
      dt = $.datepicker.formatDate("mm/dd/yy", dt)
      $('#txtFrom').datepicker('option', 'maxDate', dt)
      return