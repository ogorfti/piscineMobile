# Commands

```bash
flutter create project_name
```

- **`EdgeInsets.all(value)`**: adds `value` padding on all four sides.
- **`EdgeInsets.symmetric(vertical: v, horizontal: h)`**: adds `v` padding above/below and `h` left/right. Omitted values default to `0`.
- **`theme`**: sets the app’s default appearance. This line generates colors from deep purple. Colors you set on individual widgets take priority. Without this line, Flutter uses its default theme.
- **`const MyApp({super.key});`**: declares a constructor with an optional `key` argument and passes it to the parent constructor—similar to forwarding an argument to a base constructor in C++.

1. `flutter pub get` — download dependencies.
2. Start an Android emulator or iOS Simulator.
3. `flutter devices` — find the device ID.
4. `flutter run -d <device-id>` — replace `<device-id>` with the listed ID.
