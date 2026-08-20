# 🤖 Chatly AI

> **Your intelligent AI companion**

Chatly AI is a modern, futuristic AI assistant built with **Flutter**. The application brings multiple AI capabilities together in a single, clean interface — allowing users to chat with AI, generate images from text prompts, and translate text between different languages.

The project is designed with a strong focus on **modern UI/UX, scalability, clean architecture, and smooth user experience**.

---

## ✨ Features

### 💬 AI Chat

Chat with an AI assistant through a clean and intuitive conversational interface.

Users can:

* Ask questions
* Get AI-generated answers
* Continue conversations
* Ask technical or general questions
* Receive contextual responses
* View previous conversations

---

### 🎨 AI Image Generation

Create images using natural-language prompts.

For example:

> "A futuristic city at night with neon lights and flying cars."

The image generation interface is designed to provide a simple workflow:

1. Enter a prompt
2. Select an optional style
3. Generate the image
4. View the generated result

Possible styles include:

* Realistic
* 3D
* Anime
* Digital Art
* Cinematic
* Futuristic

---

### 🌐 AI Translation

Translate text between multiple languages using AI.

The translation interface provides:

* Source language selection
* Target language selection
* Text input
* Translation output
* Language swapping
* Easy copy/share functionality

---

### 🏠 Modern AI Dashboard

The home screen acts as the central hub for all AI features.

It provides quick access to:

* AI Chat
* AI Image Generator
* Translator
* Additional AI tools
* Recent conversations

The interface uses a modern dark theme with:

* Purple/cyan gradients
* Glassmorphism-inspired cards
* Soft glowing effects
* Rounded components
* Minimal navigation
* Responsive layouts

---

### 🚀 Splash Screen

Chatly AI includes a futuristic splash screen featuring:

* Animated application logo
* Gradient glow effects
* AI-inspired visual design
* Loading animation
* Application branding

---

### 👋 Onboarding

The onboarding experience introduces users to the core capabilities of Chatly AI.

Users can discover:

* AI conversation
* Image generation
* Text translation

After completing onboarding, the application remembers the user's state using local storage.

---

### 💾 Local Storage

Chatly AI uses **Hive** for lightweight local data persistence.

It can be used to store information such as:

* Onboarding status
* User preferences
* Chat history
* Local settings
* Cached application data

---

## 🛠️ Tech Stack

| Technology      | Purpose                                |
| --------------- | -------------------------------------- |
| Flutter         | Cross-platform application development |
| Dart            | Programming language                   |
| GetX            | State management & navigation          |
| Hive            | Local NoSQL database                   |
| Hive Flutter    | Flutter integration for Hive           |
| Lottie          | Animations                             |
| Material Design | UI components                          |
| REST APIs       | AI service integration                 |

---

## 🏗️ Project Architecture

The project follows a modular structure designed to keep UI, business logic, and reusable components separated.

```text
lib/
│
├── controller/
│   ├── onboarding_controller.dart
│   └── splash_screen_controller.dart
│
├── helper/
│   ├── global.dart
│   └── pref.dart
│
├── screens/
│   ├── splash_screen.dart
│   ├── onboarding_screen.dart
│   ├── home_screen.dart
│   ├── chat_screen.dart
│   ├── image_generator_screen.dart
│   └── translation_screen.dart
│
├── widgets/
│   ├── custom_loading_widget.dart
│   ├── onboarding_page_widget.dart
│   └── page_indicator.dart
│
└── main.dart
```

The structure can be expanded as the application grows.

---

## 📱 Application Flow

```text
                    ┌───────────────┐
                    │    Launch     │
                    │      App      │
                    └───────┬───────┘
                            │
                            ▼
                    ┌───────────────┐
                    │    Splash     │
                    │    Screen     │
                    └───────┬───────┘
                            │
                            ▼
                  ┌─────────────────────┐
                  │ First Launch?       │
                  └─────────┬───────────┘
                            │
                  ┌─────────┴─────────┐
                  │                   │
                 YES                  NO
                  │                   │
                  ▼                   ▼
          ┌──────────────┐     ┌──────────────┐
          │  Onboarding  │     │     Home     │
          └──────┬───────┘     └──────┬───────┘
                 │                    │
                 └──────────┬─────────┘
                            │
                            ▼
                    ┌───────────────┐
                    │   Chatly AI   │
                    │      Home     │
                    └───────┬───────┘
                            │
             ┌──────────────┼──────────────┐
             │              │              │
             ▼              ▼              ▼
        ┌─────────┐   ┌──────────┐   ┌───────────┐
        │ AI Chat │   │AI Images │   │ Translator│
        └─────────┘   └──────────┘   └───────────┘
```

