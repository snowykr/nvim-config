return {
  "ojroques/nvim-osc52",
  config = function()
    -- OSC52를 Neovim의 기본 클립보드 백엔드로 설정하는 함수 정의
    local function copy(lines, _)
      require("osc52").copy(table.concat(lines, "\n"))
    end

    local function paste()
      return {vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("")}
    end

    -- vim.g.clipboard 설정을 통해 OSC52를 사용하도록 지정
    vim.g.clipboard = {
      name = 'osc52',
      copy = {
        ['+'] = copy,
        ['*'] = copy,
      },
      paste = {
        ['+'] = paste,
        ['*'] = paste,
      },
    }
    
    -- (선택 사항) 'y'만 눌러도 시스템 클립보드로 복사되게 하려면 아래 주석을 해제하세요
    vim.opt.clipboard:append("unnamedplus")
  end,
}
