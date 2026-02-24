import QtQuick
import Quickshell.Hyprland


Rectangle {
  id: root

  color: "#CC000000"  
    
  radius: 8

  implicitWidth: row.implicitWidth + 20
  implicitHeight: row.implicitHeight + 10
    
  Row {
    id: row
    spacing: 6
    anchors.centerIn: parent
    
    Repeater {
        model: Hyprland.workspaces
        
        Rectangle {
            width: modelData.focused && 27 || 14
            height: 14
            radius: 7 
            
            color: modelData.focused && "#98cbff" || "#b9c8da"
            
            MouseArea {
                anchors.fill: parent
                onClicked: modelData.activate()
            }
         }
      }
  }
}
