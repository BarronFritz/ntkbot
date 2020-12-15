#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include, NTK_Task.ahk
#include, NTK_Window.ahk

GetBot() {
    static bot := new NTK_Bot
    return bot
}

class NTK_Bot {
    __New() {
        this.windows := []
        this.running := False
    }
    ;this.windows := [] ; Active Windows
    ;this.running := True ; Main Loop can be controlled

    ; Start(ticks_per_second:=1)
    ;   Notes:
    ;       by default, this will start the bot ticking once per second.
    ;   Parameters:
    ;       ticks_per_second: how many times per second tasks are checked
    ;                         'default' is 1 tick per second
    ;   Return:
    ;       nothing
    Start(ticks_per_second:=1) { 
        ticks_per_second := Abs(ticks_per_second)
        ToolTip, NTK Bot Running, 0, 0

        this.running := True
        tick := 0 ; accumulator
        tick_time := 1000 / ticks_per_second
        start_time := A_TickCount

        while(this.running) {
            elapsed := A_TickCount - start_time
            start_time := A_TickCount
            tick := tick + elapsed
            ;MsgBox start_time: %start_time%`nelapsed: %elapsed%`ntick_time: %tick_time%`ntick: %tick%`n`nCtrl+Alt+K to stop

            while(tick > tick_time) {
                if (!this.paused) {
                    for i, window in this.windows {
                        window.DoTask(tick_time)
                    }
                }
                tick := tick - tick_time
            }
        }
        return
    }

    ; Pause()
    ;   Notes:
    ;       stops the bot at the begining of the next "tick"
    ;   Parameters:
    ;   Return:
    Pause() {
        this.paused := True
    }

    ; Resume()
    ;   Notes:
    ;       resumes from pause at the begining of the next "tick"
    ;   Parameters:
    ;   Return:
    Resume() {
        this.paused := False
    }

    ; Stop()
    ;   Notes:
    ;       stops the bot
    ;   Parameters:
    ;   Return:
    Stop() {
        this.running := False
        ToolTip,
    }

    AddTask( window, task ) {
        for i, win in this.windows {
            if (window.handle = win) {
                win.SetTask(task)
                return
            }
        }
        window.SetTask(task)
        this.windows.Push(window)
        return
    }
}

class BasicTask extends NTK_Task {
    OnTick(dt) {
        MsgBox BasicTask tick called with delta of %dt%
    }
}