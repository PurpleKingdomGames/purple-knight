# Description:
#   All things purple-jokey
#
# Commands:
#   hubot tell me a joke - Tell the best joke known to man
#   hubot what is your favourite colour - It's a personal question but hubot has an answer
#   hubot tell me a joke that isn't the purple joke - Tell another, sub-prime, joke
#
# Author:
#   hobnob

module.exports = (robot) ->
    tellThePurpleJoke = (res) ->
        randomEnd = Math.random()
        randomExclamation = Math.random()

        res.send "In a purple galaxy, in a purple solar system, orbiting a purple star, there is a purple planet.\n\n"+
                "On this purple planet (called Purplearth) there is a purple kingdom call Purpledonia. "+
                "Purpledonia is ruled by the purple king Purplias Maximus the Purpley One who rules with "+
                "a purple, but fair, hand. One day Purpledonia was attacked by the most purple and evil of "+
                "all purple dragons: Purplefang. During this despicable attack the purple dragon Purplefang kidnapped the purple "+
                "princess Purplina and took her for his own evil intentions. After the purple dust had settled "+
                "the purple king, purple with rage, called forth his best and bravest (and handsomest) purple knight."+
                "\n\n\"Purple knight\", he said, \"Take your brave purple steed and return to me my purple "+
                "princess Purplina\"\n\nThe brave (and handsome) purple knight bowed low and said "+
                "\"Purple king Purplias Maximus the Purpley One, I will take this most purple of tasks and rescue the purple "+
                "princess Purplina from the purple dragon Purplefang in the name of all that is purple!\"\n\n"+
                "So the (devilishly handsome) purple knight got on his purple steed and rode into the purple sunset "+
                "towards the purple dragon Purplefang's evil purple lair...\n\nHe rode over the purple mountains, through the "+
                "purple valleys, crossed several purple rivers using purple bridges (many of which were guarded by purple trolls, that "+
                " the handsome knight fought valiantly) and finally made it to the purple forest. Taking a deep "+
                "breath (for it is well known the purple forest is full of dangers too purple to speak of here) "+
                "the purple knight bravely (and handsomely) made his way through the purple forest. What dangers "+
                "he encountered there we can only guess (for he has sworn a purple oath never to speak of them) "+
                "but we can be sure that they were purple!\n\nAfter many days of traveling through the purple "+
                "forest, the purple knight finally made it to the purple dragon Purplefang's purple cave.\n\n"+
                "The dragon was asleep, with the purple princess Purplina tied to a stake next to the purple cave. "+
                "The purple knight motioned to the purple prince Purplina to remain still and snuck up on the purple "+
                "dragon Purplefang using all of his skill and cunning.\n\n"+
                "But his skill and cunning were not enough, for as the purple knight tip-toed up to the purple "+
                "dragon Purplefang, he stepped on a purple branch of a Purploak tree, which made a sound like \"crapurpleck!\"."+
                "\n\nThe purple dragon Purplefang awoke with a purple start and attacked the purple knight! The purple knight "+
                "used his mighty sword Excalipurple to fend off the dragon's attack, darting this way and that way!\n\n"+
                "After many purple hours of purple combat had passed the purple knight finally struck a deadly blow to the purple "+
                "dragon Purplefang! The persistent purple dragon Purplefang fought on briefly and then, succumbing "+
                "to his injuries, collapsed in a purple heap. The purple knight cheered with joy and congratulated himself "+
                "many times on a job well done. Finally, he remember why the purple king Purplias Maximus the Purpley One had sent him and "+
                "went to untie the purple princess Purplina. That was when he realised the true cost of his purple victory, "+
                "for in the commotion he had not realised that the purple dragon Purplefang had fallen atop the purple "+
                "princess Purplina and klilled her purpley dead!\n\nStricken with purple grief the purple knight saw "+
                "no choice but to make his way back to the purple king Purplias Maximus the Purpley One and tell "+
                " him all that had happened. He made his way back through the purple forest, barely even bothering to "+
                "make up tales of his heroic escapades there.  He stumbled over many purple bridges, to cross purple "+
                "rivers with ease (the purple trolls having long since decided that charging a purple toll just wasn't worth "+
                "the aggravation it caused them). He rode through the "+
                "purple valleys, over the purple mountains, and finally made it to the purple kingdom of Purpledonia "+
                "where the purple king Purplias Maximus was waiting for nwes of the purple princess Purplina.\n\n"+
                "\"Well purple knight\", said the king, \"I see you have returned, but you have not brought with "+
                "you my most purpley purple princess Purplina. Tell me, what has happened?\"\n\n"+
                "The purple knight took a deep purple breath (deeper and purplier even "+
                "than the one he had taken to get through the purple forest) and told the purple king all that had "+
                "transpired at the purple dragon Purplefang's purple cave.\n\nThe purple king Purplias Maximus the "+
                "Purpley One was silent  for several purple minutes before he finally cracked.\n\n"+
                "\"Purple guards!\", he screamed, \"Take this "+
                "purple knight and throw him in the deepest, darkest, purpliest dungeon we have!\""+
                "\n\nThe ever-dutiful purple guards took the purple knight (still devilishly handsome, even after "+
                "all that he had been through) down towards the dungeons. Down they went, heading ever deeper and "+
                "deeper into the dungeons. All around them, the light "+
                "became a darker, more ominous shade of purple. Down they continued, and deeper the shades of purple "+
                "until finally, the purple guards came to the deepest darkest purple dungeon and threw the purple knight in "+
                "with a final farewell of ... \n\n\n"
        if randomEnd > 0.75
            res.send "\"In you go!\""
            setTimeout () ->
                res.send "No, wait a minute... it's \"Indigo!\""
                res.emote ":confused:"
            , 15 * 1000
        else
            res.send "\"Indigo!\""

        setTimeout () ->
            if randomExclamation < 0.1
                res.send "Nailed it!"
            else if randomExclamation < 0.2
                res.send "You're welcome!"
            else if randomExclamation < 0.3
                res.send "Boom!"
            else if randomExclamation < 0.4
                res.send "You can thank me later"
            else if randomExclamation < 0.5
                res.send "Totally nailed it!"
            else if randomExclamation < 0.6
                res.send "You liked it. I can tell"
            else if randomExclamation < 0.7
                res.send "Why aren't you laughing? That was good!"
            else if randomExclamation < 0.8
                res.send "Nailed it!"
            else if randomExclamation < 0.9
                res.send "Boom!"
            else
                res.send "You liked it. I can tell"
        , 30 * 1000

    robot.hear /(.*)/i, (res) ->
        hasAsked = robot.brain.get('askedAboutJoke') or false
        if hasAsked
            responseText      = res.match[1]
            positiveResponses = /yes|yup|yeah|yea/i
            negativeResponses = /no|nope|don't|nah/i

            if positiveResponses.test(responseText)
                res.send "You'll like this; it's my favourite joke!"
                tellThePurpleJoke(res)
            else if negativeResponses.test(responseText)
                res.send "OK, no problem... maybe another time"
            else
                res.send "... or you could ignore me... that's good too"

            robot.brain.set 'askedAboutJoke', false

    robot.hear /indigo/i, (res) ->
        res.send "Hey, I just remembered a really cool joke! Do you want to hear it?"
        robot.brain.set 'askedAboutJoke', true

    robot.respond /tell me a joke$/i, (res) ->
        res.reply "You'll like this one; it's my favourite:"
        tellThePurpleJoke(res)

    robot.respond /what is your favourite colour[?]{0,}/i, (res) ->
        randomExclamation = Math.random()

        if randomExclamation < 0.1
            res.send "I bet you'll never guess"
        else if randomExclamation < 0.2
            res.send "It's of a purple variety"
        else if randomExclamation < 0.3
            res.send "I'll give you a clue... it rhymes with \"I like snow\""
        else if randomExclamation < 0.4
            res.send "It's quite a dark colour"
        else if randomExclamation < 0.5
            res.send "Indigo of course!"
        else if randomExclamation < 0.6
            res.send "What... is your quest?"
        else if randomExclamation < 0.7
            res.send "Blue.. no, wait!.. Ask me again"
        else if randomExclamation < 0.8
            res.send "If you let me tell you a joke, I might tell you the answer"
        else
            res.send "Try and guess..."

    robot.respond /tell me a joke that isn't the purple joke$/i, (res) ->
        randomType = Math.random()

        if randomType < 0.5
          url = "cleanjokes"
        else
          url = "classyjokes"

        res.http("http://www.reddit.com/r/#{url}.json")
        .get() (err, response, body) ->
          try
            data = JSON.parse body
            children = data.data.children
            joke = res.random(children).data

            joketext = joke.selftext.replace(/^\.\.\.\s*/, '')

            res.send joketext.trim()

          catch ex
            res.send "Well this is awkward.. I can't find any :confused:"
            res.send "Would you like me to tell the purple joke instead? :wink:"
            robot.brain.set 'askedAboutJoke', true
