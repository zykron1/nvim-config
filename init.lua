-- Add the 'core' folder to the Lua module path
local config_path = vim.fn.stdpath("config") .. "/"
package.path = config_path .. "?.lua;" .. package.path

-- Require the core modules
require("core.plugins")
require("core.keymaps")
require("core.lsp")
require("core.setups")
require("core.placement")
