consoleConnector = require './connectors/console'
slackConnector = require './connectors/slack'

slackConnector (message) ->
  return "eh" if message in ['taraban']
  null
