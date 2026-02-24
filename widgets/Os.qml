import QtQuick

Rectangle {
  id: root

  color: "#CC000000"  
    
  radius: 8
    
    // Size based on content + padding
  implicitWidth: osIcon.implicitWidth + 20
  implicitHeight: osIcon.implicitHeight + 10

  Text {
    id: osIcon
    color: "white"
    anchors.centerIn: parent
    text: "" 
    font.family: "Hack Nerd Font"
    font.pixelSize: 13
  }
}
