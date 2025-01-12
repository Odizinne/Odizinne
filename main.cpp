#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QFile>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    // ... at the start of main():
    QFile fontFile(":/FiraCode-VF.woff2");
    if (!fontFile.exists()) {
        qDebug() << "Font file not found in resources";
    }
    int fontId = QFontDatabase::addApplicationFont(":/FiraCode-VF.woff2");
    if (fontId != -1) {
        // Get the font family name
        QString family = QFontDatabase::applicationFontFamilies(fontId).at(0);
        QFont font(family);
        app.setFont(font);
    } else {
        qDebug() << "fail";
    }

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(QUrl("qrc:/Main.qml"));

    return app.exec();
}
