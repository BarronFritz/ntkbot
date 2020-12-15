class NTK_Window {
    ; handle : active window ahk_id
    ; position ; x and y of the window
    ; size : width and height of the window
    __New() {
        this.handle := WinExist("A")
        this.current := this.GetPosition()
        this.last := this.current

        ;MsgBox, % "New NTK_Window ( " this.handle " ) created`n`nAt`n  x: " this.current.x "  y: " this.current.y "`n  w: " this.current.w "  h: " this.current.h
    }

    GetPosition() {
        handle := this.handle
        WinGetPos, X, Y, Width, Height, ahk_id %handle%

        rect := {}
        rect.x := X
        rect.y := Y
        rect.w := Width
        rect.h := Height

        return rect
    }

    Move(x, y, w:="", h:="") {
        handle := this.handle
        this.last := this.GetPosition()
        if (!w) {
            w := this.w
        }
        if (!h) {
            h := this.h
        }
        WinMove, ahk_id %handle%, , x, y, w, h

        this.current := this.GetPosition()
    }
    
    Reset() {
        if (this.last) {
            this.Move(this.last.x, this.last.y, this.last.w, this.last.h)
        }
    }

    SetTask(NTK_Task_Object) {
        this.task := NTK_Task_Object
        this.task.window := this
    }

    DoTask(delta) {
        if (this.task) {
            ; Update current window, and make sure task has updated window
            ; This may not be necessary if the variables are shared references
            this.current := this.GetPosition()
            this.task.window := this
            this.task.OnTick(delta)
        }
    }
}