quotes =
  'babylon 5': [
    """
    “It is said that the future is always born in pain. The history of war is the history of pain. If we are wise, what is born of that pain matures into the promise of a better world, because we learn that we can no longer afford the mistakes of the past.”
      —G'Kar, In the Beginning
    """,
    """
    “You do not make history. You can only hope to survive it.”
      —G'Kar, Rising Star
    """,
    """
    “You do not make history. You can only hope to survive it.”
      —G'Kar, Rising Star
    """,
    """
    “It was an early earth president, Abraham Lincoln, who best described our situation. ‘The dogmas of the quiet past are inadequate to the stormy present. The occasion is piled high with difficulty, and we must rise to the occasion. We cannot escape history. We will be remembered in spite of ourselves. The fiery trial through which we pass will light us down in honor or dishonor, to the last generation. We shall nobly save, or meanly lose, or last best hope for Earth.’”
    """
  ]

detective = [
  "I'm Detective John Kimble!",
  "I'm a cop you idiot!"
]

module.exports = (robot) ->
  robot.respond /who are you\?+/, (msg) ->
    msg.send detective[Math.floor(math.random() * 2)]

  robot.respond /quote (me )? (.*)[.!]?/, (msg) ->
    thing = msg.match[2]

    for title, possibilities of quotes
      if thing.match new RegExp("^#{title}$", 'i')
        index = Math.floor(Math.random() * possibilities.length)

        msg.send "#{possibilities[index]}"
        return
