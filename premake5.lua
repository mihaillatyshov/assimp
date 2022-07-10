project "assimp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"revision.h",
		"code/**.h", "code/**.hpp", "code/**.cpp", "code/**.c", "code/**.inl",
		"include/**.h", "include/**.hpp", "include/**.cpp", "include/**.c", "include/**.inl",	
		"contrib/**.h", "contrib/**.hpp", "contrib/**.cpp", "contrib/**.c", "contrib/**.inl",
	}

	removefiles { 
		"code/AssetLib/C4D/**",
		"code/AssetLib/IFC/IFCReaderGen_4.cpp",
		"code/AssetLib/IFC/IFCReaderGen_4.h",
		"code/Common/assbin_chunks.h",
		"code/Common/AssertHandler.h",
		"code/Common/FileSystemFilter.h",
		"contrib/zlib/contrib/**",
	}

	includedirs
	{
		"%{prj.location}",
		"include/",
		"code/",
		"contrib/",
		"contrib/zlib/",
		"contrib/zip/src/",
		"contrib/unzip/",
		"contrib/pugixml/src/",
		"contrib/rapidjson/include/",
		"contrib/openddlparser/include/",
	}

	defines 
	{
		"DWIN32_LEAN_AND_MEAN",
		"OPENDDL_STATIC_LIBARY",
		"RAPIDJSON_NOMEMBERITERATORCLASS",
		"RAPIDJSON_HAS_STDSTRING",
		"_CRT_SECURE_NO_WARNINGS",
		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"ASSIMP_BUILD_NO_IFC_IMPORTER"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "On"

	filter "configurations:*Debug*"
		runtime "Debug"
		symbols "on"

	filter "configurations:*Release*"
		runtime "Release"
		optimize "on"