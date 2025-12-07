local M = {}
local uv = vim.uv or vim.loop

local patterns = {
	php_cs_config = { ".php-cs-fixer.php", ".php-cs-fixer.dist.php", "php-cs-fixer.php", "php-cs-fixer.dist.php" },
	php_cs_bin = { "vendor/bin/php-cs-fixer" },
	vendor_autoload = { "vendor/autoload.php" },
}

local function expand_app_paths(names)
	local candidates = {}
	for _, name in ipairs(names) do
		table.insert(candidates, name)
		table.insert(candidates, "app/" .. name)
	end
	return candidates
end

local function find_first(names)
	local candidates = expand_app_paths(names)
	local results = vim.fs.find(candidates, {
		upward = true,
		stop = vim.env.HOME,
		path = vim.fn.getcwd(),
		limit = 1,
	})

	if #results > 0 then
		return vim.fs.normalize(results[1])
	end
	return nil
end

function M.find(key)
	if not patterns[key] then
		return nil
	end
	return find_first(patterns[key])
end

function M.find_container(env)
	return find_first({
		string.format("var/cache/%s/dev/App_KernelDevDebugContainer.xml", env),
	})
end

function M.find_vendor_dir()
	local autoload = M.find("vendor_autoload")
	if autoload then
		return vim.fs.dirname(autoload)
	end
	return nil
end

function M.get_vendor_excludes()
	local cwd = vim.fn.getcwd()
	if not uv.fs_stat(cwd .. "/bundles") or not uv.fs_stat(cwd .. "/app/vendor") then
		return {}
	end

	local excludes = {}
	local handle = uv.fs_scandir(cwd .. "/bundles")

	if handle then
		while true do
			local name = uv.fs_scandir_next(handle)
			if not name then
				break
			end

			local bundle_path = string.format("%s/app/vendor/xproduction/%s-bundle", cwd, name)

			if uv.fs_stat(bundle_path) then
				table.insert(excludes, bundle_path .. "/**")
			end
		end
	end

	return excludes
end

return M
