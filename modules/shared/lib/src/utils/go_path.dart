class GoPath {
  final GoPath? root;
  final String path;
  final String name;

  const GoPath({required this.path, required this.name, this.root});

  GoPath withPathParamsMap(Map<String, dynamic> params) {
    assert(params.isNotEmpty, 'The params map must not be empty');

    assert(
      path.contains(RegExp(r':\w+')),
      'The path $path must contain at least one path parameter',
    );

    final completePathSegments = Uri.parse(path).pathSegments;
    final pathParams = completePathSegments
        .where((e) => e.startsWith(':'))
        .map((e) => e.replaceFirst(':', ''))
        .toList();

    assert(
      pathParams.length == params.length,
      'The number of path parameters must match the number of params in the map',
    );

    assert(
      pathParams.every(params.keys.contains),
      'The params ${params.keys} must be defined in the path: $path',
    );

    final pathWithParams = completePathSegments
        .map((e) {
          if (e.startsWith(':')) {
            final key = e.replaceFirst(':', '');
            return '${params[key]}';
          }
          return e;
        })
        .join('/');

    return GoPath(root: root, path: '/$pathWithParams', name: name);
  }

  GoPath withQueryParamsMap(Map<String, dynamic> params) {
    assert(params.isNotEmpty, 'The params map must not be empty');

    assert(
      params.values.every((v) => v is String? || v is Iterable<String>),
      'All values in params must be of type String? or Iterable<String>',
    );

    final uri = Uri(path: completePath, queryParameters: params);
    return GoPath(root: null, path: uri.toString(), name: name);
  }

  String get completePath {
    final base = root?.completePath ?? '';
    return '$base${!base.endsWith('/') ? path : path.replaceFirst('/', '')}';
  }
}
