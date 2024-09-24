FOLDER=$(realpath "$(dirname "$0")");
source "$FOLDER/src/commands.sh";

if [[ "$NEWENV" == "$1" ]]
then
"$FOLDER/newenv.sh"
elif [[ "$RUN_TESTS" == "$1" ]]
then
"$FOLDER/runtests.sh" "${@:2}"
elif [[ "$GENERATE" == "$1" ]]
then
"$FOLDER/generate.sh" "${@:2}"
elif [[ "$CONFIG" == "$1" ]]
then
"$FOLDER/config.sh" "${@:2}"
fi