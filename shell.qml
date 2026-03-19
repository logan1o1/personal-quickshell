import Quickshell
import QtQuick
import "widgets"

PanelWindow {
  color: "transparent"
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30

  Row {
    id: leftContainer
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    anchors.leftMargin: 3
    spacing: 5

    Os {}
    Hyprland {}
    MemoryCpuContainer {}
    Player {}
  }
  Time {}
  Row {
    id: rightContainer
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    anchors.rightMargin: 3
    spacing: 5

    NetworkSpeed {}
    UtilityContainer {}
    Power {}
  }
}
