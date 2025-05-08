local log = require("key-analyzer.util.log")

local KeyAnalyzer = {}

--- KeyAnalyzer configuration with its default values.
---
---@type table
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
KeyAnalyzer.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
    -- Name of the command to use for the plugin, leave empty or false to disable the command.
    command_name = "KeyAnalyzer",
    highlights = {
        bracket_used = "KeyAnalyzerBracketUsed",
        letter_used = "KeyAnalyzerLetterUsed",
        bracket_unused = "KeyAnalyzerBracketUnused",
        letter_unused = "KeyAnalyzerLetterUnused",
        promo_highlight = "KeyAnalyzerPromo",
        -- If you are using any of the built-in highlight groups you should leave this enabled
        define_default_highlights = true,
    },
    -- Keyboard layout to use
    -- Available options are: qwerty, colemak, colemak-dh, azerty, qwertz
    layout = "qwerty",
    -- Should a link to https://x.com/OtivDev be displayed?
    promotion = true,
}

---@private
local defaults = vim.deepcopy(KeyAnalyzer.options)

--- Defaults KeyAnalyzer options by merging user provided options with the default plugin values.
---
---@param options table Module config table. See |KeyAnalyzer.options|.
---
---@private
function KeyAnalyzer.defaults(options)
    KeyAnalyzer.options = vim.deepcopy(vim.tbl_deep_extend("keep", options or {}, defaults or {}))

    -- let your user know that they provided a wrong value, this is reported when your plugin is executed.
    assert(
        type(KeyAnalyzer.options.debug) == "boolean",
        "`debug` must be a boolean (`true` or `false`)."
    )

    return KeyAnalyzer.options
end

--- Define your key-analyzer setup.
---
---@param options table Module config table. See |KeyAnalyzer.options|.
---
---@usage `require("key-analyzer").setup()` (add `{}` with your |KeyAnalyzer.options| table)
function KeyAnalyzer.setup(options)
    KeyAnalyzer.options = KeyAnalyzer.defaults(options or {})

    log.warn_deprecation(KeyAnalyzer.options)

    return KeyAnalyzer.options
end

return KeyAnalyzer
