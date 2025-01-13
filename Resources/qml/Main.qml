import QtQuick
import QtQuick.Controls.Material
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
    property int targetColumns: Math.floor(width / (1920/5))
    property int animationDuration: 400
    Material.theme: Material.Light
    Material.accent: Material.Red

    property string frameColor: Material.theme === Material.Dark ? "#262626" : "#ececec"
    property string topbarColor: Material.theme === Material.Dark ? "#313131" : "#e8e8e8"
    property string borderColor: Material.theme === Material.Dark ? Qt.rgba(1, 1, 1, 0.10) : Qt.rgba(0, 0, 0, 0.10)
    property string bgColor: Material.theme === Material.Dark ? "#121212" : "#f5f5f5"

    property string bgAccent: Material.theme === Material.Dark ?
        Qt.rgba(Material.color(Material.Red, Material.Shade200).r,
                Material.color(Material.Red, Material.Shade200).g,
                Material.color(Material.Red, Material.Shade200).b,
                0.3) : Material.color(Material.Red, Material.ShadeA100)

    property string bgGreen: Material.theme === Material.Dark ?
        Qt.rgba(Material.color(Material.LightGreen, Material.Shade200).r,
                Material.color(Material.LightGreen, Material.Shade200).g,
                Material.color(Material.LightGreen, Material.Shade200).b,
                0.3) : Material.color(Material.LightGreen, Material.Shade50)

    property string bgOrange: Material.theme === Material.Dark ?
        Qt.rgba(Material.color(Material.Orange, Material.Shade200).r,
                Material.color(Material.Orange, Material.Shade200).g,
                Material.color(Material.Orange, Material.Shade200).b,
                0.3) : Material.color(Material.Orange, Material.Shade50)

    property string bgPurple: Material.theme === Material.Dark ?
        Qt.rgba(Material.color(Material.Purple, Material.Shade200).r,
                Material.color(Material.Purple, Material.Shade200).g,
                Material.color(Material.Purple, Material.Shade200).b,
                0.3) : Material.color(Material.Purple, Material.Shade50)

    property string bgRed: Material.theme === Material.Dark ?
        Qt.rgba(Material.color(Material.Red, Material.Shade200).r,
                Material.color(Material.Red, Material.Shade200).g,
                Material.color(Material.Red, Material.Shade200).b,
                0.3) : Material.color(Material.Red, Material.Shade50)

    property string bgGrey: Material.theme === Material.Dark ?
        Qt.rgba(Material.color(Material.Grey, Material.Shade200).r,
                Material.color(Material.Grey, Material.Shade200).g,
                Material.color(Material.Grey, Material.Shade200).b,
                0.3) : Material.color(Material.Grey, Material.Shade50)

    color: root.bgColor

    ListModel {
        id: projectsModel
        ListElement {
            title: "Retr0Mine"
            url: "https://github.com/Odizinne/Retr0Mine"
            description: "Retr0Mine is an attempt to create a modern looking minesweeper for a friend. It was designed with many QoL features to enhance gameplay. Runs on windows and linux."
        }
        ListElement {
            title: "QuickSoundSwitcher"
            url: "https://github.com/Odizinne/QuickSoundSwitcher"
            description: "A custom all in one audio panel for windows featuring input and output device switch as well as a volume mixer. Made with close to native Ui for Windows 10 and 11."
        }
        ListElement {
            title: "HeadsetControl-Qt"
            url: "https://github.com/Odizinne/HeadsetControl-Qt"
            description: "HeadsetControl-Qt is a frontend for headsetcontrol by Sapd using Qt-Widgets. It is running on both windows and linux. It was one of my first projects."
        }
        ListElement {
            title: "Boxy"
            url: "https://github.com/Odizinne/Boxy"
            description: "A python discord music bot built on top of yt-dlp. Can be used with a user friendly GUI, or in nogui mode and controlled by discord commands."
        }
        ListElement {
            title: "BigPictureTV"
            url: "https://github.com/Odizinne/BigPictureTV"
            description: "A PC to console automation software relying on Steam big picture mode. Couch gaming ready with just one controller button press."
        }
        ListElement {
            title: "EnhancedDisplaySwitch"
            url: "https://github.com/Odizinne/EnhancedDisplaySwitch"
            description: "A frontend to original windows displayswitch.exe command, providing access to last used command. It was made for scripting purposes."
        }
        ListElement {
            title: "AutoSceneSwitcher"
            url: "https://github.com/Odizinne/AutoSceneSwitcher"
            description: "Automatically switch streamlabs-obs scene based on process detection. Originally made specifically for a friend needs. Easy to setup."
        }
    }

    Rectangle {
        id: topbar
        anchors.topMargin: 0
        anchors.bottomMargin: 30
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 60
        color: root.topbarColor


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
                highlighted: root.selectedTab === 0
                text: "Welcome"
                onClicked: {
                    root.selectedTab = 0
                }
            }

            Button {
                flat: true
                highlighted: root.selectedTab === 1
                text: "Projects"
                onClicked: {
                    root.selectedTab = 1
                }
            }
            Button {
                flat: true
                highlighted: root.selectedTab === 2
                text: "Skills"
                onClicked: {
                    root.selectedTab = 2
                }
            }
            Button {
                flat: true
                highlighted: root.selectedTab === 3
                text: "About me"
                onClicked: {
                    root.selectedTab = 3
                }
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
            }

            Switch {
                id: themeSwitch
                checked: root.Material.theme === root.Material.Dark
                onCheckedChanged: {
                    if (checked) {
                        root.Material.theme = root.Material.Dark
                        themeSwitch.checked = true
                    } else {
                        root.Material.theme = root.Material.Light
                        themeSwitch.checked = false
                    }
                }
            }
        }
    }

    ScrollView {
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.top: topbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        visible: opacity > 0
        opacity: root.selectedTab === 0 ? 1 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: root.animationDuration
                easing.type: Easing.InOutQuad
            }
        }

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
                    text: "I'm a Qt Desktop applications Developer focused on creating clean and intuitive applications"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }

                Button {
                    Layout.alignment: Qt.AlignHCenter
                    text: "View My Projects"
                    onClicked: root.selectedTab = 1
                }
            }
        }
    }

    ScrollView {
        //anchors.topMargin: 30
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.top: topbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        visible: opacity > 0  // Bind visibility to opacity
        opacity: root.selectedTab === 1 ? 1 : 0  // Use opacity instead of visible

        // Add fade animation
        Behavior on opacity {
            NumberAnimation {
                duration: root.animationDuration  // Adjust duration as needed
                easing.type: Easing.InOutQuad
            }
        }
        ScrollBar.vertical.policy: contentHeight > height ? ScrollBar.AlwaysOn : ScrollBar.AsNeeded
        contentWidth: availableWidth
        contentHeight: overviewLabel.height + grid.contentHeight + 40

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
                anchors.topMargin: 30
                height: 50
                horizontalAlignment: Text.AlignHCenter
            }

            GridView {
                id: grid
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: overviewLabel.bottom
                height: contentHeight
                interactive: false
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                cellWidth: width / targetColumns
                cellHeight: cellWidth * 0.7

                model: projectsModel
                clip: true

                delegate: Item {
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

                        transform: Scale {
                            id: cardScale
                            origin.x: cardRect.width / 2
                            origin.y: cardRect.height / 2
                        }

                        // Add scale animation
                        Behavior on scale {
                            NumberAnimation {
                                duration: 200
                                easing.type: Easing.OutQuad
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true  // Enable hover detection

                            onEntered: cardRect.scale = 1.05  // Scale up on hover
                            onExited: cardRect.scale = 1.0    // Return to normal size
                            onClicked: {
                                Qt.openUrlExternally(model.url)
                            }
                        }

                        Text {
                            id: projName
                            anchors {
                                top: parent.top
                                left: parent.left
                                right: parent.right
                                topMargin: 25
                                leftMargin: 15
                                rightMargin: 15
                                bottomMargin: 0
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
                                margins: 15
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

    ScrollView {
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.top: topbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        visible: opacity > 0
        opacity: root.selectedTab === 2 ? 1 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: root.animationDuration
                easing.type: Easing.InOutQuad
            }
        }

        ScrollBar.vertical.policy: contentHeight > height ? ScrollBar.AlwaysOn : ScrollBar.AsNeeded
        contentWidth: availableWidth

        Item {
            width: parent.width
            implicitHeight: mainColumn.implicitHeight
            anchors.bottomMargin: 15


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

                property var skillsModel: [
                    {
                        category: "Desktop Development",
                        color: "#73d216",
                        bgColor: root.bgGreen,
                        skills: [
                            {name: "Qt/QML", level: 0.9},
                            {name: "Qt Widgets", level: 0.7},
                            {name: "C++", level: 0.8}
                        ]
                    },
                    {
                        category: "Operating Systems",
                        color: "#fcaf3e",
                        bgColor: bgOrange,
                        skills: [
                            {name: "Windows", level: 0.95},
                            {name: "Debian", level: 0.8},
                            {name: "Arch Linux", level: 0.65},
                            {name: "Fedora", level: 0.65},
                            {name: "macOS", level: 0.0}
                        ]
                    },
                    {
                        category: "Python Development",
                        color: "#ad7fa8",
                        bgColor: bgPurple,
                        skills: [
                            {name: "Python", level: 0.7},
                            {name: "PyQt/PySide", level: 0.65}
                        ]
                    },
                    {
                        category: "Development Tools",
                        color: "#ef2929",
                        bgColor: bgRed,
                        skills: [
                            {name: "Git", level: 0.85},
                            {name: "Qt Creator", level: 0.8},
                            {name: "VSCode", level: 0.8},
                            {name: "GitHub Workflow", level: 0.75}
                        ]
                    },
                    {
                        category: "Other Technologies",
                        color: "#babdb6",
                        bgColor: bgGrey,
                        skills: [
                            {name: "Electron", level: 0.5}
                        ]
                    }
                ]

                Repeater {
                    model: parent.skillsModel

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

    ScrollView {
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.top: topbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        visible: opacity > 0
        opacity: root.selectedTab === 3 ? 1 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: root.animationDuration
                easing.type: Easing.InOutQuad
            }
        }

        ScrollBar.vertical.policy: contentHeight > height ? ScrollBar.AlwaysOn : ScrollBar.AsNeeded
        contentWidth: availableWidth

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
                    font.pixelSize: 30
                    font.bold: true
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
                        font.pixelSize: 16
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
                            height: aboutColumn.width > 600 ? 200 : cardColumn.implicitHeight + 40  // Fixed height when 2 per line
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
                                    font.pixelSize: 18
                                }

                                Label {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    text: modelData.content
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: 14
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
