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

        Image {
            id: themeImage
            source: Material.theme === Material.Dark ? "qrc:/icons/moon.png" : "qrc:/icons/sun.png"
            Layout.preferredHeight: themeSwitch.height - 10
            Layout.rightMargin: -15
            Layout.preferredWidth: height

            rotation: themeSwitch.checked ? 180 : 0
            Behavior on rotation {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.OutQuad
                }
            }

            opacity: 1
            Behavior on opacity {
                NumberAnimation {
                    duration: 150
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    themeSwitch.checked = !themeSwitch.checked
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