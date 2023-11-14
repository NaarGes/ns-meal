enum Pages {
  home,
  meals,
  notFound,
}

extension PagesX on Pages {
  String get toPath {
    switch (this) {
      case Pages.home:
        return '/';
      case Pages.meals:
        return '/meals';
      case Pages.notFound:
      default:
        return '/not-found';
    }
  }

  String get toTitle {
    switch (this) {
      case Pages.home:
        return 'Home';
      case Pages.meals:
        return 'Meals';
      case Pages.notFound:
      default:
        return 'Not Found';
    }
  }
}