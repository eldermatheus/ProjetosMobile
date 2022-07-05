import 'package:flutter/cupertino.dart';
import 'package:animaldex/configs/images.dart';

class AnimalRefreshControl extends StatelessWidget {
  final Future<void> Function() onRefresh;

  const AnimalRefreshControl({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      builder: (_, __, ___, ____, _____) => Image(
        image: AppImages.load,
      ),
    );
  }
}
