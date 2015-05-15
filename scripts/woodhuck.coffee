# Description:
#   How much wood could a woodchuck chuck if a woodchuck could chuck wood?
#
# Commands:
#   hubot how much wood could a woodchuck chuck - Tell the best joke known to man
#
# Author:
#   hobnob
module.exports = (robot) ->
    robot.respond /how much wood could a wood( ){0,1}chuck chuck( if a wood( ){0,1}chuck could chuck wood){0,1}(\?){0,1}/i, (res) ->
        randomResponse = Math.random()
        if randomResponse < 0.25
            res.send "If a woodchuck could chuck wood, a woodchuck would chuck all the wood that a woodchuck could chuck, if a woodchuck could chuck wood!"
        else if randomResponse < 0.45
            res.send "According to a report by the Associated Press in 1988, Richard Thomas has calculated this may be about 700 pounds (320 kg) on a good day, with the wind at his back"
        else if randomResponse < 0.65
            res.send "If you consider \"chuck\" to be the opposite of upchucking, a woodchuck could ingest 361.9237001 cubic centimetres (22.08593926 cu in) of wood per day"
        else if randomResponse < 0.9
            res.send "A woodchuck would chuck no amount of wood since a woodchuck can’t chuck wood"
        else
            res.send "A woodchuck would chuck as much wood as a woodchuck could chuck if a woodchuck could chuck wood"
