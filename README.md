# Xcode Templates for Sketch Plugins

```
git clone git@github.com:MagicSketch/XcodeTemplate-SketchPlugin.git /Library/Developer/Xcode/Templates/Sketch\ Plugin
```

## Available Templates

- Sketch Plugin Bundle (generates a .sketchplugin)
- Sketch Plugin Framework (generates a .framework)

![](image/preview.png)

### Sketch Plugin Bundle (.sketchplugin)

This will generate necessary files that you needed for your first Sketch plugin that will build with Xcode. You should almost always start with the when creating a new Xcode project.

Make sure you set the executable in the scheme.

![](image/set-executable.png)

## Sketch Plugin Framework (.framework)

This will generate a .framework ready for you to integrate in your .sketchplugin

After you create this target, go back select your bundle, and configure the Target Dependancy and the Copy File phase.

![](image/target-dependancy.png)

