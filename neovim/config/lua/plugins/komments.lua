return {
  dir = "/home/amustafa/workspace/komments",
  dependencies = { "kkharji/sqlite.lua" },
  config = function()
    require("komments").setup()
  end,
}
