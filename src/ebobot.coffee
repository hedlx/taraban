consoleConnector = require './connectors/console'
slackConnector = require './connectors/slack'
Config  = require '../config'

showConfig = () ->
  Object.entries(Config).map(([a,b]) -> "#{a} = #{b}").join "\n"

slackConnector (message) ->
  return "eh" if message in ['taraban']
  return showConfig() if message in ['tarabonfig', 'tarabanfig']
  null
