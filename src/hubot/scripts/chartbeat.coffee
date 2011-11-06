restler = require 'restler'

data_uri = 'http://api.chartbeat.com/live/quickstats/?host=new.openstudy.com&apikey=def9f22c9b057f914a388b4f2f164384'

module.exports = (robot) ->
  robot.respond /how many people are on(line)?( right now)?/i, (msg) ->
    msg.send 'Let me check that for you…'

    restler
      .get(data_uri, parser: restler.parsers.json)
      .on 'complete', (data) ->
        msg.send "There are #{data.visits} people online; #{data.write} are writing."
      .on 'error', (error) ->
        msg.send "Uh-oh, something went wrong :( Chartbeat told me #{error}."
