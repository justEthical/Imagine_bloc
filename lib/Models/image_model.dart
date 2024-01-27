class ImageModel {
  final String id;
  final String description;
  final int likes;
  final String blurHash;
  final ImageUrls url;
  final double width;
  final double height;

  ImageModel(
      {required this.id,
      required this.description,
      required this.likes,
      required this.blurHash,
      required this.url,
      required this.height,
      required this.width});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as String,
      description: json['description'] ?? "",
      blurHash: json['blur_hash'] ?? "",
      width: json['width'] * 1.0,
      height: json['height'] * 1.0,
      likes: json['likes'] as int,
      url: ImageUrls.fromJson(json['urls'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'likes': likes,
      'blur_hash': blurHash,
      'height': height,
      'width': width,
      'url': url.toJson(),
    };
  }
}

class ImageUrls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  ImageUrls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory ImageUrls.fromJson(Map<String, dynamic> json) {
    return ImageUrls(
      raw: json['raw'] as String,
      full: json['full'] as String,
      regular: json['regular'] as String,
      small: json['small'] as String,
      thumb: json['thumb'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'raw': raw,
      'full': full,
      'regular': regular,
      'small': small,
      'thumb': thumb,
    };
  }
}
