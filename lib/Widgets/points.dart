import 'package:collection/collection.dart';
class APoints{

  final double x;
  final double y;
  APoints({
    required this.x,required this.y
});


}

List<APoints>get Apoints{
final data = <double> [2,4,6,11,3,6,4];
return data.mapIndexed((index, element) => APoints(x: index.toDouble(), y: element)).toList();
}
