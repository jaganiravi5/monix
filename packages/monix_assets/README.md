# monix_assets

## Monix App Assets
This package includes all the icons, images and other json files which required in the app.
#
## Structure

The monix_assets structured into following folders:

- \'`pubspec.yaml`\' : contains all the dependencies like flutter gen, flutter svg etc. and package configuration.
- \'`assets/`\' : contains all the images, icons and json files.
- \'`lib/`\' : contains all the generated necessary files.
#
## Usage

This project uses flutter gen to generate assets.

For assets generation :

**step 1.** if fluttergen not activated run this command:
```console
dart pub global activate flutter_gen

export PATH="$PATH":"$HOME/.pub-cache/bin
```

**step 2.** Put the assets which you need to access all over the app inside (packages/medica_assets/assets/)

**step 3.** Run the following command to generate EComAppAssets class which stores asset information and configuration.
```console
fluttergen -c pubspec.yaml
```

**step 4.** You can access the assets all over the app now like following:
```dart
  /// For images
 MonixAssets.images.<asset_name>.image()
 /// For icons
 MonixAssets.icons.<asset_name>.image()
```

for more information click [here](https://pub.dev/packages/flutter_gen)
