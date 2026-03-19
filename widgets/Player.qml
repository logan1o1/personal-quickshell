import Quickshell
import QtQuick
import Quickshell.Services.Mpris 

Rectangle {
  id: root
  color: "#CC000000"  
    
  property var currentPlayer: null
  property string trackTitle: ""
  property string trackArtist: ""
  property bool hasPlayer: false

  Connections {
    target: Mpris.players
    function onValuesChanged() {
      updatePlayer()
    }
  }

  function updatePlayer() {
    var players = Mpris.players.values
    if (players && players.length > 0) {
      root.currentPlayer = players[0]
      root.trackTitle = root.currentPlayer.trackTitle
      root.trackArtist = root.currentPlayer.trackArtist
      root.hasPlayer = true
    } else {
      root.hasPlayer = false
    }
  }

  Component.onCompleted: {
    updatePlayer()
  }

  radius: 8

  implicitWidth: players.implicitWidth + 45
  implicitHeight: players.implicitHeight + 8

  Row {
      id: row
      anchors.centerIn: parent
      spacing: 5

      Text {
        id: players
        color: "white"
        text: root.hasPlayer && `${root.trackTitle} - ${root.trackArtist}`
      }

      Item {
        width: 5
        height: 10
        MouseArea {
          anchors.fill: backward
          onClicked: root.currentPlayer?.previous()
          cursorShape: Qt.PointingHandCursor
        }
        Text {
          id: backward
          color: "white"
          text: ""
          font.pixelSize: 13
        }
      }

      Item {
        width: 5
        height: 10
        MouseArea {
          anchors.fill: pausePlay
          onClicked: root.currentPlayer?.isPlaying ? root.currentPlayer.pause() : root.currentPlayer.play()
          cursorShape: Qt.PointingHandCursor
        }
        Text {
          id: pausePlay
          color: "white"
          text: root.currentPlayer?.isPlaying ? "" : ""
          font.pixelSize: 13
        }
      }

      Item {
        width: 5
        height: 10
        MouseArea {
          anchors.fill: forward
          onClicked: root.currentPlayer?.next()
          cursorShape: Qt.PointingHandCursor
        }
        Text {
          id: forward
          color: "white"
          text: ""
          font.pixelSize: 13
        }
      }
  }
}
