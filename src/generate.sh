FOLDER=$(realpath "$(dirname "$0")");

NUM=$1;
rm -r "testing/tests";
mkdir "testing/tests";
for (( i=0; i < $NUM; ++i ))
do
    touch "testing/tests/test$i.txt"
    "testing/scripts/generate.sh" &> "testing/tests/test$i.txt"
    echo -e "generated: test$i.txt"
done
