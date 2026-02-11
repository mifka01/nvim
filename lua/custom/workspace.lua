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

function M.find_root(bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr or 0)
	if bufname == "" then
		return vim.fn.getcwd()
	end

	local markers = { ".git", "composer.json", "phpstan.neon", ".php-cs-fixer.php", "run" }
	local dir = vim.fn.fnamemodify(bufname, ":h")

	while dir ~= "/" and dir ~= "" do
		for _, marker in ipairs(markers) do
			if uv.fs_stat(dir .. "/" .. marker) then
				if not dir:match("/vendor/") then
					return dir
				end
			end
		end
		dir = vim.fn.fnamemodify(dir, ":h")
	end

	return vim.fn.getcwd()
end

function M.is_xaver_project()
	local cwd = vim.fn.getcwd()
	return cwd:match("xaver") ~= nil or uv.fs_stat(cwd .. "/bundles")
end

function M.get_lint_root()
	if M.is_xaver_project() then
		return vim.fn.getcwd()
	else
		return M.find_root(0)
	end
end

function M.get_container_path(bufname)
	bufname = bufname or vim.api.nvim_buf_get_name(0)
	local root = M.get_lint_root()

	if M.is_xaver_project() then
		if bufname:match("^" .. vim.pesc(root .. "/app/")) then
			return bufname:gsub("^" .. vim.pesc(root .. "/app/"), "/var/www/")
		elseif bufname:match("^" .. vim.pesc(root .. "/bundles/")) then
			return bufname:gsub("^" .. vim.pesc(root .. "/bundles/"), "/var/bundles/")
		end
	else
		if bufname:match("^" .. vim.pesc(root .. "/")) then
			return bufname:gsub("^" .. vim.pesc(root .. "/"), "/var/www/")
		end
	end
	return bufname
end

function M.get_local_path(container_path)
	local root = M.get_lint_root()

	if M.is_xaver_project() then
		if container_path:match("^/var/www/") then
			return container_path:gsub("^/var/www/", root .. "/app/")
		elseif container_path:match("^/var/bundles/") then
			return container_path:gsub("^/var/bundles/", root .. "/bundles/")
		end
	else
		if container_path:match("^/var/www/") then
			return container_path:gsub("^/var/www/", root .. "/")
		end
	end
	return container_path
end

return M
