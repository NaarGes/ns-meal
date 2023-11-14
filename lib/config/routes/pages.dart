enum Pages {
  home,
  notFound,
}

extension PagesX on Pages {
  String get toPath {
    switch (this) {
      case Pages.home:
        return '/';
      case Pages.notFound:
      default:
        return '/not-found';
    }
  }

  String get toTitle {
    switch (this) {
      case Pages.home:
        return 'Home';
      case Pages.notFound:
      default:
        return 'Not Found';
    }
  }
}