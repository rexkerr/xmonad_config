import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO
 
main = do
    xmonad $ defaultConfig
        {
            manageHook = manageDocks <+> manageHook defaultConfig,
            layoutHook = avoidStruts  $  layoutHook defaultConfig,

            borderWidth        = 3,
            normalBorderColor  = "#000000",
            terminal           = "xterm",

            startupHook = do startup
        } `additionalKeysP` [ ("M-C-l", spawn "xdg-screensaver lock") ]


startup :: X ()
startup = do 
    spawn "xmodmap -e \"pointer = 3 2 1\"" -- configure left handed mouse
    spawn "xmobar"

-- vim : nowrap,et,ts=4,sw=4
