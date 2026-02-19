import Quickshell
import QtQuick
import Quickshell.Io
import "."


Rectangle {
    id: root
    color: "#CC000000"  
    radius: 8


    implicitWidth: row.implicitWidth + 20
    implicitHeight: row.implicitHeight + 10

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 12

        Volume {}
        BlueTooth {}
        Wifi {}
        Brightness {}
    }
}
