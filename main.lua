-- table rocks
local rocks = {
  { name = "Tiny", value = 0.025 },
  { name = "Punching", value = 0.05 },
  { name = "Large", value = 0.075 },
  { name = "Golden", value = 0.2 },
  { name = "Frozen", value = 0.375 },
  { name = "Mystic", value = 0.75 },
  { name = "Inferno", value = 1.125 },
  { name = "Legends", value = 2.5 },
  { name = "Muscle King", value = 12.5 },
  { name = "Acient Jungle", value = 16.25 }
}

-- check the arguments
if #arg ~= 2 then
  io.stderr:write(string.format("[ERROR] Expected 2 arguments, but receive %d.\nUsage: lua main.lua [OPTION] <number>\n", #arg))
  os.exit(1)
end

local option = arg[1]
local inputNumber = tonumber(arg[2])

if option ~= "-r" and option ~= "--rebirth" then
    io.stderr:write("[ERROR] Invalid option. Use '-r' or '--rebirth' to specify rebirth amount.\n")
    os.exit(1)
end

if not inputNumber or inputNumber < 1 then
    io.stderr:write("[ERROR] Rebirth amount must be at least 1.\n")
    os.exit(1)
end

-- calculate and print
for _, rock in ipairs(rocks) do
  local exp = (inputNumber + 20) * rock.value
  local roundedExp = math.floor(exp + 0.5)
  print(string.format("%s rock: %d Exp", rock.name, roundedExp))
end