; Search function
#Include, NTK_Core.ahk
#Include, NTK_Task.ahk

; NTK_Task : class Object
;   Notes:
;       extend from this to create different user made tasks
;   Methods:
;       OnInit() : if implemented, this is called when the inherited class is created
;       OnTick(delta_time) : if implemented, this is called when the inherited class is updated
;       OnEnd() : if implemented, this is called when the inherited class is destroyed
class NTK_Mining extends NTK_Task {
    OnInit() {
        ; find character position
        ; round position to cell position
    }

    OnTick(delta_time) {
        ; If i have a full inventory,
        ; deposit()
        ; else
        ; mine()
    }

    OnEnd() {

    }

    Deposit() {
        ; This is all key presses, and chat interactions.
        ; Not much needs to be done here

        ; go back to inn,
        ; deposit all minned ore
        ; teleport back to beacon character
    }

    Mine() {
        ; find all ore
        ;   Search window for nodes and return a list of all node CENTER positions
        ; find ore closest to characters last known position
        ;   Loop through node positions, and determine which point is closest to character
        ; click on closest ore
        ;   controlClick on the closest point
        ; wait till character moves to the position
        ;   set a timer/countdown of how long it's estimated to take
        ;   to get to the desired position from current location
        ; set a delay to continue attacking until the node is gone (37sec?)
        ;   continue attacking until the timer is depleted
    }
}