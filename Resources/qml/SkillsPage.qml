import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

ScrollView {
    id: skillsView
    clip: true

    ScrollBar.vertical.policy: contentHeight > height ? ScrollBar.AlwaysOn : ScrollBar.AsNeeded
    contentWidth: availableWidth

    Item {
        width: parent.width
        implicitHeight: mainColumn.implicitHeight

        ColumnLayout {
            id: mainColumn
            anchors.horizontalCenter: parent.horizontalCenter
            width: root.height > root.width ? parent.width : Math.max(parent.width / 2, 600)
            spacing: 30

            Label {
                Layout.fillWidth: true
                text: "Skills & Technologies"
                font.pixelSize: 30
                font.bold: true
                Layout.topMargin: 30
                horizontalAlignment: Text.AlignHCenter
            }

            Repeater {
                model: root.skillsModel
                delegate: Rectangle {
                    property var categoryData: modelData
                    Layout.fillWidth: true
                    Layout.leftMargin: 40
                    Layout.rightMargin: 40
                    Layout.preferredHeight: skillsColumn.implicitHeight + 40
                    color: modelData.bgColor
                    radius: 6
                    border.width: 1
                    border.color: root.borderColor

                    ColumnLayout {
                        id: skillsColumn
                        anchors {
                            left: parent.left
                            right: parent.right
                            top: parent.top
                            margins: 20
                        }
                        spacing: 15

                        Label {
                            Layout.fillWidth: true
                            text: categoryData.category
                            font.bold: true
                            font.pixelSize: 22
                        }

                        Repeater {
                            model: categoryData.skills
                            delegate: ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 5

                                RowLayout {
                                    Layout.fillWidth: true
                                    Label {
                                        text: modelData.name
                                        font.pixelSize: 16
                                    }
                                    Label {
                                        text: Math.round(modelData.level * 100) + "%"
                                        opacity: 0.7
                                        font.pixelSize: 14
                                    }
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 6
                                    radius: height / 2
                                    color: root.borderColor

                                    Rectangle {
                                        width: parent.width * modelData.level
                                        height: parent.height
                                        radius: parent.radius
                                        color: categoryData.color

                                        Behavior on width {
                                            NumberAnimation {
                                                duration: 1000
                                                easing.type: Easing.OutQuad
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Item {
                Layout.preferredHeight: 0
            }
        }
    }
}
