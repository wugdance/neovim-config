local tools = {}
local wugdstation = 'DESKTOP-0NSETTQ'
local wugdozon = 'NB-PF2TP99M'

function tools.define_wugdbox_path()
  local hostname = vim.loop.os_gethostname()

  if hostname == wugdstation then
    return '/mnt/d/wugdbox/'
  elseif hostname == wugdozon then
    return '/mnt/c/Users/aryabyshkin/vaults/wugdbox/'
  else
    error('The unsupported hostname ' .. hostname .. 'has been gotten.')
  end
end

return tools
