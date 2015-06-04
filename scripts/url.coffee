# Description:
#   Webutility returns title of urls
#
# Dependencies:
#   "htmlparser": "1.7.6"
#   "soupselect": "0.2.0"
#   "jsdom": "0.2.14"
#
# Commands:
#   None
#
# Author:
#   KevinTraver
#   ChristianHomeyer (without Bitly, with brain support and inline url to save the message and the url in the brain)
\
Select = require("soupselect").select
HtmlParser = require "htmlparser"

module.exports = (robot) ->
  robot.hear /(^\S+[\S+ ]* |^)(http(s?)\:\/\/\S+)( (\S+[\S+ ]*)$|$)/, (msg) ->
    url = msg.match[2]
    httpResponse = (url) ->
      msg
        .http(url)
        .get() (err, res, body) ->
          if res.statusCode is 301 or res.statusCode is 302
            httpResponse(res.headers.location)
          else if res.statusCode is 200
            if res.headers['content-type'].indexOf('text/html') != 0
              msg.send "Falscher Dateitype"
              return

            handler = new HtmlParser.DefaultHandler()
            parser  = new HtmlParser.Parser handler
            parser.parseComplete body

            # abort if soupselect runs out of stack space
            try
              results = (Select handler.dom, "head title")
            catch RangeError
              return

            processResult = (elem) ->
                elem.children[0].data.replace(/(\r\n|\n|\r)/gm,"").trim()
            if results[0]
              msg.send processResult(results[0])
            else
              results = (Select handler.dom, "title")
              if results[0]
                msg.send processResult(results[0])
          else
            msg.send "Error " + res.statusCode
    httpResponse(url)