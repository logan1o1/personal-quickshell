import Quickshell
import QtQuick
import Quickshell.Io 

Rectangle {
  id: root
  color: "#CC000000"  
    
  radius: 8

  implicitWidth: players.implicitWidth + 20
  implicitHeight: players.implicitHeight + 10

  Text {
    id: players
    color: "white"
    anchors.centerIn: parent
    text: "Process"
  }
}
