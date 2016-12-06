readline = require 'readline'

consoleConnector = (processMessage) ->
    rl = readline.createInterface process.stdin, process.stdout
    rl.setPrompt 'You: '
    rl.prompt()

    rl.on 'line', (message) ->
      console.log "Bot: " + processMessage message
      rl.prompt()

    rl.on 'close', () ->
      console.log "exit\nBot: Have a nice day!"

module.exports = consoleConnector
