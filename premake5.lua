local projectOut  = "./"
local projectName = "ProjectHandler"
local solutionDir = projectOut .. projectName
local projectDir  = solutionDir .. "/" .. projectName

workspace (projectName)
    configurations { "Debug", "Release" }
    platforms      { "x64" }
	location       (solutionDir)

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines  { "NDEBUG" }
        optimize "On"

    filter "platforms:x64"
        architecture "x64"

    project (projectName)
        kind      "ConsoleApp"
        language  "C++"
        targetdir "$(SolutionDir)bin/$(Configuration)-$(Platform)/$(ProjectName)"
        objdir    "$(SolutionDir)bin-int/$(Configuration)-$(Platform)/$(ProjectName)"
        
        includedirs {
            'src'
        }

        location  (projectDir)
        files { 
           "src/**.cpp"
        }

        vpaths {
            ["src"] = { "**.cpp", "*.h" }
        }

        filter "system:windows"

            systemversion "latest"
            cppdialect    "C++20"
            staticruntime "On"
        