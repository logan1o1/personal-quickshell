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
    anchors.leftMargin: 7
    spacing: 5

    Os {}
    Hyprland {}
  }
  Time {}
  Row {
    id: rightContainer
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    anchors.rightMargin: 7
    spacing: 5

    UtilityContainer {}
    MemoryCpuContainer {}
    Power {}
  }
}
