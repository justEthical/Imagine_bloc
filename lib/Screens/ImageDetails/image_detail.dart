import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:imagine_bloc/Models/image_model.dart';

class ImageDetail extends StatelessWidget {
  final ImageModel imageModel;
  const ImageDetail({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image details')),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: CachedNetworkImage(
              imageUrl: imageModel.url.raw,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                children: [Text(imageModel.description)],
              ))
        ],
      ),
    );
  }
}
