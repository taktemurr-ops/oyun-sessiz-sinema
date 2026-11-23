import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sessiz_sinema/oyun_sessiz_sinema.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sessizSinemaConfig.title.length, 33);
    expect(sessizSinemaConfig.tagline.length, 33);
    for (final s in sessizSinemaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sessizSinemaConfig.gameId, sessizSinemaId);
    expect(sessizSinemaRules.gameId, sessizSinemaId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sessizSinemaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sessizSinemaId, optionalMechanics: sessizSinemaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sessizSinemaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
