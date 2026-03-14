import Quickshell
import QtQuick
import Quickshell.Io

Rectangle {
    id: root
    color: "#CC000000"  
    radius: 8

    property real memPercent: 0
    property real cpuPercent: 0

    implicitWidth: row.implicitWidth + 20
    implicitHeight: row.implicitHeight + 10

    Timer {
        running: true
        interval: 2000
        repeat: true
        triggeredOnStart: true
        onTriggered: metricsProcess.running = true
    }

    Process {
        id: metricsProcess
        command: ["dgop", "all", "--json"]
        stdout: SplitParser {
            onRead: data => {
                const json = JSON.parse(data)
                root.memPercent = json.memory.usedPercent
                root.cpuPercent = json.cpu.usage
            }
        }
        onExited: (code, status) => running = false
    }

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 5

        Text {
          id: memory
          color: "white"
          text: `  ${root.memPercent.toFixed(0)}%` 
          font.family: "Hack Nerd Font"
          font.pixelSize: 13
        }

        // Text {
        //   id: separator
        //   color: "white"
        //   text: "|"
        //   font.family: "Hack Nerd Font"
        //   font.pixelSize: 13
        // }
        //
        // Text {
        //   id: cpu
        //   color: "white"
        //   text: `󰍛 ${root.cpuPercent.toFixed(0)}%` 
        //   font.family: "Hack Nerd Font"
        //   font.pixelSize: 13
        // }
    }
}
