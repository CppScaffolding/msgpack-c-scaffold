-- scaffold geniefile for msgpack-c

msgpack-c_script = path.getabsolute(path.getdirectory(_SCRIPT))
msgpack-c_root = path.join(msgpack-c_script, "msgpack-c")

msgpack-c_includedirs = {
	path.join(msgpack-c_script, "config"),
	msgpack-c_root,
}

msgpack-c_libdirs = {}
msgpack-c_links = {}
msgpack-c_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { msgpack-c_includedirs }
	end,

	_add_defines = function()
		defines { msgpack-c_defines }
	end,

	_add_libdirs = function()
		libdirs { msgpack-c_libdirs }
	end,

	_add_external_links = function()
		links { msgpack-c_links }
	end,

	_add_self_links = function()
		links { "msgpack-c" }
	end,

	_create_projects = function()

project "msgpack-c"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		msgpack-c_includedirs,
	}

	defines {}

	files {
		path.join(msgpack-c_script, "config", "**.h"),
		path.join(msgpack-c_root, "**.h"),
		path.join(msgpack-c_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
