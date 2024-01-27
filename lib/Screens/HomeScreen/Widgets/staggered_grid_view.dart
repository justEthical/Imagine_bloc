import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:imagine_bloc/Models/image_model.dart';
import 'package:imagine_bloc/Screens/ImageDetails/image_detail.dart';

class StaggeredGridView extends StatelessWidget {
  final List<ImageModel> listOfImages;
  const StaggeredGridView({super.key, required this.listOfImages});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width / 200).round(),
        ),
        itemCount: listOfImages.length,
        itemBuilder: (ctx, i) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => ImageDetail(
                              imageModel: listOfImages[i],
                            )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: listOfImages[i].url.thumb,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      AspectRatio(
                          aspectRatio:
                              listOfImages[i].width / listOfImages[i].height,
                          child: BlurHash(hash: listOfImages[i].blurHash)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ));
  }
}
