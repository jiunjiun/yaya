# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $ ->
#   line_data = []

#   draw_line_chart = (date, data) ->
#     $('#ArrDep').highcharts
#       chart: type: 'spline'
#       title: text: '桃園國際機場出入境狀況'
#       subtitle: text: date
#       xAxis:
#         type: 'datetime'
#         labels: overflow: 'justify'
#       yAxis:
#         title: text: '班次'
#         min: 0
#         minorGridLineWidth: 0
#         gridLineWidth: 0
#         alternateGridColor: null
#       tooltip: valueSuffix: ' 班'
#       plotOptions: spline:
#         lineWidth: 4
#         states: hover: lineWidth: 5
#         marker: enabled: false
#         pointInterval: 3600000
#         # pointStart: Date.UTC(2015, 4, 31, 0, 0, 0)
#       series: data
#       navigation: menuItemStyle: fontSize: '10px'

#   line_chart = (date) ->
#     $.getJSON '/charts/ArrDep.json',
#       date: date
#     .done (data) ->
#       line_data = []
#       line_data.push({name: '入境', data: data.arrivals})
#       line_data.push({name: '出境', data: data.departure})

#       draw_line_chart date, line_data
#       return

#   initialize = ->
#     today = new Date()
#     dd = today.getDate()
#     mm = today.getMonth()
#     yyyy = today.getFullYear()

#     $('.datepicker').pickadate
#       min: new Date(2015, 8, 20)
#       max: new Date(yyyy, mm, dd-1)
#       # selectMonths: true
#       # selectYears: 15
#       formatSubmit: 'yyyy/mm/dd'
#       format: 'yyyy/mm/dd'

#     line_chart $('#datetime').val()

#     $('#datetime').change ->
#       line_chart $(this).val()

#   $(document).ready initialize
#   $(document).on 'page:load', initialize



