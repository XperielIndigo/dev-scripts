var pushRight = slate.operation("push", {
	"direction" : "right",
	"style" : "bar-resize:screenSizeX/2"
    });
var pushLeft = slate.operation("push", {
	"direction" : "left",
	"style" : "bar-resize:screenSizeX/2"
    });
var pushTop = slate.operation("push", {
	"direction" : "top",
	"style" : "bar-resize:screenSizeY/2"
    });
var pushBottom = slate.operation("push", {
	"direction" : "bottom",
	"style" : "bar-resize:screenSizeY/2"
    });
var fullscreen = slate.operation("move", {
	"x" : "screenOriginX",
	"y" : "screenOriginY",
	"width" : "screenSizeX",
	"height" : "screenSizeY"
    });

slate.bind("1:ctrl", pushLeft)
    slate.bind("2:ctrl", pushRight)
    slate.bind("4:ctrl", pushTop)
    slate.bind("5:ctrl", pushBottom)
    slate.bind("3:ctrl", fullscreen)

    var openClion = slate.operation("focus", {
	    "app" : "CLion"
	});

var openAtom = slate.operation("focus", {
	"app" : "Atom"
    });
slate.bind("2:alt", openAtom)

    var openTerminal = slate.operation("focus", {
	    "app" : "Terminal"
	});
slate.bind("1:alt", openTerminal)


    var openGoogleChrome = slate.operation("focus", {
	    "app" : "Google Chrome"
	});
var openAndroidStudio = slate.operation("focus", {
	"app" : "Android Studio",
    });
slate.bind("6:alt", openAndroidStudio)

    var openIntellij = slate.operation("focus", {
	    "app" : "IntelliJ IDEA"
	});
slate.bind("4:alt", openIntellij)

    var openXcode = slate.operation("focus", {
	    "app" : "Xcode"
	});
slate.bind("7:alt", openXcode);

var openClion = slate.operation("focus", {
	"app" : "CLion"
});
slate.bind("3:alt", openClion);
slate.bind("5:alt", openGoogleChrome);

// Screen movement operations
function MoveScreenOperation(screen_id) {
	return slate.operation("throw", {
		"width" : "screenSizeX",
		"height" : "screenSizeY",
		"screen" : screen_id
	});
}
var moveToScreen1 = MoveScreenOperation("0");
var moveToScreen2 = MoveScreenOperation("1");
var moveToScreen3 = MoveScreenOperation("2");

slate.bind("1:ctrl;shift", moveToScreen1);
slate.bind("2:ctrl;shift", moveToScreen2);
slate.bind("3:ctrl;shift", moveToScreen3);
