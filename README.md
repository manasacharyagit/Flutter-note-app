# 📒 Notes App
A simple **Flutter Notes App** built with clean UI and smooth functionality. It lets you quickly create, edit, delete, and organize notes with tags. Includes **Dark Mode** and **Swipe to Delete** for a modern experience.

## 🚀 Features
- 📝 Add, edit, and delete notes
- 🏷️ Add tags to notes (displayed with `#tag`)
- 🌙 Dark mode toggle
- 👆 Swipe to delete with undo option
- 📱 Responsive UI for Android & iOS

## 🛠️ Setup Instructions
1. **Clone this repository**
```bash
git clone https://github.com/YOUR_USERNAME/notes_app.git
cd notes_app
```
2. **Install dependencies**
```bash
flutter pub get
```
3. **Run the app**
```bash
flutter run
```
4. **Build release APK**
```bash
flutter build apk --release
```
The APK will be generated in:
build/app/outputs/flutter-apk/app-release.apk

## Sreenshots

<img width="1920" height="1200" alt="Screenshot (21)" src="https://github.com/user-attachments/assets/8af3ef04-e9c5-403f-8838-cfd03cff7404" />
<img width="1920" height="1200" alt="Screenshot (20)" src="https://github.com/user-attachments/assets/edc31bc1-6d52-4696-9c76-c472f6ed8528" />
<img width="1920" height="1200" alt="Screenshot (19)" src="https://github.com/user-attachments/assets/485eaa26-3c83-4531-a650-64d97f963129" />
<img width="1920" height="1200" alt="Screenshot (18)" src="https://github.com/user-attachments/assets/e25c1824-865f-4b0a-ae60-eed503a592e1" />

## ✅ Completed
- Core note-taking features (add/edit/delete)
- Tagging system with `#tags`
- Dark mode toggle
- Swipe to delete + Snackbar undo

## 🔜 Future Improvements
- Persistent local storage (Hive/SQLite)
- Cloud sync
- Search and filter by tags
- User authentication for multiple devices