local tools = {}

function tools.define_wugdbox_path()
  local hostname = vim.loop.os_gethostname()
  local wugdstation = 'DESKTOP-0NSETTQ'

  if hostname == wugdstation then
    return '/mnt/d/wugdbox/'
  else
    return '/mnt/c/Users/aryabyshkin/vaults/wugdbox/'
  end
end

return tools
