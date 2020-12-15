#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include, ntk_bot
#Include, NTK_Include.ahk

global bot := GetBot()
^!s::
{
    window := new NTK_Window
    task := new NTK_Fishing
    bot.AddTask(window, task)

    bot.start(1)
    sleep, 10000
    bot.stop()
}

^!p::
{
    bot.pause()
}

^!r::
{
    bot.resume()
}