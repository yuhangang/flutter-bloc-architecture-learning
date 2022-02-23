import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';
const thumbNailUrl = 'https://image.tmdb.org/t/p/w500';
const originalImgUrl = 'https://image.tmdb.org/t/p/original';

abstract class MyImageBuilder {
  static Widget buildThumbNail(String? url, {bool original = false}) {

    var url2 = url!=null? thumbNailUrl + url:"";
    var url3 = url!=null? originalImgUrl + url:"";
  
    return original
        ? Stack(
            fit: StackFit.expand,
            children: [
              FadeInImage(
                placeholder: const AssetImage('assets/film_icon.png'),
                image: NetworkImage(url2),
                fit: BoxFit.cover,
              ),
             if (url3.isNotEmpty) MyCachedNetworkImage(imageUrl: url3),
            ],
          )
        : Stack(
            fit: StackFit.expand,
            children: [
             
                       if (url3.isNotEmpty)      MyCachedNetworkImage(imageUrl: url3),
            ],
          );
  }
}

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

class TransparentImage {
  static Uint8List get tranparentImage => kTransparentImage;
}


class MyCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool hasBorderRadius;
  final double? borderRadiusValue;
  final String? loadingImage;
  final String? errorImage;

  const MyCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.hasBorderRadius = true,
    this.borderRadiusValue,
    this.loadingImage,
    this.errorImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
          hasBorderRadius ? (borderRadiusValue ?? 10) : 0),
      child: CachedNetworkImage(
        height: height,
        width: double.infinity,
        fit: fit ?? BoxFit.cover,
        imageUrl: imageUrl ?? "",
        placeholder: (context, url) => Image.asset(
          loadingImage ?? 'assets/film_icon.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: height,
        ),
        errorWidget: (context, url, error) => Image.asset(
          errorImage ?? 'assets/film_icon.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: height,
        ),
      ),
    );
  }
}
