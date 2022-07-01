enum NetWorkRoutes { TOKEN}

extension NetworkRoutesString on NetWorkRoutes {
  String get value {
    switch (this) {
      case NetWorkRoutes.TOKEN:
        return 'token';
  
      default:
        throw Exception('Route not found');
    }
  }
}
