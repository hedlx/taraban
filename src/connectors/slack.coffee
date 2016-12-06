Config  = require '../../config'
Slack = require 'slack-client'
winston =  require 'winston'

slackConnector = (processMessage) ->
  slackToken = Config.slackToken
  autoReconnect = true
  autoMark = true

  slack = new Slack(slackToken, autoReconnect, autoMark)

  slack.on 'open', ->
      winston.info "Connected to #{slack.team.name}"

  slack.on 'message', (message) ->
    channel = slack.getChannelGroupOrDMByID(message.channel)
    user = slack.getUserByID(message.user)
    response = ''

    {type, ts, text} = message

    channelName = if channel?.is_channel then '#' else ''
    channelName = channelName + if channel then channel.name else 'UNKNOWN_CHANNEL'

    return if channelName not in Config.slackChannels

    userName = if user?.name? then "@#{user.name}" else "UNKNOWN_USER"

    return if userName in Config.slackIgnoredUsers

    processedMessage = processMessage text

    if processedMessage?
       channel.send "#{userName}, #{processedMessage}"
  slack.on 'error', (err) ->
      winston.error "Error", err

  slack.login()

module.exports = slackConnector
