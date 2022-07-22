part of '../animal_info.dart';

class Stat extends StatelessWidget {
  final Animation animation;
  final String label;
  final double? progress;
  final num value;

  const Stat({
    required this.animation,
    required this.label,
    required this.value,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(color: AppColors.black.withOpacity(0.6)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text('$value'),
        ),
        Expanded(
          flex: 5,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, widget) {
              final currentProgress = progress ?? value / 100;

              return ProgressBar(
                progress: animation.value * currentProgress,
                color: currentProgress < 0.5 ? AppColors.red : AppColors.teal,
                enableAnimation: animation.value == 1,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AnimalBaseStats extends StatefulWidget {
  final Animal animal;

  const _AnimalBaseStats(this.animal);

  @override
  State<_AnimalBaseStats> createState() => _AnimalBaseStatsState();
}

class _AnimalBaseStatsState extends State<_AnimalBaseStats> with SingleTickerProviderStateMixin {
  late Animation<double> _progressAnimation;
  late AnimationController _progressController;

  Animal get animal => widget.animal;

  AnimationController get slideController => AnimalInfoStateProvider.of(context).slideController;

  @override
  void initState() {
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _progressController,
    ));

    _progressController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _progressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.all(24),
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 27),
          _buildDistribuicao(),
        ],
      ),
    );
  }

  Widget _buildDistribuicao() {
    return _ContentSection(
      label: 'Países e regiões de ocorrência',
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(flex: 2, child: Text('${animal.geographicDistribution}')),
            ],
          ),
        ),
      ],
    );
  }
}
