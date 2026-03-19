import Quickshell
import QtQuick
import Quickshell.Io

Rectangle {
    id: root
    color: "#CC000000"  
    radius: 8

    property real memPercent: 0
    property real cpuPercent: 0
    property real cpuTemp: 0
    // property real swapMemTotal: 0
    // property real swapMemFree: 0
    // property real swapMemPercent: 0

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
                const systemInfo = JSON.parse(data)
                root.memPercent = systemInfo.memory.usedPercent
                root.cpuPercent = systemInfo.cpu.usage
                root.cpuTemp = systemInfo.cpu.temperature
                // root.swapMemTotal = systemInfo.memory.swaptotal
                // root.swapMemFree = systemInfo.memory.swapfre
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
        //   id: separator0
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

        Text {
          id: separator1
          color: "white"
          text: "|"
          font.family: "Hack Nerd Font"
          font.pixelSize: 13
        }

        Text {
          id: cpuTemp
          color: "white"
          text: `󰈸 ${root.cpuTemp}` 
          font.family: "Hack Nerd Font"
          font.pixelSize: 13
        }
    }
}
