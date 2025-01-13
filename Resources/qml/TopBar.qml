import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

Rectangle {
    id: topbar
    height: 60
    color: root.topbarColor

    property int selectedTab
    signal tabSelected(int tab)

    RowLayout {
        id: topbarLayout
        spacing: 15
        anchors.fill: parent

        Item {
            Layout.preferredWidth: themeSwitch.width
        }

        Item {
            Layout.fillWidth: true
        }

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

        Item {
            Layout.fillWidth: true
        }


        Item {
            Layout.preferredHeight: themeSwitch.height - 10
            Layout.preferredWidth: height
            Layout.rightMargin: -15

        Image {
            id: sunImage
            anchors.fill: parent
            source: "qrc:/icons/sun.png"
            opacity: !themeSwitch.checked ? 1 : 0  // Changed to use switch state directly
            rotation: themeSwitch.checked ? 360 : 0
            Behavior on rotation {
                NumberAnimation {
                    duration: 500
                    easing.type: Easing.OutQuad
                }
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 500
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    themeSwitch.checked = !themeSwitch.checked
                }
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
                NumberAnimation {
                    duration: 100
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    themeSwitch.checked = !themeSwitch.checked
                }
            }
        }
}
        Switch {
            id: themeSwitch
            Component.onCompleted: checked = (root.Material.theme === root.Material.Dark)
            onCheckedChanged: {
                if (checked) {
                    root.Material.theme = root.Material.Dark
                } else {
                    root.Material.theme = root.Material.Light
                }
            }
        }
    }
}

