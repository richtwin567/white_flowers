import QtQuick 2.12
import "../scripts/clock.js" as Clock

Canvas{
    id: clockCanvas

    property real size

    width: size
    height: size
    contextType: "2d"

    onPaint: {
        Clock.drawClock(clockCanvas);
    }

    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            Clock.clearClock(clockCanvas);
            requestPaint();
        }
    }
}
