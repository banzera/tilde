import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO

import qualified Data.Map as M

--  colors match Ubuntu Human theme and Gnome panels
selected   = "'#fad184'"
background = "'#efebe7'"
foreground = "'#000000'"

-- height matches Ubuntu top Gnome panel
barHeight = "24"
 
--  font intended to match Ubuntu default application font
appFontXft = "'xft\
                \:Sans\
                \:pixelsize=14\
                \:weight=regular\
                \:width=semicondensed\
                \:dpi=96\
                \:hinting=true\
                \:hintstyle=hintslight\
                \:antialias=true\
                \:rgba=rgb\
                \:lcdfilter=lcdlight\
             \'"

-- currently dzen2 compiled locally to get xft support
-- (-e prevents loss of title if naive user clicks on dzen2)
myDzenTitleBar =
    "dzen2\
	    \ -ta l\
	    \ -x 370 -w 700 -y 0\
	    \ -e 'entertitle=uncollapse'\
	    \ -h  " ++ barHeight  ++ "\
	    \ -bg " ++ background ++ "\
	    \ -fg " ++ foreground ++ "\
	    \ -fn " ++ appFontXft

myManageHook = composeAll
	[ className =? "Do" 				--> doFloat
	, className =? "Update-manager"		--> doFloat
	, className =? "Google-chrome" 		--> doShift "3"
	, manageDocks
	]

main = do
	xmproc <- spawnPipe myDzenTitleBar
	
	xmonad $ gnomeConfig
		{
		  focusFollowsMouse			= False
		, focusedBorderColor		= "#ff3366"
		, normalBorderColor			= "#666666"
		, workspaces = ["1","2","3","4","5"]
		, manageHook				= myManageHook <+> manageHook defaultConfig
		, logHook					= myLogHookWithPP $ defaultPP
										{ ppOutput = hPutStrLn xmproc
										, ppOrder  = take 1 . drop 2
										}
		}
	where

myLogHookWithPP :: PP -> X()
myLogHookWithPP pp = do
	ewmhDesktopsLogHook
	dynamicLogWithPP pp
	
