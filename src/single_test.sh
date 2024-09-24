FOLDER=$(realpath "$(dirname "$0")");

source "$FOLDER/colors.sh"
source "$FOLDER/messages.sh"

cp "testing/tests/$1" "run/environment/input.txt"

echo "${WHITE}$1${NC} \c";

cd "run/environment";
gtimeout 1s "$FOLDER/run.sh" < "/dev/null" &> "/dev/null" 2> "/dev/null"
TIMEOUT_CODE="$?"
if [[ "$TIMEOUT_CODE" -eq 0 ]]
then

"../../testing/scripts/check.sh" 2> "errors.txt"
CORRECT_ANSW="$?"
if [[ "$CORRECT_ANSW" -eq 0 ]]
then
echo "$OK"
else
echo "$WA"
fi
elif [[ "$TIMEOUT_CODE" -eq 124 ]]
then
echo "$TL"
else
echo "$RE"
fi

if [[ $* == *-i* ]]
then
echo "${YELLOW}input.txt:${NC}"
cat input.txt
echo;
fi
if [[ $* == *-o* ]]
then
echo "${YELLOW}output.txt:${NC}"
cat output.txt
echo;
fi
if [[ $* == *-e* ]]
then
echo "${YELLOW}errors:${NC}"
cat errors.txt
echo;
fi
cd "../../"