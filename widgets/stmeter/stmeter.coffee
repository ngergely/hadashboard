class Dashing.Stmeter extends Dashing.Widget

  @accessor 'value', Dashing.AnimatedValue

  constructor: ->
    super
    @observe 'value', (value) ->
      $.get '/smartthings/dispatch',
      widgetId: @get('id'),
      deviceType: 'power',
      deviceId: @get('device')
      (data) =>
        json = JSON.parse data
        @set 'value', json.value

  ready: ->
    Stmeter = $(@node).find(".Stmeter")
    Stmeter.attr("data-bgcolor", Stmeter.css("background-color"))
    Stmeter.attr("data-fgcolor", Stmeter.css("color"))
    Stmeter.knob()