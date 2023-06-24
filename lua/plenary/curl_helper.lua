local function has_data_raw_support(version)
  local major = version[0]

  if major < 7
  then
    return false
  end

  local minor = version[1]

  if minor < 43
  then
    return false
  end

  return true
end


local function get_curl_version()
  local handler = io.popen("curl --version")
  local output = handler:read("*a")
  handler:close()

  local version = string.match(output, "^curl%s([%d%.%w]+)%s+")
  local digits = {}

  local index = 0
  for number in version:gmatch("%d+")
  do
    digits[index] = tonumber(number)
    index = index + 1
  end

  return digits
end

local HAS_DATA_RAW_SUPPORT = has_data_raw_support(get_curl_version())

module = {}
module.HAS_DATA_RAW_SUPPORT = HAS_DATA_RAW_SUPPORT

return module
