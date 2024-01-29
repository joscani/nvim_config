local dap = require('dap')

--dap.adapters.r = {
--  type = 'server',
--  port = 18721,  -- needs to match `debugadapter::run()`'s `port` argument
--}
--
--dap.configurations.r = {
--  {
--    type = 'r',
--    request = 'attach',
--    name = 'Attach session'
--  }
--}
dap.adapters.r = {
  type = 'executable',
  command = 'R',
  args = {'--slave', '-e', 'vscDebugger::.vsc.listenForDAP()'}
}
dap.configurations.r = {
  {
    type = 'r',
    request = 'launch',
    name = "Launch R",
  }
}
