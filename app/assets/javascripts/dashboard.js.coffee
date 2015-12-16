# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $.ajax
    url: '/dashboard.json'
    type: 'GET'
    dataType: 'json'
    success: (result) ->
      if (result.success)
        country         = result.flights_country
        filter_by_today = result.flights_filter_by_today

        flights_country(country)
        flights_filter_by_today(filter_by_today)
      return


  flights_country = (country) ->
    $('#country_arrivals').highcharts
      chart:
        plotBackgroundColor: null
        plotBorderWidth: null
        plotShadow: false
        type: 'pie'
      title: text: '入境國家比例'
      tooltip: pointFormat: '{series.name}: <b>{point.percentage:.1f}% ({point.y})</b>'
      plotOptions: pie:
        allowPointSelect: true
        cursor: 'pointer'
        dataLabels: enabled: false
        showInLegend: true
      series: [ {
        name: 'Brands'
        colorByPoint: true
        data: country.arrivals
      } ]
    $('#country_departure').highcharts
      chart:
        plotBackgroundColor: null
        plotBorderWidth: null
        plotShadow: false
        type: 'pie'
      title: text: '出境國家比例'
      tooltip: pointFormat: '{series.name}: <b>{point.percentage:.1f}% ({point.y})</b>'
      plotOptions: pie:
        allowPointSelect: true
        cursor: 'pointer'
        dataLabels: enabled: false
        showInLegend: true
      series: [ {
        name: 'Brands'
        colorByPoint: true
        data: country.departure
      } ]
    return

  flights_filter_by_today = (filter_by_today) ->
    today = new Date();
    $('#filter_by_today').highcharts
      chart: type: 'spline'
      title: text: '航班時段(當日)'
      subtitle: text: '出入境'
      xAxis:
        type: 'datetime'
        labels: overflow: 'justify'
      yAxis:
        title: text: '班機數'
        minorGridLineWidth: 0
        gridLineWidth: 1
        alternateGridColor: null
        plotBands: [
        ]
      tooltip:
        shared: true
        valueSuffix: ' 班機數'
      plotOptions: spline:
        lineWidth: 4
        states: hover: lineWidth: 5
        marker: enabled: false
        pointInterval: 3600000
        pointStart: Date.UTC(today.getFullYear(), today.getMonth() + 1, today.getDate(), 0, 0, 0)
      series: [
        {
          name: '入境(Arrivals)'
          data: filter_by_today.arrivals
          color: '#448AFF'
        }
        {
          name: '出境(Departure)'
          data: filter_by_today.departure
          color: '#8BC34A'
        }
      ]
      navigation: menuItemStyle: fontSize: '10px'
    return
