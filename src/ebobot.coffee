consoleConnector = require './connectors/console'
slackConnector = require './connectors/slack'
Config  = require '../config'

showConfig = () ->
  Object.entries(Config).map(([a,b]) -> "#{a} = #{b}").join "\n"

showHelp = () ->
  "taraban, tarabonfig, tarabanfig, tarahelp"

slackConnector (message) ->
  return "eh" if message in ['taraban']
  return showConfig() if message in ['tarabonfig', 'tarabanfig']
  return showHelp() if message in ['tarahelp']
  null
