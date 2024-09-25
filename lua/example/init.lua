local M = {}

local function get_repo_url()
  local branch = vim.fn.systemlist("git branch --show-current")[1]
  local remote_lines = vim.fn.systemlist("git config branch." .. branch .. ".remote")

  if remote_lines ~= nil then
    Remote = remote_lines[1]
  else
    print("Could not determine remote, assuming origin")
    Remote = "origin"
  end

  Git_repo_results =  vim.fn.systemlist("git config --get remote." .. Remote .. ".url")[1]
  return Git_repo_results:gsub("%:","/"):gsub("git%@","https%://"):gsub("%.git", "")
end

local function get_revision()
    return vim.fn.systemlist("git rev-parse HEAD")[1]
end

local function get_path()
    local current_file = vim.fn.expand('%')
    return vim.fn.systemlist("git ls-files --full-name " .. current_file)[1]
end

local function get_line_anchors()
    local start = vim.fn.getpos("v")
    FirstLine = start[2]
    local stop = vim.fn.getpos(".")
    LastLine = stop[2]

    Line = "#L" .. FirstLine
    if FirstLine ~= LastLine then
       Line = Line .. "-L" .. LastLine
    end
    return Line
end

function M.setup(opts)
  opts = opts or {}

  vim.keymap.set({"n", "v"}, "<Leader>h", function()
    Repo_url = get_repo_url()
    Revision = get_revision()
    Line_anchors = get_line_anchors()
    Path = get_path()
    local url = "GitHubURL: " .. Repo_url .. "/blob/" .. Revision .. "/" .. Path .. Line_anchors
    vim.print(url)

   end)
end

return M
