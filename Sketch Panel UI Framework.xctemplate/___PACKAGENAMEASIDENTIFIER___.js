/*
// To load this framework, add the following code in your manifest.json

"commands": [
:
:
{
    "script" : "___PACKAGENAMEASIDENTIFIER___.framework/___PACKAGENAMEASIDENTIFIER___.js",
    "handlers" : {
        "actions" : {
            "Startup" : "onStartup",
            "OpenDocument":"onOpenDocument",
            "SelectionChanged.finish" : "onSelectionChanged"
        }
    }
}
]
*/

var onStartup = function(context) {
  var ___PACKAGENAMEASIDENTIFIER____FrameworkPath = ___PACKAGENAMEASIDENTIFIER____FrameworkPath || COScript.currentCOScript().env().scriptURL.path().stringByDeletingLastPathComponent();
  var ___PACKAGENAMEASIDENTIFIER____Log = ___PACKAGENAMEASIDENTIFIER____Log || log;
  (function() {
    var mocha = Mocha.sharedRuntime();
    var frameworkName = "___PACKAGENAMEASIDENTIFIER___";
    var directory = ___PACKAGENAMEASIDENTIFIER____FrameworkPath;
    if (mocha.valueForKey(frameworkName)) {
      ___PACKAGENAMEASIDENTIFIER____Log("😎 loadFramework: `" + frameworkName + "` already loaded.");
      return true;
    } else if ([mocha loadFrameworkWithName:frameworkName inDirectory:directory]) {
      ___PACKAGENAMEASIDENTIFIER____Log("✅ loadFramework: `" + frameworkName + "` success!");
      mocha.setValue_forKey_(true, frameworkName);
      return true;
    } else {
      ___PACKAGENAMEASIDENTIFIER____Log("❌ loadFramework: `" + frameworkName + "` failed!: " + directory + ". Please define ___PACKAGENAMEASIDENTIFIER____FrameworkPath if you're trying to @import in a custom plugin");
      return false;
    }
  })();
};

var onSelectionChanged = function(context) {
  ___PACKAGENAMEASIDENTIFIER___.onSelectionChanged(context);
};
