
<p align="center">
  <img src="https://i.ibb.co/DpTw3QR/Flutter-Conf-logo.png" width="600">
</p>
<h2 align="center">Advanced Workshop Template</h2>

This project will be used as a template in the Advanced Workshop about Flutter for Web & Desktop, during FlutterConf 2019 in Marbella, Spain.

It has three branches:

* **`master`** Starting point of the workshop: the `lib/` folder is empty.
* **`platforms`** Added support for both desktop & web to the project.
* **`responsive`** Added a responsive design to the app.

## General

This Flutter project acts as a boilerplate to create true universal apps from a single codebase.

Currently, the Flutter frameworks supports these platforms:
* Android
* iOS
* Windows
* macOS
* GNU+Linux
* Web (Chrome only)

## Getting started

In order to build & deploy apps to specific, just run:

```
$ flutter build android|ios|windows|macos|linux|web
```

If want you really want is to test the app, first run `flutter devices` to check connected devices. Then, you'll have to run:

```
$ flutter run -d DEVICE
```

## Download & install
First, clone the repository with the 'clone' command, or just download the zip.

```
$ git clone git@github.com:jesusrp98/flutterconf-template.git
```

Then, download either Android Studio or Visual Studio Code, with their respective [Flutter editor plugins](https://flutter.io/get-started/editor/). For more information about Flutter installation procedure, check the [official install guide](https://flutter.io/get-started/install/).

Install dependencies from `pubspec.yaml` by running `flutter packages get` from the project root (see [using packages documentation](https://flutter.io/using-packages/#adding-a-package-dependency-to-an-app) for details and how to do this in the editor).

There you go, you can now open & edit the project. Enjoy!

## Built with
* [Flutter](https://flutter.dev/) - Beautiful native apps in record time.
* [Android Studio](https://developer.android.com/studio/index.html/) - Tools for building apps on every type of Android device.
* [Visual Studio Code](https://code.visualstudio.com/) - Code editing. Redefined.


## Authors
* **Jesús Rodríguez**: [GitHub](https://github.com/jesusrp98) & [Twitter](https://twitter.com/jesusrp98).
* **Rody Davis**: [GitHub](https://github.com/AppleEducate) & [Twitter](https://twitter.com/rodydavis).

## Contributing
If you want to take the time to make this project better, please read the [contributing guides](https://github.com/jesusrp98/flutter-everywhere/blob/master/CONTRIBUTING.md) first. Then, you can open an new [issue](https://github.com/jesusrp98/flutter-everywhere/issues/new/choose), of a [pull request](https://github.com/jesusrp98/flutter-everywhere/compare).

## License
This project is licensed under the GNU GPL v3 License - see the [LICENSE.md](LICENSE.md) file for details.
