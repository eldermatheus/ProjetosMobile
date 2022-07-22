import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:animaldex/configs/images.dart';
import 'package:animaldex/domain/entities/animal.dart';

class AnimalImage extends StatelessWidget {
  static const Size _cacheMaxSize = Size(700, 700);

  final Animal animal;
  final EdgeInsets padding;
  final bool useHero;
  final Size size;
  final ImageProvider placeholder;
  final Color? tintColor;

  const AnimalImage({
    Key? key,
    required this.animal,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.useHero = true,
    this.placeholder = AppImages.load,
    this.tintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: animal.imageUrl,
        child: AnimatedPadding(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeOutQuint,
          padding: padding,
          child: CachedNetworkImage(
            imageUrl: animal.imageUrl,
            imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
            useOldImageOnUrlChange: true,
            maxWidthDiskCache: _cacheMaxSize.width.toInt(),
            maxHeightDiskCache: _cacheMaxSize.height.toInt(),
            fadeInDuration: Duration(milliseconds: 120),
            fadeOutDuration: Duration(milliseconds: 120),
            imageBuilder: (_, image) => Image(
              image: image,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: tintColor,
              fit: BoxFit.contain,
            ),
            placeholder: (_, __) => Image(
              image: placeholder,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: Colors.black12,
              fit: BoxFit.contain,
            ),
            errorWidget: (_, __, ___) => Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: placeholder,
                  width: size.width,
                  height: size.height,
                  color: Colors.black12,
                ),
                Icon(
                  Icons.warning_amber_rounded,
                  size: size.width * 0.3,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
