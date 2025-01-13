import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

ScrollView {
    id: projectsView
    clip: true

    ScrollBar.vertical.policy: contentHeight > height ? ScrollBar.AlwaysOn : ScrollBar.AsNeeded

    Item {
        width: projectsView.width
        implicitHeight: grid.y + grid.height + 10

        Label {
            id: overviewLabel
            text: "Projects overview"
            font.pixelSize: 30
            font.bold: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 30
            height: 50
            horizontalAlignment: Text.AlignHCenter
        }

        GridView {
            id: grid
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: overviewLabel.bottom

            // Fixed height based on content
            height: Math.ceil(projectsModel.count / Math.floor(width / cellWidth)) * cellHeight

            interactive: false
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            cacheBuffer: height * 2

            property real cellSize: Math.floor(width / root.targetColumns)
            cellWidth: cellSize
            cellHeight: cellSize * 0.85

            model: projectsModel
            clip: true

            delegate: Item {
                id: delegateItem
                width: grid.cellWidth
                height: grid.cellHeight

                Rectangle {
                    id: cardRect
                    anchors.fill: parent
                    anchors.margins: root.spacing / 2
                    color: root.frameColor
                    radius: 6
                    clip: true
                    border.width: 1
                    border.color: root.borderColor

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: Qt.openUrlExternally(model.url)
                    }

                    Item {
                        id: contentContainer
                        anchors.fill: parent
                        anchors.margins: 15

                        Image {
                            id: projImage
                            anchors {
                                left: parent.left
                                right: parent.right
                                top: parent.top
                            }
                            height: parent.height / 4
                            source: root.Material.theme === Material.Dark ? model.darkImage : model.lightImage
                            fillMode: Image.PreserveAspectFit
                            asynchronous: true
                            cache: true
                        }

                        Text {
                            id: projName
                            anchors {
                                top: projImage.bottom
                                left: parent.left
                                right: parent.right
                                topMargin: 15
                            }
                            text: model.title
                            color: root.Material.accent
                            font.bold: true
                            font.pixelSize: 22
                            horizontalAlignment: Text.AlignHCenter
                        }

                        Text {
                            anchors {
                                top: projName.bottom
                                left: parent.left
                                right: parent.right
                                bottom: parent.bottom
                                topMargin: 15
                            }
                            text: model.description
                            color: Material.foreground
                            wrapMode: Text.WordWrap
                            font.pixelSize: 14
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }
}
