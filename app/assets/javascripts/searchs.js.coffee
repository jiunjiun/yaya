# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $ ->
#   initialize = ->
#     today = new Date()
#     dd = today.getDate()
#     mm = today.getMonth()
#     yyyy = today.getFullYear()
#     card_panel_status = false

#     $('select').material_select()
#     $('.datepicker').pickadate
#       min: new Date(2015, 6,30)
#       max: new Date(yyyy, mm, dd+1)
#       selectMonths: true
#       selectYears: 15
#       formatSubmit: 'yyyy/mm/dd'
#       format: 'yyyy/mm/dd'

#     $('.timepicker').pickatime formatLabel: (time) ->
#       hours = (time.pick - (@get('now').pick)) / 60
#       label = if hours < 0 then ' !小時之前' else if hours > 0 then ' !小時之後' else '現在'
#       'h:i A &nbsp;&nbsp; - &nbsp;&nbsp;<sm!all>' + (if hours then Math.abs(hours) else '') + label + '</sm!all>'


#     $('#search label[for=menu]').click ->
#       if card_panel_status
#         $('.card-panel').hide()
#         card_panel_status = false
#       else
#         $('.card-panel').show().addClass('fadeIn').one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', ->
#           $(this).removeClass('fadeIn')
#         card_panel_status = true


#   $(document).ready initialize
#   $(document).on 'page:load', initialize
