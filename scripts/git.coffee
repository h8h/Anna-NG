module.exports = (robot) ->
  robot.hear /(^|\s+)git/i, (msg) ->
    msg.http("http://whatthecommit.com/index.txt")
      .get() (err, res, body) ->
        msg.reply body 
    return
