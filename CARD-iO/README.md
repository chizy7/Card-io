# CARD-iO

## Description

CARD-iO is the project for the group 5 for Flutter.

## User Stories

### REQUIRED

- [x] Main Welcome Screen (Can be a sign in screen)
- [x] Google and manual signup/sign in flow.
- [x] After login, the screen should present a list of members in your group.
- [x] The logged in user should be able to add their name to the list by clicking "add myself" which grabs the user info from their social signup and/or the database.
- [x] The user can click on anyone of the current group members which should navigate to their individual group member page with a bio and picture(or avatar likeness if preferred).
- [x] The dimensions for profile pictures and sized boxes for the bio content should be consistent across all group members.
- [x] Use the Touch Gesture to add an action like tapping or dragging.
- [x] Must use Firebase Authentication to register your users
- [x] Must use a Database (GCP Cloud SQL is Fine).

## Visuals (PowerPoint Presentation and Walkthrough GIFs)

### PowerPoint Presentation Link

Slides: Here is the link to [CARD-iO slides](https://docs.google.com/presentation/d/14OTapWjVMH4f5b8AnNTiTIiGeBpipW3vTCwoLfNAgys/edit?usp=sharing) for this project.

### Video Walkthrough

Here's walkthroughs of implemented user stories:

<p float="left">
 <img src='https://i.imgur.com/nQWorIG.gif' width=250 alt='Fall #1' />
 <img src='https://i.imgur.com/PnKdZIL.gif' width=250 alt='Fall #2' />
 <img src='https://i.imgur.com/jxD47gN.gif' width=250 alt='Fall #3' />
 <img src='https://i.imgur.com/H8o0tjA.gif' width=250 alt='Fall #4' />
</p>


## Installation

The first step is to [Install Flutter](https://flutter.dev/get-started/) for your operating system.

### Installation in Windows

**Step 1** - Assuming you have downloaded and installed the latest Flutter SDK for windows system.

**Step 2** - Unzip the zip archive in a folder, say C:\flutter\

**Step 3** - Update the system path to include flutter bin directory.

**Step 4** - Flutter provides a tool, flutter doctor to check that all requirement of flutter development is met.

`flutter doctor`

**Step 5** - Running the above command will analyze the system and show its report as shown below

```
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, v1.2.1, on Microsoft Windows [Version
10.0.17134.706], locale en-US)
[√] Android toolchain - develop for Android devices (Android SDK version
28.0.3)
[√] Android Studio (version 3.2)
[√] VS Code, 64-bit edition (version 1.29.1)
[!] Connected device
! No devices available
! Doctor found issues in 1 category.
```

The report above says that all development tools are available but the device is not connected. We can fix this by connecting an android device through USB or starting an android emulator.

**Step 6** - Install the latest Android SDK, if reported by flutter doctor

**Step 7** - Install the latest Android Studio, if reported by flutter doctor

**Step 8** - Start an android emulator or connect a real android device to the system

**Step 9** - Install Flutter and Dart plugin for Android Studio. It provides startup template to create new Flutter application, an option to run and debug Flutter application in the Android studio itself, etc.,

- Open Android Studio.
- Click File → Settings → Plugins.
- Select the Flutter plugin and click Install.
- Click Yes when prompted to install the Dart plugin.
- Restart Android studio.

### Installing in MacOS

To install Flutter on MacOS, you will have to follow the following steps below.

**Step 1** - Assuming you have installed the latest Flutter SDK for MacOS.

**Step 2** - Unzip the zip archive in a folder, say /path/to/flutter

**Step 3** - Update the system path to include flutter bin directory (in ~/.bashrc file).

`> export PATH = "$PATH:/path/to/flutter/bin"`

**Step 4** - Enable the updated path in the current session using below command and then verify it as well.

```
source ~/.bashrc
source $HOME/.bash_profile
echo $PATH
```

Flutter provides a tool, flutter doctor to check that all the requirement of flutter development is met. It is similar to the Windows counterpath.

**Step 5** - Install latest XCode, if reported by flutter doctor

**Step 6** - Install latest Android SDK, if reported by flutter doctor

**Step 7** - Install latest Android Studio, if reported by flutter doctor

**Step 8** - Start an android emulator or connect to a real android device to the system to develop android application.

**Step 9** - Open iOS simulator or connect a real iPhone device to the system to develop iOS application.

**Step 10** - Install Flutter and Dart plugin for Android Studio. It provides the startup template to create a new Flutter application, option to run and debug Flutter application in the Android studio itself, etc.

- Open Android Studio
- Click **Preferences → Plugins**
- Select the Flutter plugin and click install
- Click Yes when prompted to install the Dart plugin
- Restart Android studio.

## Usage

Assuming you have installed flutter and your system passes all `flutter doctor` tests. You can do a git clone and to run the project locally, you can open up the project in visual studio. Since this is only for flutter web, you can open up your terminal in VS Code and run the command below to launch in chrome.

`flutter run -d chrome`

## Authors and acknowledgment

- Plinio Cabrera
- Abu Butt
- Dennis Anwar
- Chizaram Chibueze

## Documentation

- [Install Flutter](https://flutter.dev/get-started/)
- [Flutter documentation](https://docs.flutter.dev/)
- [Development wiki](https://github.com/flutter/flutter/wiki)

## License

License
