module.exports = (robot) ->
  hackimgs = ['http://i.imgur.com/05nQqsQ.png', 'http://i.imgur.com/nkPv040.jpg', 'http://i.imgur.com/mknHNil.jpg', 'http://i.imgur.com/jeX4bmU.jpg', 'http://i.imgur.com/BQTJ134.jpg', 'http://i.imgur.com/GgEaqmP.jpg', 'http://i.imgur.com/gQmDKdQ.jpg', 'http://i.imgur.com/Ov83U2Q.jpg', 'http://i.imgur.com/WTQw28G.png', 'http://i.imgur.com/R3sTMPP.png', 'http://i.imgur.com/JJUOrKa.jpg', 'http://i.imgur.com/Rt0beqM.jpg', 'http://i.imgur.com/mMfyNZ1.png', 'http://i.imgur.com/crci7Pp.jpg', 'http://i.imgur.com/4QrdC.jpg', 'http://i.imgur.com/TXuICmL.png', 'http://imgur.com/gallery/pP1oAig']

  robot.hear /(^|\s+)(h([a]+|4)ck)/i, (res) ->
    res.send "H4CK3N? Ich mag H4CK3N!! - " + res.random hackimgs
