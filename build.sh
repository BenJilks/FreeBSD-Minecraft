#!/bin/sh

# Fetch LWJGL source
wget https://github.com/LWJGL/lwjgl3/archive/3.2.2.tar.gz 
tar -xf 3.2.2.tar.gz
mv lwjgl3-3.2.2 lwjgl3
rm 3.2.2.tar.gz

# Fetch launcher
wget https://launcher.mojang.com/v1/objects/eabbff5ff8e21250e33670924a0c5e38f47c840b/launcher.jar
mv launcher.jar Minecraft.jar

# Patch LWJGL
cp patch/linux/* lwjgl3/config/linux/

# Build LWJGL
cd lwjgl3
ant -Dos.name=Linux -Dplatform=linux compile-templates
cp ../patch/org_lwjgl_stb_STBVorbis.c modules/lwjgl/stb/src/generated/c/org_lwjgl_stb_STBVorbis.c
ant -Dos.name=Linux -Dplatform=linux compile-native

cp ../scripts/build_java.sh bin/
cd bin
./build_java.sh core
./build_java.sh opengl
./build_java.sh openal
./build_java.sh stb
./build_java.sh jemalloc
./build_java.sh glfw
mkdir RELEASE/lwjgl
cp RELEASE/lwjgl-core/lwjgl-core.jar RELEASE/lwjgl/lwjgl.jar
cd ../..


