FOLDER=$(realpath "$(dirname "$0")");

if [[ "$1" == "compile" ]]
then
nano "run/scripts/compile.sh";
elif [[ "$1" == "run" ]]
then
nano "run/scripts/run.sh";
elif [[ "$1" == "check" ]]
then
nano "testing/scripts/check.sh";
elif [[ "$1" == "generate" ]]
then
nano "testing/scripts/generate.sh";
elif [[ "$1" == "addtest" ]]
then
nano "testing/tests/$2";
fi