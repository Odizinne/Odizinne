import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

ScrollView {
    id: welcomeView
    clip: true
    
    Item {
        width: parent.width
        height: parent.height

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20
            width: Math.min(parent.width - 80, 600)

            Label {
                Layout.fillWidth: true
                text: "Welcome to my Portfolio"
                font.pixelSize: 40
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                Layout.fillWidth: true
                text: "I'm a self learning Qt Desktop applications Developer focused on creating useful applications"
                font.pixelSize: 20
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                text: "View My Projects"
                onClicked: root.selectedTab = 1
                highlighted: true
            }
        }
    }
}
