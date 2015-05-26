module.exports = (robot) ->
  beerimgs = ['http://i.imgur.com/nkPv040.jpg', 'http://i.imgur.com/6zC2li9.jpg', 'http://i.imgur.com/dk43Yma.gif', 'http://i.imgur.com/rlhjnE0.jpg', 'http://i.imgur.com/lY3WTwW.gif', 'http://i.imgur.com/BAMC9Vb.jpg', 'http://i.imgur.com/8ZuXj.jpg', 'http://i.imgur.com/zBz31.jpg']

  robot.hear /(^|\s+)(b([i]+|e)[e]+r)/i, (res) ->
    res.send "Kein Bier vor vier! - " + res.random beerimgs
