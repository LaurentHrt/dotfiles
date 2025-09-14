local wezterm = require 'wezterm'

local module = {}

function module.filterImageFiles(filenames)
  local filteredFiles = {}
  for _, filename in ipairs(filenames) do
    if filename:lower():find '%.jpg$' or filename:lower():find '%.jpeg$' or filename:lower():find '%.png$' or filename:lower():find '%.gif$' then
      wezterm.log_error 'match'
      table.insert(filteredFiles, filename)
    end
  end

  return filteredFiles
end

-- Function to pick a random filename from a list
function module.getRandomElement(array)
  if #array == 0 then
    return nil
  end
  local randomIndex = math.random(1, #array)
  return array[randomIndex]
end

-- Function to get the colorScheme (will be used to change the colorScheme by script more easily)
function module.getColorScheme()
  local colorScheme = 'tokyonight'
  return colorScheme
end

return module
