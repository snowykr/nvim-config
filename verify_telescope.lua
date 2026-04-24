local function fail(message)
  io.stderr:write(message .. "\n")
  vim.cmd("cquit 1")
end

local function ok(condition, message)
  if not condition then
    fail(message)
  end
end

local telescope_previewers = require("telescope.previewers.utils")
local telescope_builtin = require("telescope.builtin")

local buffer = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(buffer, 0, -1, false, { "local x = 1" })
vim.bo[buffer].filetype = "lua"

local highlighter_ok, highlighter_result = pcall(telescope_previewers.ts_highlighter, buffer, "lua")
ok(highlighter_ok, "telescope ts_highlighter crashed: " .. tostring(highlighter_result))

local find_files_ok, find_files_error = pcall(function()
  telescope_builtin.find_files({ cwd = vim.fn.getcwd() })
end)
ok(find_files_ok, "telescope find_files crashed: " .. tostring(find_files_error))

print("verify_telescope.lua: ok")
vim.cmd("qa")
