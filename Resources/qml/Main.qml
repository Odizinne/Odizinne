import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import "."

ApplicationWindow {
    id: root
    width: 360
    height: 641
    visible: true
    title: qsTr("Flora's Portfolio")

    property bool isMobile: width <= 850
    property real fontScale: isMobile ? 0.75 : 1
    property real cardHeightScale: isMobile ? 1 : 0.85
    property int selectedTab: 0
    property int spacing: 40
    property int targetColumns: Math.max(1, Math.min(5, Math.floor(width / 380)))

    property int animationDuration: 400
    Material.theme: Material.System
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
            darkImage: "qrc:/images/retr0mine.png"
            lightImage: "qrc:/images/retr0mine.png"
            url: "https://github.com/Odizinne/Retr0Mine"
            description: "Retr0Mine is an attempt to create a modern looking minesweeper for a friend. It was designed with many QoL features to enhance gameplay. Runs on windows and linux."
        }
        ListElement {
            title: "QuickSoundSwitcher"
            darkImage: "qrc:/images/quicksoundswitcher.png"
            lightImage: "qrc:/images/quicksoundswitcher.png"
            url: "https://github.com/Odizinne/QuickSoundSwitcher"
            description: "A custom all in one audio panel for windows featuring input and output device switch as well as a volume mixer. Made with close to native Ui for Windows 10 and 11."
        }
        ListElement {
            title: "HeadsetControl-Qt"
            darkImage: "qrc:/images/headsetcontrolqt.png"
            lightImage: "qrc:/images/headsetcontrolqt.png"
            url: "https://github.com/Odizinne/HeadsetControl-Qt"
            description: "HeadsetControl-Qt is a frontend for headsetcontrol by Sapd using Qt-Widgets. It is running on both windows and linux. It was one of my first projects."
        }
        ListElement {
            title: "Boxy"
            darkImage: "qrc:/images/boxy.png"
            lightImage: "qrc:/images/boxy.png"
            url: "https://github.com/Odizinne/Boxy"
            description: "A python discord music bot built on top of yt-dlp. Can be used with a user friendly GUI, or in nogui mode and controlled by discord commands."
        }
        ListElement {
            title: "BigPictureTV"
            darkImage: "qrc:/images/bigpicturetv_light.png"
            lightImage: "qrc:/images/bigpicturetv_dark.png"
            url: "https://github.com/Odizinne/BigPictureTV"
            description: "A PC to console automation software relying on Steam big picture mode. Couch gaming ready with just one controller button press."
        }
        ListElement {
            darkImage: "qrc:/images/powershell_light.png"
            lightImage: "qrc:/images/powershell_dark.png"
            title: "EnhancedDisplaySwitch"
            url: "https://github.com/Odizinne/EnhancedDisplaySwitch"
            description: "A frontend to original windows displayswitch.exe command, providing access to last used command. It was made for scripting purposes."
        }
        ListElement {
            darkImage: "qrc:/images/autosceneswitcher.png"
            lightImage: "qrc:/images/autosceneswitcher.png"
            title: "AutoSceneSwitcher"
            url: "https://github.com/Odizinne/AutoSceneSwitcher"
            description: "Automatically switch streamlabs-obs scene based on process detection. Originally made specifically for a friend needs. Easy to setup."
        }
        ListElement {
            darkImage: "qrc:/images/powershell_light.png"
            lightImage: "qrc:/images/powershell_dark.png"
            title: "Sunshine-Toolbox"
            url: "https://github.com/Odizinne/sunshine-toolbox"
            description: "An automation cli tool for sunshine moonlight local streaming. Allow to change host resolution to match client, toggle hdr, start and monitor BigPicture process..."
        }
        ListElement {
            darkImage: "qrc:/images/openrgbinstaller.png"
            lightImage: "qrc:/images/openrgbinstaller.png"
            title: "OpenRGB-Installer"
            url: "https://github.com/Odizinne/OpenRGB-Installer"
            description: "A GUI installer and updater for OpenRGB designed for windows. It is possible to installed specific version or just the latest stable or experimental one."
        }
        ListElement {
            darkImage: "qrc:/images/makesense_light.png"
            lightImage: "qrc:/images/makesense_dark.png"
            title: "makeSense"
            url: "https://github.com/Odizinne/makeSense"
            description: "makeSense ias a PyQt6 dualsense driver for windows. It was designed to monitor battery state, use touchpad as pointer, set rgb color, and emulate XBOX controller with ViGEmBus."
        }
        ListElement {
            darkImage: "qrc:/images/pokeroguestandalone.png"
            lightImage: "qrc:/images/pokeroguestandalone.png"
            title: "Pokerogue-Standalone"
            url: "https://github.com/Odizinne/Pokerogue-Standalone"
            description: "An electron wrapper for Pokérogue made with couch gaming and steam deck in mind. Features some qol such as fullscreen by default, themed cursor and mouse cursor hiding on idle."
        }
    }

    property var skillsModel: [
        {
            category: "Desktop Development",
            color: "#73d216",
            bgColor: root.bgGreen,
            skills: [
                {name: "Qt/QML", level: 0.8},
                {name: "Qt Widgets", level: 0.7},
                {name: "C++", level: 0.7}
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
                {name: "Python", level: 0.6},
                {name: "PyQt/PySide", level: 0.7}
            ]
        },
        {
            category: "Development Tools",
            color: "#ef2929",
            bgColor: bgRed,
            skills: [
                {name: "Git", level: 0.8},
                {name: "Qt Creator", level: 0.8},
                {name: "VSCode", level: 0.7},
                {name: "GitHub Workflow", level: 0.65}
            ]
        },
        {
            category: "Other Technologies",
            color: "#babdb6",
            bgColor: bgGrey,
            skills: [
                {name: "Electron", level: 0.3}
            ]
        }
    ]

    Rectangle {
        color: root.bgColor
        opacity: 0
        anchors.fill: parent

        Component.onCompleted: {
            opacity = 1
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }

        TopBar {
            id: topbar
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            selectedTab: root.selectedTab
            onTabSelected: function(tab) {
                root.selectedTab = tab
            }
        }

        StackLayout {
            id: mainStack
            anchors.top: topbar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            currentIndex: root.selectedTab
            Loader {
                id: welcomeLoader
                active: root.selectedTab === 0 || opacity > 0
                source: "WelcomePage.qml"
                opacity: root.selectedTab === 0 ? 1 : 0

                Behavior on opacity {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            Loader {
                id: projectsLoader
                active: root.selectedTab === 1 || opacity > 0
                source: "ProjectsPage.qml"
                opacity: root.selectedTab === 1 ? 1 : 0

                Behavior on opacity {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            Loader {
                id: skillsLoader
                active: root.selectedTab === 2 || opacity > 0
                source: "SkillsPage.qml"
                opacity: root.selectedTab === 2 ? 1 : 0

                Behavior on opacity {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            Loader {
                id: aboutLoader
                active: root.selectedTab === 3 || opacity > 0
                source: "AboutPage.qml"
                opacity: root.selectedTab === 3 ? 1 : 0

                Behavior on opacity {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
}
