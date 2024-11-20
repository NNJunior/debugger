FOLDER=$(realpath "$(dirname "$0")");

source "$FOLDER/colors.sh"

echo -e "Enter environment name: ";
read ENV_NAME;

cp -r "$FOLDER/../template" "$ENV_NAME";
cd "$ENV_NAME";
"$FOLDER/config.sh" compile
"$FOLDER/config.sh" run
"$FOLDER/config.sh" check
"$FOLDER/config.sh" generate
cd ../
echo -e "'$ENV_NAME' is available at $(realpath "$ENV_NAME")"
echo -e "${RED}To run commands inside of '$ENV_NAME' you should move to $(realpath "$ENV_NAME")${NC}"
