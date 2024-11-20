FOLDER=$(realpath "$(dirname "$0")");

source "$FOLDER/colors.sh"
source "$FOLDER/messages.sh"

cp "testing/tests/$2" "run/environment/input.txt"

echo -e "${WHITE}$2${NC} \c";

cd "run/environment";
gtimeout $1 "$FOLDER/run.sh" < "/dev/null" &> "/dev/null" 2> "/dev/null"
TIMEOUT_CODE="$?"
if [[ "$TIMEOUT_CODE" -eq 0 ]]
then

"../../testing/scripts/check.sh" 2> "errors.txt"
CORRECT_ANSW="$?"
if [[ "$CORRECT_ANSW" -eq 0 ]]
then
echo -e "$OK"
else
echo -e "$WA"
fi
elif [[ "$TIMEOUT_CODE" -eq 124 ]]
then
echo -e "$TL"
else
echo -e "$RE"
fi

if [[ $* == *-i* ]]
then
echo -e "${YELLOW}input.txt:${NC}"
cat input.txt
echo;
fi
if [[ $* == *-o* ]]
then
echo -e "${YELLOW}output.txt:${NC}"
cat output.txt
echo;
fi
if [[ $* == *-e* ]]
then
echo -e "${YELLOW}errors:${NC}"
cat errors.txt
echo;
fi
cd "../../"
