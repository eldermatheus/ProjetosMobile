part of '../animal_info.dart';

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
        SizedBox(height: 10),
        if (children != null) ...children!
      ],
    );
  }
}

class _AnimalAbout extends StatelessWidget {
  final Animal animal;

  const _AnimalAbout(this.animal);

  @override
  Widget build(BuildContext context) {
    final slideController = AnimalInfoStateProvider.of(context).slideController;

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
      child: Column(
        children: <Widget>[
          SizedBox(height: 24),
          _buildAnimal(),
        ],
      ),
    );
  }

  Widget _buildAnimal() {
    return _ContentSection(
      label: 'Classificação no sistema hierárquico de táxons',
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: _Label('Reino:')),
              Expanded(flex: 2, child: Text('${animal.kingdom}')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: _Label('Filo:')),
              Expanded(flex: 2, child: Text('${animal.phylum}')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: _Label('Classe:')),
              Expanded(flex: 2, child: Text('${animal.classe}')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: _Label('Ordem:')),
              Expanded(flex: 2, child: Text('${animal.order}')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: _Label('Subordem:')),
              Expanded(flex: 2, child: Text('${animal.suborder}')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: _Label('Família:')),
              Expanded(flex: 2, child: Text('${animal.family}')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: _Label('Gênero:')),
              Expanded(flex: 2, child: Text('${animal.genus}')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: _Label('Espécie:')),
              Expanded(
                  flex: 2,
                  child: Text(
                    '${animal.scientificName}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
