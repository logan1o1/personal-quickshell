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
            width: 13
            height: 13
            radius: 6 
            
            // Text {
            //   text: modelData.focused ? " " : " "
            //   font.family: "Hack Nerd Font"
            //   font.pixelSize: 14
            //   color: modelData.focused && "#2196F3" || "#11d6bf"
            // }  
            color: modelData.focused && "#2196F3" || "#11d6bf"
            
            MouseArea {
                anchors.fill: parent
                onClicked: modelData.activate()
            }
         }
      }
  }
}
