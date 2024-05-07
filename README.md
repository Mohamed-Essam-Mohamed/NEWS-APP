# 🌐 News App




## 🚀 Getting Started

- The application is fully API-dependent.
- pagination shows the pages.
- used searchDelegate to search.
-  As we know, to get news from the internet we should connect to an API so let’s see the News API that we will use in this app.
-  News API is a simple JSON-based REST API for searching and retrieving news articles and articles from specific sources from all over the internet. Using this, one can fetch the most important news articles that work on a news site or search for the most important news on a specific topic (or keyword).
-   News can be retrieved based on some criteria. Say the topic (keyword) to be searched is 'route' or may be related to a particular channel
-   used package   webview_flutter: ^4.7.0 To get the source of the news and display it in the application.
-   News app built using news API, the user can display news agencies according the categories, he can search for a piece of article
using different end point and he can view the website of the article, the app also utilizes pagination for lazily loading date.
  
## 🤳 Screens

- **Splash Screen:** Adding a splash screen to your Android app. 
- **Home Screen:** You start with categories and then you can navigate to the news based on choosing the desired category on the same scaffold.
- **Drawer Screen:** It is possible to move to the category when we are in the news and vice versa is true.
- **Details Screen:** When the user clicks on an article, will go to this screen to show the details of this article and when the user clicks on view article, it will view its link in the user’s default browser.
- **Search Screen:** It same as the previous screen but in appear there is a search bar where the user can write the name of the article to search on it in API, and  shown when the user clicks on the search icon in the previous screen.





## 📁 Files Structure
![files structure](https://github.com/Mohamed-Essam-Mohamed/news_app/assets/152906492/f1d7d5d4-96ea-4270-93b6-2da25ffa7340)

## 📱 UI



## 🎥 Video
https://github.com/Mohamed-Essam-Mohamed/news_app/assets/152906492/41055297-8442-4ee2-9ba4-fd184fee4a1a


## 🛠 Dependencies

```pubspec.yaml
  flutter_localizations:
        sdk: flutter 
  loading_animation_widget: ^1.2.0+4
  lottie: ^2.7.0
  http: ^1.1.0
  flutter_screenutil: ^5.9.0
  dio: ^5.3.3
  audioplayers: ^5.2.1
```


- Contributions are welcome 💜
- If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

