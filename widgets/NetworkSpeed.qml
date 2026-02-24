import Quickshell
import QtQuick
import "."
import Quickshell.Io

Rectangle {
    id: root
    color: "#CC000000"  
    radius: 8

    property real uploadSpeed: 0
    property real downloadSpeed: 0
    property real prevRxBytes: 0
    property real prevTxBytes: 0
    property real prevTime: 0

    implicitWidth: row.implicitWidth + 20
    implicitHeight: row.implicitHeight + 10

    Timer {
        running: true
        interval: 1000
        repeat: true
        triggeredOnStart: true
        onTriggered: netDevFile.reload()
    }

    FileView {
        id: netDevFile
        path: "/proc/net/dev"
        onLoaded: calculateNetworkSpeed(text())
    }

function calculateNetworkSpeed(text) {
    if (!text) return

    const currentTime = Date.now() / 1000
    const lines = text.split('\n')

    let rxBytes = 0
    let txBytes = 0
    
    for (var i = 2; i < lines.length; i++) {
        const line = lines[i].trim()
        if (line.startsWith('wlan0:')) {
            const statsLine = line.substring(line.indexOf(':') + 1).trim()
            const stats = statsLine.split(/\s+/)
            rxBytes = parseInt(stats[0], 10) || 0
            txBytes = parseInt(stats[8], 10) || 0
            break
        }
    }

    if (root.prevTime > 0) {
        const timeDiff = currentTime - root.prevTime
        if (timeDiff > 0) {
            let rxDiff = rxBytes - root.prevRxBytes
            let txDiff = txBytes - root.prevTxBytes
            
            if (rxDiff < 0) rxDiff = 0
            if (txDiff < 0) txDiff = 0

            root.downloadSpeed = (rxDiff / timeDiff / 1024)
            root.uploadSpeed = (txDiff / timeDiff / 1024)
        }
    }

    root.prevRxBytes = rxBytes
    root.prevTxBytes = txBytes
    root.prevTime = currentTime
}


    Row {
        id: row
        anchors.centerIn: parent
        spacing: 5


        Row {
          spacing: 2
        Text {
          id: downloadIcon
          color: "white"
          text: ""
          font.family: "Hack Nerd Font"
          font.pixelSize: 13
        }

        Text {
          id: download
          color: "white"
          text: `${root.downloadSpeed.toFixed(2)} KB/s` 
          font.family: "Hack Nerd Font"
          font.pixelSize: 13
        }
        }

        Row {
          spacing: 2
        Text {
          id: uploadIcon
          color: "white"
          text: ""
          font.family: "Hack Nerd Font"
          font.pixelSize: 13
        }

        Text {
          id: upload
          color: "white"
          text: `${root.uploadSpeed.toFixed(2)} KB/s` 
          font.family: "Hack Nerd Font"
          font.pixelSize: 13
        }
        }
    }
}
