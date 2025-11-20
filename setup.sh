WORKING_DIR="~/projects/blender/blender-explore"

cd "$WORKING_DIR"
cmake -B ../build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
cd ../build
ninja

cp compile_commands.json ../blender-explore/
