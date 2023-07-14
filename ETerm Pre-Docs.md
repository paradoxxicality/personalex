# Eclipse Term (ETerm)
A custom terminal ui library for Roblox, by EclipseDev.

# Docs
The documentation of ETerm

## Loading ETerm
To load ETerm simply insert it into ReplicatedStorage or anywhere you like and require it.
```lua
local ETerm = require(game:GetService("ReplicatedStorage").ETerm)
```

## Creating a Window
The arguments for creating a window are in a list, here's an example:
```lua
local Window = ETerm:MakeWindow({
    Title = "Terminal",
    User = "eclipse",
    Machine = "terminal",
    Level = 1,
    IntroEnabled = true,
    IntroText = "My Terminal!",
    IntroIcon = "rbxassetid://10315937768",
    Resizeable = true,
    CloseButton = true
    MinimizeButton = false
    CloseCallback = function()
        print("Window Closed!")
    end,
    MinimizeCallback = function()
        print("Window Minimized!")
    end
})

--[[
    Argument Defaults, Types and Additional Documentation:
    Title = "ETerm" : <string> -- The title at the top of the window.
    User = LocalPlayer.Name : <string> -- The prefix/username in the terminal ex: 'prefix@suffix: $'
    Machine = "main" : <string> -- The suffix/machine name in the terminal ex: 'prefix@suffix: $'
    Level = 1 : <number> -- The current clearance level only in numbers 1-2, changes the $ into # ex: 'prefix@suffix: #'
    IntroEnabled = true : <boolean> -- Toggle the intro which appears on init.
    IntroText = "ETerm Library" : <string> -- Change the text shown in intro.
    IntroIcon = "rbxassetid://7743870134" : <string> -- Change the icon shown in intro.
    Resizeable = true : <boolean> -- Toggle resizing of the window.
    CloseButton = true : <boolean> -- Enables the close button.
    MinimizeButton = true : <boolean> -- Enables the Minimize button.
    CloseCallback = (No Default) : <function> -- Function which is called when the window is closed.
    MinimizeCallback = (No Default) : <function> -- Function which is called when the window is minimized.
]]
```
## Window Functions & Properties
These functions are used to print, warn, etc. in the terminal.
```lua
Window.print("Hello, world!") -- Basically just print()
Window.warn("Oh noes!") -- Basically just warn()
Window.error("BIG OH NOES!!!") -- Basically just error() except it doesnt error the script.
Window.input("Insert your password: ") -- Allows you to recieve an input. The argument is the suffix of the input.
--[[
    All of the functions above use a custom syntax for changing text color and bold, italic etc.

    To change the color of the text after a certain point, use hex surrounded by '&', ex:
    Window.print("&FF0000&Hi!") -- outputs A red 'Hi'.

    To reset text back to normal color, use &r&, ex:
    Window.print("&0000FF&Hello!&r&, world!") -- outputs a green 'Hello' and a normal ', World!'.

    To change the BACKGROUND color of the text after a certain point, use hex surrounded by '#', ex:
    Window.print("#FF0000#Hi!") -- outputs 'Hi!' with a red background

    To reset text back to normal BACKGROUND color, use #r#, ex:
    Window.print("#0000FF#Hello!#r#, world!") -- outputs a 'Hello' with a green background
    and a ', World!' with a normal background.
]]

Window.Close() -- Closes the window.
Window.Minimize() -- Minimizes the window.

Window.Title = "Eclipse's Terminal" -- Allows you to change the window title.
Window.Resizeable = false -- Allows you to change if the window is resizeable.
Window.Minimizeable = false -- Allows you to change if the window is minimizeable.
Window.Closeable = false -- Allows you to change if the window is closeable.
```

## Creating Commands
The arguments for creating a command are in a list, here's an example:
```lua
local Command = ETerm:NewCommand({
    Name = "hello",
    Callback = function(args)
        if args[1] == "1"
            Window.print("Hello, world!")
        else
            Window.print("1st Argument not provided or isn't 1.")
        end
    end
})

--[[
    Argument Defaults, Types and Additional Documentation:
    Name = (No Default) : <string> -- The name of the command, must only use lowercase, alphanumeric characters.
    Callback = (No Default) : <function> -- Function which is called when the command is called.
    The arguments are strings in an array ex: {"arg1", "arg2"}
]]
```

## Initializing the UI (REQUIRED)
For the UI to be actually created you need to intialize the window!
```lua
Window:Init()
```