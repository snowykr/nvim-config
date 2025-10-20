return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true,     -- 입력시 바로 추천
                debounce = 100,         -- 디바운스(ms)
                keymap = {
                  accept = "<C-l>",     -- 추천 수락 키맵
                },
            },
            panel = { enabled = false },
        })
    end,
}

