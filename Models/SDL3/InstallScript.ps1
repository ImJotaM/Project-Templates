$target = "Lib\"

$SDL3_include = $target + "_SDL3\include"
mkdir $SDL3_include
$SDL3_lib = $target + "_SDL3\lib"
mkdir $SDL3_lib

$SDL3_src_include = "Source\include\SDL3"
$SDL3_src_lib = "Source\Build\Release\SDL3-static.lib"

git clone https://github.com/libsdl-org/SDL Source
Set-Location Source

mkdir build
Set-Location build

cmake .. -DSDL_SHARED=OFF -DSDL_STATIC=ON
cmake --build . --config release

Set-Location "..\..\"
Copy-Item -Path $SDL3_src_include -Destination $SDL3_include -Recurse
Copy-Item       $SDL3_src_lib     -Destination $SDL3_lib
