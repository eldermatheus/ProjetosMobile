part of '../pokemon_info.dart';

class _Label extends Text {
  _Label(String text)
      : super(
          text,
          style: TextStyle(
            color: AppColors.black.withOpacity(0.6),
            height: 0.8,
          ),
        );
}

class _ContentSection extends StatelessWidget {
  final String label;
  final List<Widget>? children;

  const _ContentSection({
    Key? key,
    required this.label,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(height: 0.8, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 22),
        if (children != null) ...children!
      ],
    );
  }
}

class _TextIcon extends StatelessWidget {
  final ImageProvider icon;
  final String text;

  const _TextIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: icon, width: 12, height: 12),
        SizedBox(width: 4),
        Text(text, style: TextStyle(height: 0.8)),
      ],
    );
  }
}

class _PokemonAbout extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonAbout(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final slideController = PokemonInfoStateProvider.of(context).slideController;

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: TextStyle(height: 1.3),
    );
  }

  Widget _buildHeightWeight(String height, String weight) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: Offset(0, 8),
            blurRadius: 23,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Label('Height'),
                SizedBox(height: 11),
                Text('${height}', style: TextStyle(height: 0.8))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Label('Weight'),
                SizedBox(height: 11),
                Text('${weight}', style: TextStyle(height: 0.8))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTraining(double baseExp) {
    return _ContentSection(
      label: 'Training',
      children: [
        Row(
          children: <Widget>[
            Expanded(flex: 1, child: _Label('Base EXP')),
            Expanded(flex: 3, child: Text('${baseExp}')),
          ],
        ),
      ],
    );
  }
}
