FOLDER=$(realpath "$(dirname "$0")");

source "$FOLDER/colors.sh"
source "$FOLDER/messages.sh"

TESTS=$@

if [[ $* == *-all* ]]
then
TESTS=$(ls testing/tests)
fi

cd "run/environment";
echo "Compiling..."
"../scripts/compile.sh" < input.txt &> output.txt 2> errors.txt
COMPILE_CODE="$?"
if [[ $COMPILE_CODE -ne 0 ]]
then
echo "$CE:"
cat errors.txt
exit 0;
fi

cd "../../"
echo "Running tests..."
for test in $TESTS
do
if [[ "$test" != "-o" ]] && [[ "$test" != "-i" ]] && [[ "$test" != "-e" ]]
then
"$FOLDER/single_test.sh" "$test" $*
fi
done