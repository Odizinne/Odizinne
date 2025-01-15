import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

ScrollView {
    id: aboutView
    clip: true
    contentWidth: availableWidth
    ScrollBar.vertical.policy: {
        if (!root.isMobile && contentHeight > height) return ScrollBar.AlwaysOn
        else return ScrollBar.AsNeeded
    }

    Item {
        width: parent.width
        implicitHeight: aboutColumn.implicitHeight + 60

        ColumnLayout {
            id: aboutColumn
            anchors.centerIn: parent
            width: Math.min(parent.width - 80, 800)
            spacing: 20

            Label {
                Layout.fillWidth: true
                text: "Hello, I'm Flora"
                Layout.bottomMargin: 10
                font.pixelSize: 30 * root.fontScale
                font.bold: true
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: introText.implicitHeight + 40
                color: root.frameColor
                radius: 6
                border.width: 1
                border.color: root.borderColor

                Label {
                    id: introText
                    anchors.fill: parent
                    anchors.margins: 20
                    text: "I'm a self-taught programmer with a passion for clean, logical solutions. Originally from France, I enjoy exploring technology and creating intuitive user interfaces."
                    wrapMode: Text.WordWrap
                    font.pixelSize: 16 * root.fontScale
                }
            }

            Flow {
                Layout.fillWidth: true
                spacing: 15

                Repeater {
                    model: [
                        {
                            title: "Programming Journey",
                            content: "My journey began with learning programming basics, where I discovered my love for logic. If something is supposed to work, it should work - this principle drives my approach to coding.",
                            color: "#73d216",
                            backgroundColor: root.bgGreen
                        },
                        {
                            title: "Technologies",
                            content: "I work primarily with Qt/QML, focusing on creating clean, user-friendly interfaces. While Windows is my daily driver, I ensure my projects work across different platforms when possible.",
                            color: "#fcaf3e",
                            backgroundColor: root.bgOrange
                        },
                        {
                            title: "Languages",
                            content: "Native French speaker with a good understanding of written English. I enjoy the challenge of communicating across language barriers in the tech community.",
                            color: "#ad7fa8",
                            backgroundColor: root.bgPurple
                        },
                        {
                            title: "Approach",
                            content: "I believe in following established conventions and creating intuitive user experiences. Documentation and AI tools are valuable allies in my learning process.",
                            color: "#ef2929",
                            backgroundColor: root.bgRed
                        }
                    ]

                    delegate: Rectangle {
                        width: aboutColumn.width > 600 ? (aboutColumn.width - 15) / 2 : aboutColumn.width
                        height: aboutColumn.width > 600 ? 200 : cardColumn.implicitHeight + 40
                        color: modelData.backgroundColor
                        radius: 6
                        border.width: 1
                        border.color: root.borderColor

                        Rectangle {
                            width: 4
                            height: parent.height - 14
                            color: modelData.color
                            radius: 2
                            anchors {
                                left: parent.left
                                leftMargin: 10
                                verticalCenter: parent.verticalCenter
                            }
                        }

                        ColumnLayout {
                            id: cardColumn
                            anchors.fill: parent
                            anchors.leftMargin: 25
                            anchors.rightMargin: 20
                            anchors.topMargin: 20
                            anchors.bottomMargin: 20
                            spacing: 10

                            Label {
                                text: modelData.title
                                font.bold: true
                                font.pixelSize: 18 * root.fontScale
                            }

                            Label {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                text: modelData.content
                                wrapMode: Text.WordWrap
                                font.pixelSize: 14 * root.fontScale
                            }
                        }
                    }
                }
            }
        }
    }
}
