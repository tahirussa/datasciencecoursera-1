trim <- function(i = character){
    i[i %in% c("ASTRONOMICAL LOW TIDE")] <- "Astronomical Low Tide"
    i[i %in% c("AVALANCE", "AVALANCHE")] <- "Avalanche"
    i[i %in% c("BLIZZARD", "BLIZZARD/WINTER STORM", 
               "GROUND BLIZZARD")] <- "Blizzard"
    i[i %in% c("COASTAL  FLOODING/EROSION", "COASTAL EROSION", "Coastal Flood", 
               "COASTAL FLOOD", "Coastal Flooding", "COASTAL FLOODING", 
               "COASTAL FLOODING/EROSION", "Erosion/Cstl Flood", 
               "Tidal Flooding", "TIDAL FLOODING")] <- "Coastal Flood"
    i[i %in% c("Cold", "COLD", "COLD AND SNOW", "COLD AND WET CONDITIONS", 
               "Cold Temperature", "COLD WAVE", "COLD WEATHER", 
               "COLD/WIND CHILL", "COLD/WINDS", "COOL AND WET", 
               "LOW TEMPERATURE", "RECORD COLD", "SNOW/COLD", 
               "Unseasonable Cold", "UNSEASONABLY COLD")] <- "Cold/Wind Chill"
    i[i %in% c("LANDSLIDE", "LANDSLIDES", "Landslump", "MUD SLIDE", 
               "MUD SLIDES", "MUD SLIDES URBAN FLOODING", "Mudslide", 
               "MUDSLIDE", "Mudslides", "MUDSLIDES", 
               "ROCK SLIDE")] <- "Debris Flow"
    i[i %in% c("DENSE FOG", "FOG")] <- "Dense Fog"
    i[i %in% c("DENSE SMOKE")] <- "Dense Smoke"
    i[i %in% c("DROUGHT", "DROUGHT/EXCESSIVE HEAT", "DROWNING", 
               "DRY MICROBURST", "DRY MIRCOBURST WINDS", 
               "UNSEASONABLY WARM AND DRY")] <- "Drought"
    i[i %in% c("BLOWING DUST", "DUST DEVIL", 
               "DUST DEVIL WATERSPOUT")] <- "Dust Devil"
    i[i %in% c("DUST STORM", "DUST STORM/HIGH WINDS")] <- "Dust Storm"
    i[i %in% c("EXCESSIVE HEAT", "EXTREME HEAT", "HYPERTHERMIA/EXPOSURE", 
               "RECORD/EXCESSIVE HEAT")] <- "Excessive Heat"
    i[i %in% c("Extended Cold", "Extreme Cold", "EXTREME COLD", 
               "EXTREME COLD/WIND CHILL", "EXTREME WIND CHILL", 
               "EXTREME WINDCHILL", "HYPOTHERMIA", "Hypothermia/Exposure", 
               "HYPOTHERMIA/EXPOSURE", 
               "SNOW/ BITTER COLD")] <- "Extreme Cold/Wind Chill"
    i[i %in% c(" FLASH FLOOD", "FLASH FLOOD", "FLASH FLOOD - HEAVY RAIN", 
               "FLASH FLOOD FROM ICE JAMS", "FLASH FLOOD LANDSLIDES", 
               "FLASH FLOOD WINDS", "FLASH FLOOD/", "FLASH FLOOD/ STREET", 
               "FLASH FLOOD/FLOOD", "FLASH FLOOD/LANDSLIDE", 
               "FLASH FLOODING", "FLASH FLOODING/FLOOD", 
               "FLASH FLOODING/THUNDERSTORM WI", "FLASH FLOODS", 
               "FLOOD FLASH", "FLOOD/FLASH")] <- "Flash Flood"
    i[i %in% c("BREAKUP FLOODING", "DAM BREAK", "FLOOD", 
               "FLOOD & HEAVY RAIN", "FLOOD/FLASH FLOOD", 
               "FLOOD/FLASH/FLOOD", "FLOOD/FLASHFLOOD", "FLOOD/RAIN/WINDS", 
               "FLOOD/RIVER FLOOD", "FLOODING", "FLOODING/HEAVY RAIN", 
               "FLOODS", "MAJOR FLOOD", "MINOR FLOODING", 
               "RIVER AND STREAM FLOOD", "RIVER FLOOD", "River Flooding", 
               "RIVER FLOODING", "RURAL FLOOD", "SMALL STREAM FLOOD", 
               "SNOWMELT FLOODING", "URBAN AND SMALL STREAM FLOODIN", 
               "URBAN FLOOD", "URBAN FLOODING", "URBAN FLOODS", 
               "URBAN/SMALL STREAM", "URBAN/SMALL STREAM FLOOD", 
               "URBAN/SML STREAM FLD")] <- "Flood"
    i[i %in% c("AGRICULTURAL FREEZE", "Damaging Freeze", 
               "DAMAGING FREEZE", "Early Frost", "Freeze", "FREEZE", 
               "Freezing drizzle", "Freezing Drizzle", 
               "FREEZING DRIZZLE", "FROST", "Frost/Freeze", 
               "FROST/FREEZE", "HARD FREEZE", 
               "FROST\\FREEZE")] <- "Frost/Freeze"
    i[i %in% c("FUNNEL CLOUD")] <- "Funnel Cloud"
    i[i %in% c("FOG AND COLD TEMPERATURES", 
               "FREEZING FOG")] <- "Freezing Fog"
    i[i %in% c("HAIL", "HAIL 0.75", "HAIL 075", "HAIL 100", "HAIL 125", 
               "HAIL 150", "HAIL 175", "HAIL 200", "HAIL 275", "HAIL 450", 
               "HAIL 75", "HAIL DAMAGE", "HAIL/WIND", "HAIL/WINDS", 
               "HAILSTORM", "HEAVY PRECIPITATION", "SMALL HAIL", 
               "THUNDERSTORM HAIL", "WIND/HAIL")] <- "Hail"
    i[i %in% c("HEAT", "Heat Wave", "HEAT WAVE", "HEAT WAVE DROUGHT", 
               "HEAT WAVES", "RECORD HEAT")] <- "Heat"
    i[i %in% c("EXCESSIVE RAINFALL", "EXCESSIVE WETNESS", "HEAVY RAIN", 
               "HEAVY RAIN AND FLOOD", "Heavy Rain/High Surf", 
               "HEAVY RAIN/LIGHTNING", "HEAVY RAIN/SEVERE WEATHER", 
               "HEAVY RAIN/SMALL STREAM URBAN", "HEAVY RAIN/SNOW", 
               "HEAVY RAINS", "HEAVY RAINS/FLOODING", 
               "HEAVY SHOWER", "HVY RAIN", "RAINSTORM", 
               "Torrential Rainfall")] <- "Heavy Rain"
    i[i %in% c("blowing snow", "BLOWING SNOW", "EXCESSIVE SNOW", 
               "FALLING SNOW/ICE", "HEAVY SNOW", "HEAVY SNOW AND HIGH WINDS", 
               "HEAVY SNOW AND STRONG WINDS", "Heavy snow shower", 
               "HEAVY SNOW SQUALLS", "HEAVY SNOW-SQUALLS", 
               "HEAVY SNOW/BLIZZARD", "HEAVY SNOW/BLIZZARD/AVALANCHE", 
               "HEAVY SNOW/FREEZING RAIN", "HEAVY SNOW/HIGH WINDS & FLOOD", 
               "HEAVY SNOW/ICE", "HEAVY SNOW/SQUALLS", "HEAVY SNOW/WIND", 
               "HEAVY SNOW/WINTER STORM", "HEAVY SNOWPACK", 
               "SNOW ACCUMULATION", "SNOW AND HEAVY SNOW", 
               "SNOW/BLOWING SNOW", "SNOW/HEAVY SNOW", 
               "THUNDERSNOW")] <- "Heavy Snow"
    i[i %in% c("   HIGH SURF ADVISORY", "ASTRONOMICAL HIGH TIDE", 
               "HAZARDOUS SURF", "HEAVY SEAS", "Heavy Surf", "HEAVY SURF", 
               "Heavy surf and wind", "HEAVY SURF COASTAL FLOODING", 
               "HEAVY SURF/HIGH SURF", "HEAVY SWELLS", "HIGH SEAS", "High Surf", 
               "HIGH SURF", "HIGH SWELLS", "HIGH TIDES", "HIGH WATER", 
               "HIGH WAVES", "ROGUE WAVE", "ROUGH SEAS", 
               "ROUGH SURF")] <- "High Surf"
    i[i %in% c("gradient wind", "Gradient wind", 
               "GRADIENT WIND", "HIGH  WINDS", "HIGH WIND", "HIGH WIND (G40)", 
               "HIGH WIND 48", "HIGH WIND AND SEAS", "HIGH WIND DAMAGE", 
               "HIGH WIND/BLIZZARD", "HIGH WIND/HEAVY SNOW", "HIGH WIND/SEAS", 
               "HIGH WINDS", "HIGH WINDS HEAVY RAINS", "HIGH WINDS/", 
               "HIGH WINDS/COASTAL FLOOD", "HIGH WINDS/COLD", 
               "HIGH WINDS/HEAVY RAIN", "HIGH WINDS/SNOW", "NON TSTM WIND", 
               "NON-SEVERE WIND DAMAGE", "NON-TSTM WIND", 
               "SNOW/HIGH WINDS")] <- "High Wind"
    i[i %in% c("HURRICANE", "Hurricane Edouard", "HURRICANE EMILY", 
               "HURRICANE ERIN", "HURRICANE FELIX", "HURRICANE GORDON", 
               "HURRICANE OPAL", "HURRICANE OPAL/HIGH WINDS", 
               "HURRICANE-GENERATED SWELLS", "HURRICANE/TYPHOON", 
               "LANDSPOUT", "TYPHOON")] <- "Hurricane"
    i[i %in% c("BLACK ICE", "GLAZE ICE", "GLAZE/ICE STORM", 
               "ICE", "ICE AND SNOW", "ICE FLOES", "ICE JAM", 
               "Ice jam flood (minor", "ICE JAM FLOODING", "ICE ON ROAD", 
               "ICE ROADS", "ICE STORM", "ICE STORM/FLASH FLOOD", 
               "ICE/STRONG WINDS", "ICY ROADS", "SNOW AND ICE", 
               "SNOW AND ICE STORM", "SNOW FREEZING RAIN", "SNOW SQUALL", 
               "Snow Squalls", "SNOW SQUALLS", "SNOW/ ICE", "SNOW/ICE", 
               "SNOW/ICE STORM")] <- "Ice Storm"
    i[i %in% c("HEAVY LAKE SNOW", "Lake Effect Snow", 
               "LAKE EFFECT SNOW", "LAKE-EFFECT SNOW")] <- "Lake-Effect Snow"
    i[i %in% c("LAKE FLOOD", "LAKESHORE FLOOD")] <- "Lakeshore Flood"
    i[i %in% c("LIGHTING", "LIGHTNING", "LIGHTNING  WAUSEON", 
               "LIGHTNING AND HEAVY RAIN", "LIGHTNING AND THUNDERSTORM WIN", 
               "LIGHTNING FIRE", "LIGHTNING INJURY", 
               "LIGHTNING THUNDERSTORM WINDS", "LIGHTNING.", 
               "LIGHTNING/HEAVY RAIN", "LIGNTNING")] <- "Lightning"
    i[i %in% c("MARINE HAIL")] <- "Marine Hail"
    i[i %in% c("MARINE HIGH WIND")] <- "Marine High Wind"
    i[i %in% c("MARINE STRONG WIND")] <- "Marine Strong Wind"
    i[i %in% c("MARINE THUNDERSTORM WIND", 
               "MARINE TSTM WIND")] <- "Marine Thunderstorm Wind"
    i[i %in% c("RIP CURRENT", "RIP CURRENTS", 
               "RIP CURRENTS/HEAVY SURF")] <- "Rip Current"
    i[i %in% c("RAPIDLY RISING WATER", "SEICHE")] <- "Seiche"
    i[i %in% c("Freezing Rain", "FREEZING RAIN", "FREEZING RAIN/SLEET", 
               "FREEZING RAIN/SNOW", "Freezing Spray", 
               "LIGHT FREEZING RAIN", "MIXED PRECIP", "Mixed Precipitation", 
               "MIXED PRECIPITATION", "SLEET", "SLEET/ICE STORM", 
               "SNOW/FREEZING RAIN", "SNOW/SLEET", 
               "SNOW/SLEET/FREEZING RAIN")] <- "Sleet"
    i[i %in% c("Coastal Storm", "COASTAL STORM", "COASTAL SURGE", 
               "COASTALSTORM", "STORM SURGE", 
               "STORM SURGE/TIDE")] <- "Storm Surge/Tide"
    i[i %in% c("GUSTNADO", "GUSTY WIND", "GUSTY WIND/HAIL", 
               "GUSTY WIND/HVY RAIN", "Gusty wind/rain", "Gusty winds", 
               "Gusty Winds", "GUSTY WINDS", "MICROBURST WINDS", 
               "STORM FORCE WINDS", "STRONG WIND", "Strong Winds", 
               "STRONG WINDS", "Wind Damage", "WIND DAMAGE", 
               "WIND STORM")] <- "Strong Wind"
    i[i %in% c(" TSTM WIND", " TSTM WIND (G45)", "SEVERE THUNDERSTORM", 
               "SEVERE THUNDERSTORM WINDS", "SEVERE THUNDERSTORMS", 
               "THUDERSTORM WINDS", "THUNDEERSTORM WINDS", 
               "THUNDERESTORM WINDS", "THUNDERSTORM", "THUNDERSTORM  WINDS", 
               "THUNDERSTORM DAMAGE TO", "THUNDERSTORM WIND", 
               "THUNDERSTORM WIND (G40)", "THUNDERSTORM WIND 60 MPH", 
               "THUNDERSTORM WIND 65 MPH", "THUNDERSTORM WIND 65MPH", 
               "THUNDERSTORM WIND 98 MPH", "THUNDERSTORM WIND G50", 
               "THUNDERSTORM WIND G52", "THUNDERSTORM WIND G55", 
               "THUNDERSTORM WIND G60", "THUNDERSTORM WIND TREES", 
               "THUNDERSTORM WIND.", "THUNDERSTORM WIND/ TREE", 
               "THUNDERSTORM WIND/ TREES", "THUNDERSTORM WIND/AWNING", 
               "THUNDERSTORM WIND/HAIL", "THUNDERSTORM WIND/LIGHTNING", 
               "THUNDERSTORM WINDS", "THUNDERSTORM WINDS 13", 
               "THUNDERSTORM WINDS 63 MPH", "THUNDERSTORM WINDS AND", 
               "THUNDERSTORM WINDS G60", "THUNDERSTORM WINDS HAIL", 
               "THUNDERSTORM WINDS LIGHTNING", "THUNDERSTORM WINDS.", 
               "THUNDERSTORM WINDS/ FLOOD", "THUNDERSTORM WINDS/FLOODING", 
               "THUNDERSTORM WINDS/FUNNEL CLOU", "THUNDERSTORM WINDS/HAIL", 
               "THUNDERSTORM WINDS53", "THUNDERSTORM WINDSHAIL", 
               "THUNDERSTORM WINDSS", "THUNDERSTORM WINS", 
               "THUNDERSTORMS", "THUNDERSTORMS WIND", "THUNDERSTORMS WINDS", 
               "THUNDERSTORMW", "THUNDERSTORMWINDS", "THUNDERSTROM WIND", 
               "THUNDERTORM WINDS", "THUNERSTORM WINDS", "Tstm Wind", 
               "TSTM WIND", "TSTM WIND  (G45)", "TSTM WIND (41)", 
               "TSTM WIND (G35)", "TSTM WIND (G40)", "TSTM WIND (G45)", 
               "TSTM WIND 40", "TSTM WIND 45", "TSTM WIND 55", 
               "TSTM WIND 65)", "TSTM WIND AND LIGHTNING", 
               "TSTM WIND DAMAGE", "TSTM WIND G45", "TSTM WIND G58", 
               "TSTM WIND/HAIL", "TSTM WINDS", "TSTMW", 
               "TUNDERSTORM WIND")] <- "Thunderstorm Wind"
    i[i %in% c("COLD AIR TORNADO", "TORNADO", "TORNADO F0", "TORNADO F1", 
               "TORNADO F2", "TORNADO F3", "TORNADOES", 
               "TORNADOES, TSTM WIND, HAIL", "TORNDAO", "Whirlwind", 
               "WHIRLWIND")] <- "Tornado"
    i[i %in% c("TROPICAL DEPRESSION")] <- "Tropical Depression"
    i[i %in% c("TROPICAL STORM", "TROPICAL STORM ALBERTO", 
               "TROPICAL STORM DEAN", "TROPICAL STORM GORDON", 
               "TROPICAL STORM JERRY")] <- "Tropical Storm"
    i[i %in% c("TSUNAMI")] <- "Tsunami"
    i[i %in% c("VOLCANIC ASH")] <- "Volcanic Ash"
    i[i %in% c("WATERSPOUT", "WATERSPOUT TORNADO", "WATERSPOUT-", 
               "WATERSPOUT-TORNADO", "WATERSPOUT/ TORNADO", 
               "WATERSPOUT/TORNADO")] <- "Waterspout"
    i[i %in% c("BRUSH FIRE", "FOREST FIRES", "GRASS FIRES", 
               "WILD FIRES", "WILD/FOREST FIRE", "WILD/FOREST FIRES", 
               "WILDFIRE", "WILDFIRES")] <- "Wildfire"
    i[i %in% c("WINTER STORM", "WINTER STORM HIGH WINDS", 
               "WINTER STORMS")] <- "Winter Storm"
    i[i %in% c("LATE SEASON SNOW", "Light snow", "Light Snow", 
               "LIGHT SNOW", "Light Snowfall", "RAIN/SNOW", 
               "RECORD SNOW", "Snow", "SNOW", "WINTER WEATHER", 
               "WINTER WEATHER MIX", "WINTER WEATHER/MIX", "Wintry Mix", 
               "WINTRY MIX")] <- "Winter Weather"
    i[i %in% c("?", "APACHE COUNTY", "Beach Erosion", "DOWNBURST", 
               "Erosion/Cstl Flood", "Glaze", "GLAZE", "HEAVY MIX", 
               "HEAVY SWELLS", "HIGH", "Marine Accident", "MARINE MISHAP", 
               "Microburst", "MICROBURST", "Other", "OTHER", "RAIN", 
               "RAIN/WIND", "RECORD RAINFALL", "RECORD SNOW", 
               "SEVERE TURBULENCE", "UNSEASONABLY WARM", "UNSEASONAL RAIN", 
               "URBAN AND SMALL", "URBAN SMALL", "WARM WEATHER", 
               "WET MICROBURST", "Wind", "WIND", "WIND AND WAVE", 
               "WINDS")] <- "Others"
    return(i)
}