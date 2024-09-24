FOLDER=$(realpath "$(dirname "$0")");

NUM=$1
for (( i=0; i < $NUM; ++i ))
do
    touch "testing/tests/test$i.txt"
    "testing/scripts/generate.sh" &> "testing/tests/test$i.txt"
done