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
class NTK_Fishing extends NTK_Task {
    OnInit() {
        this.search_images := []

        ;test_fish := {file: "NTK.png", x: 124, y: 172, w: 37, h: 18, onFound: this.NTK_Test_Fish_Found }
        test_fish := {file: "ntk_bot\NTK.png", x: 124, y: 172, w: 0, h: 0, onFound: this.NTK_Test_Fish_Found }
        this.search_images.Push( test_fish )

        fish1 := {file:"ntk_bot\fish1.png", x: 657, y: 694, w: 233, h: 131, onFound: this.Found_Fish_1 }
        this.search_images.Push( fish1 )

        fish2 := {file:"ntk_bot\fish2.png", x: 657, y: 649, w: 890, h: 825, onFound: this.Found_Fish_2 }
        this.search_images.Push( fish2 )

        fish3 := {file:"fish3.png", x: 837, y: 713, w: 943, h: 755, onFound: this.Found_Fish_3 }
        this.search_images.Push( fish3 )

        fish4 := {file:"fish4.png", x: 635, y: 655, w: 747, h: 771, onFound: this.Found_Fish_4 }
        this.search_images.Push( fish4 )
    }

    OnTick(dt) {
        for each, fish in this.search_images {
            name := fish.file
            x1 := this.window.current.x + fish.x ; window relative search position
            y1 := this.window.current.y + fish.y ; window relative search position
            x2 := x1 + fish.w ; From x, add image width
            y2 := y1 + fish.h ; From y, add image height


            found := Search(x1, y1, x2, y2, fish.file, "*2 *TransFFFF00")
            if (found) {
                MsgBox found fish
                fish.onFound(found)
                return ; if any image is found, stop further searches, return
            }
        }
        return
    }

    OnEnd() {
    }

    NTK_Test_Fish_Found(found_position) {
        foundX := found_position.x
        foundY := found_position.y
        MsgBox found NTK.png at %foundX%  %foundY%
        return
    }

    Found_Fish_1(found_position) {
        foundX := found_position.x
        foundY := found_position.y
        MsgBox found fish1.png at %foundX%  %foundY%

        wndh := window.handle
        ControlSend,,{Enter}, ahk_id %wndh%
        return
    }

    Found_Fish_2(found_position) {
        foundX := found_position.x
        foundY := found_position.y
        MsgBox found fish2.png at %foundX%  %foundY%

        wndh := window.handle
        ControlSend,,{Down}, ahk_id %wndh%
        send, 50
        ControlSend,,{Enter}, ahk_id %wndh%
        return
    }

    Found_Fish_3(found_position) {
        foundX := found_position.x
        foundY := found_position.y
        MsgBox found fish3.png at %foundX%  %foundY%

        wndh := window.handle
        ControlSend,,{Enter}, ahk_id %wndh%
        return
    }

    Found_Fish_4(found_position) {
        foundX := found_position.x
        foundY := found_position.y
        MsgBox found fish4.png at %foundX%  %foundY%

        wndh := window.handle
        ControlSend,,{Escape}, ahk_id %wndh%
        sleep, 100
        ControlSend,,{Enter}, ahk_id %wndh%
        sleep, 50
        ControlSend,,fish, ahk_id %wndh%
        sleep, 50
        ControlSend,,{Enter}, ahk_id %wndh%
        sleep, 50
        return
    }
}
