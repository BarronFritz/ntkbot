; Search( left, top, right, bottom, file, quoted_options:="")
;   Notes:
;       Does a screen relative image search between the 
;   Parameters:
;       left
;       top
;       right
;       bottom
;       file
;       quoted_options
;   Return:
;       position_object:
;           return.x : found x position
;           return.y : found y position
; example use
; found := Search( left, top, right, bottom, file.png, "*2 *TransFFFF00")
; found.x ; x of the found position
; found.y ; x of the found position
Search(left, top, right, bottom, file, quoted_options:="") {
    CoordMode, Pixel, Screen
    MsgBox, % "ImageSearch`n found_x  found_y`n x1: " left "  y1: " top "`n x2: " right "  y2: " bottom "`n file: " quoted_options " " file
    ImageSearch, found_x, found_y, left, top, right, bottom, %quoted_options% %file%
    if (ErrorLevel=0) {
        ret := {x: found_x, y: found_y}
        MsgBox, % "found x: " found_x "  y: " found_y
        return ret
    }
    return False
}