import QtQuick
import Quickshell

Rectangle {
  id: root
  anchors.centerIn: parent
  color: "#CC000000"  

  radius: 8
    
  // Size based on content + padding
  implicitWidth: timeText.implicitWidth + 20
  implicitHeight: timeText.implicitHeight + 10

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  Text {
    id: timeText
    color: "white"
    anchors.centerIn: parent
    text: Qt.formatDateTime(clock.date , "h:mm AP, ddd MMM d")
  }
}
