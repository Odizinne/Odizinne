import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQml.Models 2.15

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
            anchors.horizontalCenter: parent.horizontalCenter

            anchors.top: parent.top
            anchors.topMargin: 30
            height: 50
            horizontalAlignment: Text.AlignHCenter
        }

        TextField {
            id: searchField
            anchors {
                top: overviewLabel.bottom
                horizontalCenter: parent.horizontalCenter
                margins: 30
            }
            width: overviewLabel.width * 2
            placeholderText: "Filter projects..."
            font.pixelSize: 16
        }

        GridView {
            id: grid
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: searchField.bottom
            anchors.topMargin: 10

            height: Math.ceil(visibleModel.count / Math.floor(width / cellWidth)) * cellHeight

            interactive: false
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            cacheBuffer: Math.max(0, height * 2)

            property real cellSize: Math.floor(width / root.targetColumns)
            cellWidth: cellSize
            cellHeight: cellSize * 0.85

            model: ListModel {
                id: visibleModel

                Component.onCompleted: {
                    for (let i = 0; i < projectsModel.count; i++) {
                        visibleModel.append(projectsModel.get(i))
                    }
                }
            }

            Connections {
                target: searchField
                function onTextChanged() {
                    visibleModel.clear()
                    for (let i = 0; i < projectsModel.count; i++) {
                        let item = projectsModel.get(i)
                        if (item.title.toLowerCase().includes(searchField.text.toLowerCase())) {
                            visibleModel.append(item)
                        }
                    }
                }
            }

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
                    scale: 1
                    clip: true
                    border.width: 1
                    border.color: root.borderColor

                    Behavior on scale {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.OutQuad
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onEntered: {
                            cardRect.scale = 1.05
                        }
                        onExited: {
                            cardRect.scale = 1.0
                        }
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
