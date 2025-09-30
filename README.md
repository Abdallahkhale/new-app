# 📰 News App

A Flutter-based mobile application that provides news from various categories and sources using the **MVVM architecture**.  
The app fetches real-time articles using **NewsAPI** and displays them in a clean and user-friendly interface.

---

## ✨ Features

- 📌 **Multiple News Categories**
  - General  
  - Sports  
  - Science  
  - Technology  
  - Business  

- 🌍 **News from Multiple Sources**  
  Each category provides news from different trusted sources via API.

- 🏠 **Home Screen**
  - Displays news filtered by category.

- 🔍 **Search Screen**
  - Search for any news topic across all sources.

- 📄 **Details Screen**
  - View the full details of each news article.

- 📰 **News Sources**
  - Browse articles by publisher/source.

- 🏗️ **MVVM Architecture**
  - Organized folder structure:
    - Models  
    - Views  
    - ViewModels  
    - Services  

---

## 🌐 API Used

This app uses **NewsAPI** to fetch news articles:


You can generate your own API key at:  
🔗 https://newsapi.org

---

## 📸 Screenshots

*(Add your screenshots inside an `images` folder and update the filenames as needed.)*

### ▶️ Home Screen
![Home](image_news/homescreen.png)

### ▶️ Search Screen
![Search](image_news/search.png)

### ▶️ News Details
![Details](image news/news_details.png)

### ▶️ Sources
![Sources](image news/newssource.png)

---

## 🛠️ Tech Stack

- **Framework:** Flutter  
- **Language:** Dart  
- **Architecture:** MVVM  
- **API:** NewsAPI  

---

## 🚀 Getting Started

### ✅ Prerequisites

- Flutter SDK  
- Android Studio or VS Code  
- Emulator or real device  
- NewsAPI key  

### ✅ Installation

```bash
# Clone the repository
git clone https://github.com/your-username/news-app.git

# Navigate to project directory
cd news_app

# Install dependencies
flutter pub get

# Run the app
flutter run
