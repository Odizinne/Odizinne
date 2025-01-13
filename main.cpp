#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QFile>

int main(int argc, char *argv[])
{
    //qputenv("QT_QUICK_CONTROLS_MATERIAL_VARIANT", "Dense");
    QGuiApplication app(argc, argv);


    QFile fontFile(":/font/SpaceMono-Regular.ttf");
    if (!fontFile.exists()) {
        qDebug() << "Font file not found in resources";
    }
    int fontId = QFontDatabase::addApplicationFont(":/font/SpaceMono-Regular.ttf");
    if (fontId != -1) {
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
    engine.load(QUrl("qrc:/qml/Main.qml"));

    return app.exec();
}