---

## 🎨 Design Philosophy

Chatly AI follows a **futuristic AI-focused visual language**.

### Color Palette

Primary colors:

```text
Background:
#050816

Primary Purple:
#6C63FF

Cyan:
#00D9FF

Secondary Purple:
#8B5CF6
```

The dark background provides a premium appearance while the purple and cyan gradients reinforce the AI/futuristic identity.

---

## 📂 Assets

The application uses various assets including:

```text
assets/
│
├── icon/
│   └── icon.png
│
├── lottie/
│   ├── chat.json
│   ├── image_generation.json
│   └── translation.json
│
└── images/
    └── ...
```

Lottie animations are used to create smooth and lightweight onboarding and loading experiences.

---

## ⚙️ Installation

### 1. Clone the repository

```bash
git clone <repository-url>
```

### 2. Navigate to the project

```bash
cd chatly_ai
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

---

## 📦 Dependencies

Example dependencies used by the project:

```yaml
dependencies:
  flutter:
    sdk: flutter

  get: ^4.6.6
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  lottie: ^3.1.2
```

Use the versions defined in the project's actual `pubspec.yaml` when installing the application.

---

## 🔐 Data & Privacy

Chatly AI is designed to keep local application preferences on the user's device.

Hive can be used for local persistence, while AI functionality can be connected to external APIs depending on the application's backend implementation.

API keys should **never be hardcoded inside the Flutter client**.

For production deployments, sensitive API credentials should be handled through a secure backend.

---

## 🔮 Future Improvements

Planned improvements can include:

* [ ] Real-time AI chat
* [ ] AI conversation history
* [ ] Streaming AI responses
* [ ] AI image generation API
* [ ] Multiple image-generation models
* [ ] Advanced translation
* [ ] Voice input
* [ ] Text-to-speech
* [ ] Speech-to-text
* [ ] Conversation search
* [ ] Chat deletion
* [ ] Favorite conversations
* [ ] Image download/share
* [ ] Dark/light theme
* [ ] User authentication
* [ ] Cloud synchronization
* [ ] Subscription system
* [ ] Usage limits
* [ ] Push notifications
* [ ] AI model selection

---

## 🧠 Future Architecture

As the application grows, the architecture can evolve toward:

```text
Presentation
     │
     ▼
Controllers / ViewModels
     │
     ▼
Repositories
     │
     ▼
Services
     │
     ├── AI Chat API
     ├── Image Generation API
     ├── Translation API
     └── Authentication API
     │
     ▼
Local / Remote Data
     │
     ├── Hive
     └── Backend
```

This approach makes the application easier to test, maintain, and scale.

---

## 🎯 Project Goals

The main goals of Chatly AI are to:

* Provide multiple AI capabilities in one application
* Deliver a premium and intuitive user experience
* Maintain a scalable Flutter architecture
* Demonstrate modern Flutter development practices
* Provide a foundation for integrating multiple AI services
* Build a production-ready AI assistant experience

---

## 👨‍💻 Development

Chatly AI is built with Flutter and follows modern development practices including:

* Reusable widgets
* Modular project structure
* State management
* Local persistence
* Named navigation
* Responsive UI
* Separation of UI and business logic

---

## ⭐ Contributing

Contributions are welcome.

To contribute:

```bash
git checkout -b feature/your-feature
```

Make your changes, test the application, and create a pull request.

---

## 📄 License

This project can be distributed under the license selected by the project owner.

---

# 🚀 Chatly AI

**Chat. Create. Translate.**

One intelligent platform for your everyday AI needs.
