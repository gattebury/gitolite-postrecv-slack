#!/bin/bash
#
# wrapper intended to be called by gitolite's 'option hook.post-receive'
#
# gitolite seems angry calling #!<python things> directly,
# something to do with EOL characters perhaps as described here
# https://stackoverflow.com/questions/36595775/troubles-with-shebang-in-gitolite-hooks
#
# this also lets us easily call multiple scripts as well, so we'll call it a win
#


# name of called hook (used by slack callout to determine config vars)
HOOKNAME=$(basename $0)

while read oldrev newrev refname
do

    # what what?
    logger "$HOOKNAME: $oldrev, $newrev, $refname"

    # actual slack hook callout
    ~git/gitolite-hook-gattebury $HOOKNAME $oldrev $newrev $refname

done
