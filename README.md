# Description
* **Crabbing script for QBCore**

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [Project Sloth ps-ui](https://github.com/Project-Sloth/ps-ui)
* [PolyZone](https://github.com/mkafrin/PolyZone)

# Installation
* **Install all the dependencies**
* **Add the items to your qb-core > shared > items.lua**
* **Create a new shop in qb-shops with the snippet below (optional)**

## Items for qb-core > shared > items.lua
```lua
-- crabbing
['crabbingrod'] 					 = {['name'] = 'crabbingrod', 					['label'] = 'Crabing Rod', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'crabbingrod.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,		['combinable'] = nil,   ['description'] = 'With this I can catch the crab..'},
['crabbingbait'] 				 = {['name'] = 'crabbingbait', 					['label'] = 'Crabbing Bait', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'crabbingbait.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'With this I can lure the Crabbies..'},
['bluecrab'] 			 		 = {['name'] = 'bluecrab', 						['label'] = 'bluecrab', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bluecrab.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['coconutcrab'] 						 = {['name'] = 'coconutcrab', 							['label'] = 'coconutcrab', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'coconutcrab.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Crab'},
['hermitcrab'] 						 = {['name'] = 'hermitcrab', 						['label'] = 'hermitcrab', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'hermitcrab.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Crab'},
['heikegani'] 					 = {['name'] = 'heikegani', 						['label'] = 'heikegani', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'heikegani.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'heikgani'},
['horsehaircrab'] 				 = {['name'] = 'horsehaircrab', 				['label'] = 'horsehaircrab', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'horsehaircrab.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'horsehair Crab'},
['horseshoecrab'] 					 = {['name'] = 'horseshoecrab', 						['label'] = 'horseshoe crab', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'horseshoecrab.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['kingcrab'] 						 = {['name'] = 'kingcrab', 						['label'] = 'kingcrab', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'kingcrab.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'king crab'},
['lobster2'] 					 = {['name'] = 'lobster2', 						['label'] = 'lobster2', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lobster2.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'lobster2'},
['peacrab'] 				 = {['name'] = 'peacrab', 					['label'] = 'peacrab', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'peacrab.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'pea crab'},
['rockcrab'] 			 			 = {['name'] = 'rockcrab', 						['label'] = 'rockcrab', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'rockcrab.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'rock crab'},
['lobster'] 						 = {['name'] = 'lobster', 						['label'] = 'lobster', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lobster.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'lobster'},
```
## qb-logs (smallresources)
```lua
['crabbing'] = {'webhook'},
```

## qb-shops (config)
```lua
-- My crabbing Shop
["crabbing"] = {
    ["label"] = "The Crab Shop",
    ["coords"] = vector4(-1597.9, 5201.15, 4.39, 69.79),
    ["ped"] = 's_m_m_migrant_01',
    ["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
    ["radius"] = 1.5,
    ["targetIcon"] = "fas fa-fish-fins",
    ["targetLabel"] = "Open crabbing Store",
    ["products"] = Config.Products["crabbing"],
    ["showblip"] = true,
    ["blipsprite"] = 68,
    ["blipscale"] = 0.8,
    ["blipcolor"] = 38
},

-- Config.Products:
["crabbing"] = {
    [1] = {
        name = 'crabbingrod',
        price = 100,
        amount = 100,
        info = {},
        type = 'item',
        slot = 1,
    },
    [2] = {
        name = 'crabbingbait',
        price = 1,
        amount = 5000,
        info = {},
        type = 'item',
        slot = 2,
    }
},
```

# Credits
Made by JLeeGaming
 Alongside Lionh34rt#4305 tutorial

Discord: https://discord.gg/rExc97jFFY

