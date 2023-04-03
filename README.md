# Ebook Reader and Note-taking App

This document describes how to develop an ebook reader and note-taking app using Flutter.

## Table of Contents

- [Setting Up the Environment](#setting-up-the-environment)
- [Creating a New Flutter Project](#creating-a-new-flutter-project)
- [Structuring Your App](#structuring-your-app)
- [Adding Dependencies](#adding-dependencies)
- [Developing Features](#developing-features)
  - [Opening and Displaying Ebooks](#opening-and-displaying-ebooks)
  - [Library View for Stored Ebooks](#library-view-for-stored-ebooks)
  - [Starting from the Last Exited Page](#starting-from-the-last-exited-page)
  - [Adding Bookmarks](#adding-bookmarks)
  - [Half-screen Note-taking](#half-screen-note-taking)
  - [Stylus Support](#stylus-support)
  - [In-app Purchases](#in-app-purchases)
  - [Page Turn Animations](#page-turn-animations)
- [Testing and Deployment](#testing-and-deployment)

## Setting Up the Environment

Follow the official Flutter installation guide: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

## Creating a New Flutter Project

In VSCode, open the command palette (Ctrl+Shift+P or Cmd+Shift+P on macOS) and type "Flutter: New Project." Follow the prompts to create a new Flutter project.

## Structuring Your App

Create the following directories in the `lib` folder of your project:

- `screens` (for different app screens)
- `widgets` (for reusable UI components)
- `services` (for handling API calls and file operations)
- `models` (for data models)
- `utils` (for utility functions)

## Adding Dependencies

Add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  path_provider: ^2.0.8
  flutter_pdfview: ^1.2.1
  provider: ^6.0.1
  shared_preferences: ^2.0.12
  sqflite: ^2.0.1
  in_app_purchase: ^2.0.2
  flutter_slidable: ^1.0.0
  animations: ^2.0.1
```

## Developing Features

### Opening and Displaying Ebooks

- Use the `path_provider` and `flutter_pdfview` packages to open and display PDF files within your app.
- Create a dedicated screen for displaying the PDF content and utilize the PDFView widget from the `flutter_pdfview` package.

### Library View for Stored Ebooks

- Create a screen to display a grid or list of stored ebooks
- Use a GridView.builder or ListView.builder to create the layout.
- Store the ebook metadata in a local database using the `sqflite` package.

### Starting from the Last Exited Page

- Use `shared_preferences` to store the last exited page for each ebook.
- When reopening the ebook, retrieve this value and navigate to the stored page.

### Adding Bookmarks

- Create a bookmark model and store bookmarks in the local database.
- Allow users to add, delete, and navigate to bookmarks from a dedicated bookmarks screen.

### Half-screen Note-taking

- Utilize the `flutter_slidable` package to create a slidable note-taking panel that appears when the user swipes left while reading an ebook.
- Store notes in the local database and allow users to view, edit, and delete them.

### Stylus Support

- Flutter has built-in support for stylus input.
- Use the GestureDetector widget to handle touch and stylus events for drawing and note-taking.

### In-app Purchases

- Use the `in_app_purchase` package to handle subscription purchases.
- Create a subscription product on both the Apple App Store and Google Play Store.
- Check the user's subscription status and enable or disable features accordingly.

### Page Turn Animations

- Use the `animations` package to create page turn animations when navigating between pages in an ebook.
- You can use the PageTransitionSwitcher and SharedAxisTransition widgets for smooth transitions.

## Testing and Deployment

- Test your app thoroughly on both Android and iOS devices to ensure proper functionality and compliance with platform guidelines.
- Once you are satisfied with your app, follow the deployment guidelines for both platforms to submit your app to the Apple App Store and Google Play Store.

## Directory Structure

```bash
my_ebook_reader_app/
|-- android/
|-- ios/
|-- lib/
|   |-- screens/
|   |   |-- ebook_reader_screen.dart
|   |   |-- library_screen.dart
|   |   |-- bookmarks_screen.dart
|   |   |-- notes_screen.dart
|   |-- widgets/
|   |   |-- ebook_item.dart
|   |   |-- bookmark_item.dart
|   |   |-- note_item.dart
|   |   |-- slidable_note_panel.dart
|   |-- services/
|   |   |-- file_service.dart
|   |   |-- database_service.dart
|   |   |-- subscription_service.dart
|   |-- models/
|   |   |-- ebook.dart
|   |   |-- bookmark.dart
|   |   |-- note.dart
|   |-- utils/
|   |   |-- constants.dart
|   |   |-- app_theme.dart
|   |-- main.dart
|-- test/
|-- web/
|-- pubspec.yaml
|-- README.md
```
