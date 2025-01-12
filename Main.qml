import QtQuick
import QtQuick.Controls.FluentWinUI3
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

ApplicationWindow {
    id: root
    width: 1600
    height: 900
    visible: true
    title: qsTr("Flora's Portfolio")
    property int selectedTab: 0
    property int spacing: 40
    property int targetColumns: Math.floor(width / (1920/4))

    ListModel {
        id: projectsModel
        ListElement {
            title: "Retr0Mine"
            url: "https://github.com/Odizinne/Retr0Mine"
            image: "qrc:/retr0mine.png"
            description: "Retr0Mine is an attempt to create a modern looking minesweeper. It was designed with many QoL features to enhance gameplay."
        }
        ListElement {
            title: "QuickSoundSwitcher"
            url: "https://github.com/Odizinne/QuickSoundSwitcher"
            image: "qrc:/quicksoundswitcher.png"
            description: "A custom all in one audio panel for windows, aiming to look as native as possible."
        }
        ListElement {
            title: "HeadsetControl-Qt"
            url: "https://github.com/Odizinne/HeadsetControl-Qt"
            image: "qrc:/retr0mine.png"
            description: "HeadsetControl-Qt is a frontend for headsetcontrol by Sapd. It is running on both windows and linux"
        }
        ListElement {
            title: "Boxy"
            url: "https://github.com/Odizinne/Boxy"
            image: "qrc:/boxy.png"
            description: "A python discord music bot built on top of yt-dlp. Can be used with a user friendly GUI, or in nogui mode and controlled by discord commands."
        }
        ListElement {
            title: "BigPictureTV"
            url: "https://github.com/Odizinne/BigPictureTV"
            image: "qrc:/retr0mine.png"
            description: "A PC to console automation software relying on Steam big picture mode."
        }
        ListElement {
            title: "EnhancedDisplaySwitch"
            url: "https://github.com/Odizinne/EnhancedDisplaySwitch"
            image: "qrc:/enhanceddisplayswitch.png"
            description: "A frontend to original windows displayswitch.exe command, providing access to last used command. It was made for scripting purposes."
        }
    }

    Rectangle {
        id: topbar
        anchors.topMargin: 15
        anchors.bottomMargin: 30
        anchors.leftMargin: 30
        anchors.rightMargin: 30

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        radius: 12
        height: 80
        color: "#363636"


        RowLayout {
            id: topbarLayout
            spacing: 15
            anchors.fill: parent
            Label {
                id: ownerLabel
                text: "Odizinne"
                Layout.leftMargin: 20
                font.bold: true
                font.pixelSize: 18
            }

            Item {
                Layout.fillWidth: true
            }

            Button {
                flat: true
                highlighted: root.selectedTab === 0
                text: "Projects"
                onClicked: {
                    root.selectedTab = 0
                }
            }
            Button {
                flat: true
                highlighted: root.selectedTab === 1
                text: "Skills"
                onClicked: {
                    root.selectedTab = 1
                }
            }
            Button {
                flat: true
                highlighted: root.selectedTab === 2
                text: "About me"
                onClicked: {
                    root.selectedTab = 2
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Item {
                Layout.preferredWidth: ownerLabel.width
                Layout.rightMargin: 20
            }
        }
    }

    ScrollView {
        anchors.topMargin: 30
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.top: topbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true

        ScrollBar.vertical.policy: contentHeight > height ? ScrollBar.AlwaysOn : ScrollBar.AsNeeded
        contentWidth: availableWidth
        contentHeight: overviewLabel.height + grid.contentHeight

        Item {
            width: parent.width
            height: overviewLabel.height + grid.height

            Label {
                id: overviewLabel
                text: "Projects overview"
                font.pixelSize: 30
                font.bold: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                height: 40
                horizontalAlignment: Text.AlignHCenter
            }

            GridView {
                id: grid
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: overviewLabel.bottom
                height: contentHeight
                interactive: false  // Disable GridView scrolling
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                cellWidth: width / targetColumns
                cellHeight: cellWidth * 0.9

                model: projectsModel
                clip: true

                delegate: Item {
                    width: grid.cellWidth
                    height: grid.cellHeight

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: root.spacing / 2
                        color: "#363636"
                        radius: 12
                        clip: true

                        Image {
                            id: projImage
                            anchors {
                                top: parent.top
                                left: parent.left
                                right: parent.right
                                margins: 0
                            }
                            height: parent.height * 0.65
                            source: model.image
                            fillMode: Image.PreserveAspectCrop
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                id: opacityMaskInstance
                                maskSource: Rectangle {
                                    id: maskedRect
                                    width: projImage.width
                                    height: projImage.height
                                    radius: 0  // Set default radius to 0
                                    // Specify top corners only
                                    topLeftRadius: 12
                                    topRightRadius: 12
                                    bottomLeftRadius: 0
                                    bottomRightRadius: 0
                                }
                            }
                        }

                        Text {
                            id: projName
                            anchors {
                                top: projImage.bottom
                                left: parent.left
                                right: parent.right
                                margins: 15
                            }
                            text: model.title
                            color: "#ffffff"
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
                                margins: 15
                            }
                            text: model.description
                            color: "white"
                            wrapMode: Text.WordWrap
                            font.pixelSize: 16
                            verticalAlignment: Text.AlignVCenter
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                Qt.openUrlExternally(model.url)
                            }
                        }
                    }
                }
            }
        }
    }
}
