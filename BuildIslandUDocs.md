# Build Island ModKit Documentation

## Introduction

Welcome to the Build Island ModKit Unofficial Documentation! This documentation provides an overview of the modkit's functionalities and explains how to use it effectively to create your own custom content for the game.

## Table of Contents

1. [Overview](#overview)
2. [Mod Structure](#mod-structure)
3. [Mod Functionality](#mod-functionality)
4. [Getting Started](#getting-started)
5. [Examples](#examples)
6. [Notes](#notes)

## Overview

The Build Island ModKit allows you to create and customize new content for the game Build Island on Roblox. This modkit includes the following key components:

- `Gear`: Objects placed under the `Gear` Folder will be parented into the `Lighting` and made accessible through the `give` or `admin` commands during the game.
- `Items`: Objects placed under the `Items` Folder will be imported into the Stamper Tool upon loading the mod. Each `Item` must contain a `BasePart` or `Model` named `Model` and an `IntValue` named `AssetId`, which holds the AssetId of the uploaded `Items.Model`. Additionally, an `IntValue` named `SubtypeOfId` can be used to define a subtype relationship between different items.

## Mod Structure

Your mod should be created as a module script and must be named with a "#" prefix. For example, if your mod is named "mymod," the script file should be named "#mymod." The following structure is expected in your mod script:

```lua
local mymod = {
	description = "My first Build Island mod!";
	credit = "Toybox Development";
	v = 1;
}

function mymod.start(mods)
	-- Your mod initialization code goes here
end

-- Other functions and member variables can be defined here

return mymod
```

## Mod Functionality

The `start` function in your mod script is called when the mod is loaded. It receives a table called `mods` as a parameter, which contains all the loaded mods. You can access other mods' properties and interact with them within the `start` function.

Other functions and member variables can be defined in your mod script, but be cautious about using yielding code outside the `start` function, as it may cause issues during server loading.

## Getting Started

To create your own custom mod for Build Island, follow these steps:

1. Open your preferred code editor and create a new module script.
2. Name the script with a "#" prefix followed by your desired mod name (e.g., "#mymod").
3. Inside the script, define your mod's properties in a table format, including the description, credit, and version (v) number.
4. Implement the `start` function to initialize your mod and interact with other loaded mods if needed.
5. Add custom functionality, items, and gear under appropriate categories (`Items` or `Gear`).

## Examples

Here are some examples of how to use the Build Island ModKit:

### Example 1: Creating a Basic Item (Block)

```lua
-- #mymod

local mymod = {
	description = "My first Build Island mod!";
	credit = "Toybox Development";
	v = 1;
}

function mymod.start(mods)
	local item1 = Instance.new("Model")
	item1.Name = "MyFirstItem"
	item1.Parent = game.Workspace.Items

	local basePart = Instance.new("Part")
	basePart.Name = "Model"
	basePart.Parent = item1

	local assetId = Instance.new("IntValue")
	assetId.Name = "AssetId"
	assetId.Value = 1234567890 -- Replace with the actual AssetId of your item's Model
	assetId.Parent = item1
end

return mymod
```

### Example 2: Creating a Gear Object

```lua
-- #mymod

local mymod = {
	description = "My first Build Island mod!";
	credit = "Toybox Development";
	v = 1;
}

function mymod.start(mods)
	local gear = Instance.new("Part")
	gear.Name = "MyGear"
	gear.Parent = game.Lighting
end

return mymod
```

## Notes

- Avoid yielding code outside the `start` function to prevent server loading issues.
- Ensure that your `Items` and `Gear` objects are correctly defined and placed in the appropriate categories to function as intended.