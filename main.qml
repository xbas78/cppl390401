import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 500
    height: 300
    visible: true
    title: qsTr("Roll a ball")

    Rectangle {
        id: scene
        anchors.fill: parent
        state: "InitialState"

        Rectangle {
            id: leftRectangle
            x: 50
            y: 100
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 3

            Text {
                anchors.centerIn: parent
                text: "move"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    (ball.x >= rightRectangle.x) ? scene.state = "InitialState" : ball.x += 25
                    if(ball.x == leftRectangle.x + 35)
                        scene.state = "OtherState"
                }

            }
        }

        Rectangle {
            id: rightRectangle
            x: 350
            y: 100
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 3

            Text {
                anchors.centerIn: parent
                text: "return"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
        }

        Rectangle {
            id: ball
            color: "grey"
            x: leftRectangle.x + 10
            y: leftRectangle.y + 10
            width: leftRectangle.width - 20
            height: leftRectangle.height - 20
            radius: width / 2

        }

        states: [
            State {
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 10
                }
            },
            State {
                name: "OtherState"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            }
        ]

        transitions: [
            Transition {
                from: "OtherState"
                to: "InitialState"

                NumberAnimation {
                    properties: "x,y"
                    duration: 600
                    easing.type: Easing.InOutQuart
                }
            }
        ]
    }
}
