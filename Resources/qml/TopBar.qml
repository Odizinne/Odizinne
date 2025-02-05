import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: topbarContainer
    height: 60
    property int selectedTab
    signal tabSelected(int tab)

    Rectangle {
        id: topbar
        anchors.fill: parent
        color: root.topbarColor

        RowLayout {
            anchors.fill: parent
            spacing: 10

            Button {
                id: menuButton
                visible: root.isMobile
                flat: true
                Layout.leftMargin: 10

                contentItem: Rectangle {
                    width: 24
                    height: 24
                    color: "transparent"

                    Column {
                        spacing: 4
                        anchors.centerIn: parent

                        Repeater {
                            model: 3
                            Rectangle {
                                width: 18
                                height: 2
                                radius: 1
                                color: Material.foreground
                            }
                        }
                    }
                }

                onClicked: drawer.open()
            }

            Label {
                visible: root.isMobile
                text: {
                    if (root.selectedTab === 0) return "Welcome"
                    if (root.selectedTab === 1) return "Projects"
                    if (root.selectedTab === 2) return "Skills"
                    if (root.selectedTab === 3) return "About me"
                }
                font.bold: true
                font.pixelSize: 18
                Layout.alignment: Qt.AlignCenter
            }

            RowLayout {
                id: desktopMenu
                visible: !root.isMobile
                spacing: 15
                Layout.fillWidth: true

                Item { Layout.fillWidth: true }

                Button {
                    flat: true
                    highlighted: selectedTab === 0
                    text: "Welcome"
                    onClicked: tabSelected(0)
                }

                Button {
                    flat: true
                    highlighted: selectedTab === 1
                    text: "Projects"
                    onClicked: tabSelected(1)
                }

                Button {
                    flat: true
                    highlighted: selectedTab === 2
                    text: "Skills"
                    onClicked: tabSelected(2)
                }

                Button {
                    flat: true
                    highlighted: selectedTab === 3
                    text: "About me"
                    onClicked: tabSelected(3)
                }

                ToolSeparator {}

                Button {
                    id: githubButton
                    flat: true
                    text: "Github"
                    onClicked: Qt.openUrlExternally("https://github.com/odizinne")
                }

                Button {
                    flat: true
                    text: "KoFi"
                    width: githubButton.width
                    onClicked: Qt.openUrlExternally("https://ko-fi.com/odizinne")
                }

                Item { Layout.fillWidth: true }
            }

            Item {
                Layout.fillWidth: root.isMobile
                visible: root.isMobile
            }

            Item {
                Layout.preferredHeight: themeSwitch.height - 10
                Layout.preferredWidth: height
                Layout.rightMargin: -15

                Image {
                    id: sunImage
                    anchors.fill: parent
                    source: "qrc:/icons/sun.png"
                    opacity: !themeSwitch.checked ? 1 : 0
                    rotation: themeSwitch.checked ? 360 : 0

                    Behavior on rotation {
                        NumberAnimation {
                            duration: 500
                            easing.type: Easing.OutQuad
                        }
                    }

                    Behavior on opacity {
                        NumberAnimation { duration: 500 }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: themeSwitch.checked = !themeSwitch.checked
                    }
                }

                Image {
                    anchors.fill: parent
                    id: moonImage
                    source: "qrc:/icons/moon.png"
                    opacity: themeSwitch.checked ? 1 : 0
                    rotation: themeSwitch.checked ? 360 : 0

                    Behavior on rotation {
                        NumberAnimation {
                            duration: 500
                            easing.type: Easing.OutQuad
                        }
                    }

                    Behavior on opacity {
                        NumberAnimation { duration: 100 }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: themeSwitch.checked = !themeSwitch.checked
                    }
                }
            }

            Switch {
                id: themeSwitch
                Component.onCompleted: checked = (root.Material.theme === root.Material.Dark)
                onCheckedChanged: {
                    root.Material.theme = checked ? Material.Dark : Material.Light
                }
                Layout.rightMargin: 10
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(parent.width * 0.7, 300)
        height: parent.parent.height
        edge: Qt.LeftEdge
        modal: true

        property bool shouldBeVisible: root.isMobile
        onShouldBeVisibleChanged: {
            if (!shouldBeVisible) {
                close()
            }
        }

        background: Rectangle {
            color: root.frameColor
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            // Header
            Rectangle {
                Layout.margins: 20
                Layout.fillWidth: true
                height: topbar.height
                color: root.topbarColor

                Label {
                    anchors.centerIn: parent
                    text: "Menu"
                    font.pixelSize: 18
                    font.bold: true
                }
            }

            // Menu Items
            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: 20
                spacing: 5

                Button {
                    Layout.fillWidth: true
                    flat: true
                    highlighted: selectedTab === 0
                    text: "Welcome"
                    onClicked: {
                        tabSelected(0)
                        drawer.close()
                    }
                }

                Button {
                    Layout.fillWidth: true
                    flat: true
                    highlighted: selectedTab === 1
                    text: "Projects"
                    onClicked: {
                        tabSelected(1)
                        drawer.close()
                    }
                }

                Button {
                    Layout.fillWidth: true
                    flat: true
                    highlighted: selectedTab === 2
                    text: "Skills"
                    onClicked: {
                        tabSelected(2)
                        drawer.close()
                    }
                }

                Button {
                    Layout.fillWidth: true
                    flat: true
                    highlighted: selectedTab === 3
                    text: "About me"
                    onClicked: {
                        tabSelected(3)
                        drawer.close()
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    color: root.borderColor
                }

                Button {
                    Layout.fillWidth: true
                    flat: true
                    text: "Github"
                    onClicked: {
                        Qt.openUrlExternally("https://github.com/odizinne")
                        drawer.close()
                    }
                }

                Button {
                    Layout.fillWidth: true
                    flat: true
                    text: "KoFi"
                    onClicked: {
                        Qt.openUrlExternally("https://ko-fi.com/odizinne")
                        drawer.close()
                    }
                }
            }

            Item { Layout.fillHeight: true }
        }
    }
}
