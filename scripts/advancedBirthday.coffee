# Description:
#   Send birthday greetings via Hubot! Based on:
#   https://github.com/github/hubot-scripts/blob/master/src/scripts/birthday.coffee
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot it's <user>'s birthday on <date: YYYY-MM-DD> - Let hubot know when to send birthday greetings
#   hubot wish <user> a happy birthday - congratulate <user> with a humorous greeting
#
# Author:
#   hobnob

module.exports = (robot) ->
    intervalId = null
    greeting   = (name) ->
        greetings[(Math.random() * greetings.length) >> 0].replace(/{name}/, name)

    greetings = [
        "Happy Birthday {name}, you're not getting older, you're just a little closer to death.",
        "Birthdays are good for you {name}. Statistics show that people who have the most live the longest!",
        "{name} - I'm so glad you were born, because you brighten my life and fill it with joy.",
        "{name} - Always remember: growing old is mandatory, growing up is optional.",
        "{name} - Better to be over the hill than burried under it.",
        "You always have such fun birthdays {name}, you should have one every year.",
        "Happy birthday to {name}, a person who is smart, good looking, and funny and reminds me a lot of myself.",
        "{name} - We know we're getting old when the only thing we want for our birthday is not to be reminded of it.",
        "Happy Birthday on your very special day {name}, I hope that you don't die before you eat your cake.",
        "{name} - Hoping that your day will be as special as you are.",
        "{name} - Count your life by smiles, not tears. Count your age by friends, not years.",
        "May the years continue to be good to you. Happy Birthday {name}!",
        "{name} - You're not getting older, you're getting better.",
        "{name} - May this year bring with it all the success and fulfillment your heart desires.",
        "{name} - Wishing you all the great things in life, hope this day will bring you an extra share of all that makes you happiest.",
        "Happy Birthday {name}, and may all the wishes and dreams you dream today turn to reality.",
        "May this day bring to you all things that make you smile. Happy Birthday {name}!",
        "{name} - Your best years are still ahead of you.",
        "{name} - Birthdays are filled with yesterday's memories, today's joys, and tomorrow's dreams.",
        "{name} - Hoping that your day will be as special as you are.",
        "{name} - You'll always be forever young."
    ]

    robot.hear /.*/i, (res) ->
        if !intervalId
            # Set an interval of once per day to check for any birthdays on that day
            intervalId = setInterval () ->
                birthdayChecks = robot.brain.get('birthday_checks') or []
                nowDate        = new Date()
                sendGreetings  = for birthday, i in birthdayChecks
                    checkDate = new Date(birthday.birthday)
                    lastCheck = new Date(birthday.lastCheck)

                    if checkDate.getDate() is nowDate.getDate() and checkDate.getMonth() is nowDate.getMonth()
                        if lastCheck.getDate() != nowDate.getDate() or lastCheck.getYear() != nowDate.getYear() or lastCheck.getMonth() != nowDate.getMonth()
                            res.send greeting birthday.name
                            #birthdayChecks[i].lastCheck = nowDate

                robot.brain.set 'birthday_checks', birthdayChecks
            , 1000

    robot.respond /whos birthdays do you know about/i, (res) ->
        birthdays     = robot.brain.get('birthday_checks') or []
        if birthdays.length
            sendGreetings = for birthday, i in birthdays
                res.send birthday.name+" has a birthday on "+birthday.birthday
        else
            res.send "I don't seem to know about anyones birthday"

    robot.respond /wish (.*)? a happy birthday/i, (res) ->
        name = res.match[0].trim()
        if name.length > 0
            res.send greeting(name)

    robot.respond /it( is|'s) (.*?){1}('s){0,1} birthday on (([0-9]){4}-([0-9]){2}-([0-9]){2}){1}/i, (res)->
        name  = res.match[2].trim()
        date  = res.match[4].trim()

        yesterday = new Date();
        yesterday.setDate yesterday.getDate() - 1;

        if !robot.brain.get('birthday_checks')
            robot.brain.set('birthday_checks', [])

        currentChecks = robot.brain.get('birthday_checks');
        currentChecks.push({"name":name, "birthday":date, "lastCheck":yesterday})
        robot.brain.set('birthday_checks', currentChecks)

        res.send "OK... I'll try and remember to wish them a happy birthday"
