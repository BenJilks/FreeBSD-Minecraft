#/bin/sh

NAME=$1
mkdir -p RELEASE/lwjgl-$NAME/

cd classes/lwjgl/$NAME/
jar cf ../../../RELEASE/lwjgl-$NAME/lwjgl-$NAME.jar org

