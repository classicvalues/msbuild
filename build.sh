OUTPUT_DIR=output
BUILD_DIR=$OUTPUT_DIR/builds
VERSION_TXT=$BUILD_DIR/version.txt
./cibuild.sh --scope Compile --target Mono --host Mono --config Release
mkdir $OUTPUT_DIR
mv ./bin/Release-MONO/AnyCPU/OSX/OSX_Deployment $BUILD_DIR

touch $VERSION_TXT
echo "Repository: " >> $VERSION_TXT
git remote get-url origin >> $VERSION_TXT
echo "Branch: " >> $VERSION_TXT
git branch >> $VERSION_TXT
echo "Commit: " >> $VERSION_TXT
git log -n 1 --pretty=format:%H >> $VERSION_TXT

pushd $OUTPUT_DIR
7z a -tzip -r ../builds.zip ./builds
popd
