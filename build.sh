./cibuild.sh --scope Compile --target Mono --host Mono --config Release
mkdir output
mv ./bin/Release-MONO/AnyCPU/OSX/OSX_Deployment ./output/builds
pushd output
7z a -tzip -r ../builds.zip ./builds
popd
