import QtQuick

Rectangle {
  id: root
  anchors.centerIn: parent

  color: "#CC000000"  
    
  radius: 8
    
    // Size based on content + padding
  implicitWidth: timeText.implicitWidth + 20
  implicitHeight: timeText.implicitHeight + 10

  Text {
    id: timeText
    color: "white"
    anchors.centerIn: parent
    text: Qt.formatDateTime(new Date(), "h:mm AP, ddd MMM d")
    
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.text = Qt.formatDateTime(new Date(), "h:mm AP, ddd MMM d")
    }
  }
}
