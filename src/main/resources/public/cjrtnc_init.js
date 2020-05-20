cheerpjInit();
var jarName = "/app/cheerpjfy.jar";
cheerpjRunStaticMethod(threads[0], "java/lang/System", cjSystemSetProperty, "java.class.path", jarName);
cheerpjRunStaticMethod(threads[0], "sun/launcher/LauncherHelper", cjLauncherCheckAndLoad, 0, 2, jarName);
