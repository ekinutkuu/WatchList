<p align="center">
<h1 align="center">Watch List</h1>
<p align="left">
Watch List allows you to look at popular movies and add them to your watchlist or your bookmarks. You can easily keep track of all the movies you have watched, are planning to watch, or have stopped watching. Watch List allows you to have a nice movie experience.
</p></p>

## Getting started
If you don't have Flutter SDK installed, please visit the official [Flutter](https://docs.flutter.dev/get-started/install) website.

WatchList uses the <b>TMDB API</b> to fetch the needed data, so before using it you have to create an account on [TMDB api website](https://www.themoviedb.org/), then you can get a free api key in your profile section. Apply it to the WatchList app.

### How to apply your api key

- in `lib/api_key.dart`

- paste your api key here:
```
class ApiKey{
  static const apiKey = 'YOUR_API_KEY';
}
```
- example:
```
class ApiKey{
  static const apiKey = '123456789';
}
```

You're ready to run. You can run the app with Android Studio or Visual Studio or the command line.
```
flutter pub get
flutter run
```

## Side Bar

<div align="center" style="width:100%;display:flex;justify-content:space-between;">
<img width="32%" src="https://github.com/ekinutkuu/WatchList/blob/master/screenshots/sideBar.png" align="center" alt="screenshot" />
</div>

## Home Page

The home page lists trending movies and movies by genre. Due to the api, these are updated daily and listed by popularity.
You can see the details of the movies by clicking on them.
In the genre movie section, you can click on the <b>"See More"</b> button to see more movies of that genre.


<div align="center" style="width:100%;display:flex;justify-content:space-between;">
<img width="32%" src="https://github.com/ekinutkuu/WatchList/blob/master/screenshots/home1.png" align="center" alt="screenshot" />
<img width="32%" src="https://github.com/ekinutkuu/WatchList/blob/master/screenshots/home2.png" align="center" alt="screenshot" />
</div>

## Movie Page

Clicking on the movies brings up this page. Here you can get more details about the movie. You can add it to your watchlist or your bookmarks.
When adding movies to your watchlist, you need to select the status of the movie.


<div align="center" style="width:100%;display:flex;justify-content:space-between;">
<img width="32%" src="https://github.com/ekinutkuu/WatchList/blob/master/screenshots/moviePage1.png" align="center" alt="screenshot" />
<img width="32%" src="https://github.com/ekinutkuu/WatchList/blob/master/screenshots/moviePage2.png" align="center" alt="screenshot" />
</div>

## Watch List

Here you can see the movies you have added to your watchlist. Movies that are currently watching are listed with green, completed movies with blue, on hold movies with yellow, dropped movies with red, and movies that you are planning to watch with gray.
You can change the status of the movies by pressing the <b>"Edit"</b> button

<div align="center" style="width:100%;display:flex;justify-content:space-between;">
<img width="32%" src="https://github.com/ekinutkuu/WatchList/blob/master/screenshots/watchList2.png" align="center" alt="screenshot" />
<img width="32%" src="https://github.com/ekinutkuu/WatchList/blob/master/screenshots/watchList1.png" align="center" alt="screenshot" />
</div>

## Bookmarks

Here you can view the movies you have added to your bookmarks. If there is a movie you want to delete from the list, just press and hold on it and confirm!

<div align="center" style="width:100%;display:flex;justify-content:space-between;">
<img width="32%" src="https://github.com/ekinutkuu/WatchList/blob/master/screenshots/bookmarks1.png" align="center" alt="screenshot" />
</div>