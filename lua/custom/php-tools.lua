local M = {}
local uv = vim.loop

local function find_file_upwards(candidates)
	for _, name in ipairs(candidates) do
		local path = vim.fn.findfile(name, vim.fn.getcwd() .. ";")
		if path ~= "" and path ~= nil then
			return vim.fn.fnamemodify(path, ":p")
		end
	end
	return nil
end

function M.find_php_cs_fixer_config()
	return find_file_upwards({
		".php-cs-fixer.php",
		"app/.php-cs-fixer.php",
		".php-cs-fixer.dist.php",
		"app/.php-cs-fixer.dist.php",
		"php-cs-fixer.php",
		"app/php-cs-fixer.php",
		"php-cs-fixer.dist.php",
		"app/php-cs-fixer.dist.php",
	})
end

function M.find_phpstan_bin()
	return find_file_upwards({
		"phpstan",
		"app/phpstan",
	})
	-- return find_file_upwards({
	-- 	"vendor/bin/phpstan",
	-- 	"app/vendor/bin/phpstan",
	-- })
end

-- if _docker_compose ps --filter "status=running" --services | grep -qe "$service"; then
--     _docker_compose exec $DTTY --user "1000" "$@"
-- else
--     _docker_compose run --rm $DTTY --user "1000" "$@"
-- fi

function M.find_php_cs_fixer_bin()
	return find_file_upwards({
		"vendor/bin/php-cs-fixer",
		"app/vendor/bin/php-cs-fixer",
	})
end

function M.find_phpstan_config()
	return find_file_upwards({
		"phpstan.neon",
		"app/phpstan.neon",
		"phpstan.dist.neon",
		"app/phpstan.dist.neon",
	})
end

function M.build_vendor_excludes()
	local bundles = vim.fn.getcwd() .. "/bundles"
	local vendor = vim.fn.getcwd() .. "/app/vendor"

	if not uv.fs_stat(bundles) or not uv.fs_stat(vendor) then
		return {}
	end

	local excludes = {}
	for _, dir in ipairs(vim.fn.readdir(bundles)) do
		local bundleName = vendor .. "/xproduction/" .. dir .. "-bundle"
		if uv.fs_stat(bundleName) then
			table.insert(excludes, bundleName .. "/**")
		end
	end

	return excludes
end

return M
