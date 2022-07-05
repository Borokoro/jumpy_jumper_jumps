import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'PlayerComponent.dart';

class Platform extends SpriteComponent with HasHitboxes, Collidable, HasGameRef<MainGame>{

  Platform({
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }): super(position: position,sprite: sprite,size: size);

  @override
  void onMount() {
    final shape=HitboxRectangle();
    addHitbox(shape);
    super.onMount();
  }
  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if(other is PlayerComponent){
      FlameAudio.play('jumping.mp3');
    }
    super.onCollision(intersectionPoints, other);
  }
}
