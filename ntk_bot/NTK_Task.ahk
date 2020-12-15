; NTK_Task : class Object
;   Notes:
;       extend from this to create different user made tasks
;   Methods:
;       OnInit() : if implemented, this is called when the inherited class is created
;       OnTick(delta_time) : if implemented, this is called when the inherited class is updated
;       OnEnd() : if implemented, this is called when the inherited class is destroyed
class NTK_Task {
    __New() {
        base.__New()
        this.OnInit()
    }

    OnInit() {
        ;MsgBox NTK_Task::OnActivate() was not implemented
    }

    OnTick(dt) {
        ;MsgBox NTK_Task::OnTick(dt) was not implemented
    }

    __Delete() {
        this.OnEnd()
        base.__Delete()
    }

    Kill() {
        this := ""
    }

    OnEnd() {
        ;MsgBox NTK_Task::OnEnd() was not implemented
    }

}