## 1. Initial Setup

To get started with the project, run the following commands:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

Then, run the setup script to configure the environment:

```bash
# Make the script executable
chmod +x ./setup.sh

# Run the setup
./setup.sh
```

---

## 2. Git Branch & Commit Conventions

### Branch Naming

All branches must follow the format:

```
feat/<feature-name>
fix/<bug-name>
refactor/<refactor-name>
chore/<task-name>
```

### Commit Messages

All commits should follow the Conventional Commit format:

```
type: Short description (at least 3 characters)
```

Allowed types: `feat`, `fix`, `refactor`, `chore`, `docs`, `style`, `test`, `perf`, `ci`, `build`, `wip`,
`revert`

Example:

```
feat: add localization support
fix: correct padding on lunch card
```

---

## 3. Localization (L10n)

To add new text for localization, run the provided script:

```bash
./l10n_generator.sh
```

* Specify the type as `text` when prompted.
* Access localized text in your code using:

```dart
context.l10n.text
```

---
