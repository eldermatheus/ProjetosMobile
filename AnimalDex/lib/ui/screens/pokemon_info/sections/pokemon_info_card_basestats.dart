part of '../pokemon_info.dart';

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

class _PokemonBaseStats extends StatefulWidget {
  final Pokemon pokemon;

  const _PokemonBaseStats(this.pokemon);

  @override
  State<_PokemonBaseStats> createState() => _PokemonBaseStatsState();
}

class _PokemonBaseStatsState extends State<_PokemonBaseStats> with SingleTickerProviderStateMixin {
  late Animation<double> _progressAnimation;
  late AnimationController _progressController;

  Pokemon get pokemon => widget.pokemon;

  AnimationController get slideController => PokemonInfoStateProvider.of(context).slideController;

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
          //buildStats(pokemon.stats),
          SizedBox(height: 27),
          Text(
            'Type defenses',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0.8,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'The effectiveness of each type on ${pokemon.name}.',
            style: TextStyle(color: AppColors.black.withOpacity(0.6)),
          ),
          SizedBox(height: 15),
          //_buildEffectivenesses(pokemon.typeEffectiveness),
        ],
      ),
    );
  }
}
