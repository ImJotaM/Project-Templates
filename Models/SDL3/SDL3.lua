newoption {
	trigger     = "projectName",
	value       = "TEXT",
	description = "Choose your project name"
}

local projectOut  = "Projects/"
local projectName = _OPTIONS["projectName"] or "DefaultProject"
local solutionDir = projectOut .. projectName
local projectDir  = solutionDir .. "/" .. projectName

local linking_dependencies = { "winmm", "setupapi", "imm32", "version", "SDL3-static" }

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
        location  (projectDir)
        includedirs "$(SolutionDir)_SDL3/include"
	    libdirs "$(SolutionDir)_SDL3/lib"
        links (linking_dependencies)

        filter "system:windows"

            systemversion "latest"
            cppdialect    "C++20"
            staticruntime "On"