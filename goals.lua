local moduleInfo = {
	name = "goals",
	desc = "module providing goalTypes currently", -- initial temporary version of the module
	author = "PepeAmpere",
	date = "2018-02-09",
	license = "MIT",
}


local goalTypes = {
	["captureFlags"] = {
		currentFlags = 0,
		flagsToWin = 0,
	
		Value = function(p)
			return p.currentFlags >= p.flagsToWin
		end,
		Tooltip = function(p)
			if (p.Value(p)) then
				return "Goal is completed."
			else
				return "Goal is not completed."
			end
		end,
		Counter = function(p)
			return p.currentFlags .. " / " .. p.flagsToWin	
		end,
		Description = function(p)
			return "Capture " .. p.flagsToWin .. " flags."
		end,
	},
	
	["holdFlags"] = {
		remainingTime = hmsf(0,0,0,0),
		totalTime = hmsf(0,0,0,0),
		totalTimeText = "0 minutes",
		flagsToWin = 0,
	
		Value = function(p)
			return p.remainingTime <= hmsf(0,0,0,0)
		end,
		Tooltip = function(p)
			if (p.Value(p)) then
				return "Goal is completed."
			else
				return "Goal is not completed."
			end
		end,
		Counter = function(p)
			return p.remainingTime:HHMMSSFF(false,true,true,false)	
		end,
		Description = function(p)
			return "Hold " .. p.flagsToWin .. " flags for " .. p.totalTimeText .. "."
		end,
	},
	
	["preventCapturingFlags"] = {
		currentFlags = 0,
		flagsToWin = 0,
		allianceID = -1,
	
		Value = function(p)
			return p.currentFlags < p.flagsToWin
		end,
		Tooltip = function(p)
			if (p.Value(p)) then
				return "Goal is completed."
			else
				return "Goal is not completed."
			end
		end,
		Counter = function(p)
			return p.currentFlags .. " / " .. p.flagsToWin	
		end,
		Description = function(p)
			return "Prevent alliance " .. p.allianceID .. " from capturing " .. p.flagsToWin .. " flags."
		end,
	},
	
	["preventHoldingFlags"] = {
		remainingTime = hmsf(0,0,0,0),
		totalTime = hmsf(0,0,0,0),
		totalTimeText = "0 minutes",
		flagsToWin = 0,
		allianceID = -1,
	
		Value = function(p)
			return p.remainingTime > hmsf(0,0,0,0)
		end,
		Tooltip = function(p)
			if (p.Value(p)) then
				return "Goal is completed."
			else
				return "Goal is not completed."
			end
		end,
		Counter = function(p)
			return p.remainingTime:HHMMSSFF(false,true,true,false)
		end,
		Description = function(p)
			return "Prevent alliance " .. p.allianceID .. " from holding " .. p.flagsToWin .. " flags for " .. p.totalTimeText .. "."
		end,
	},	
}

return goalTypes
