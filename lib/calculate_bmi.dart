import 'dart:math';

class CalculateBMI{

  CalculateBMI({this.weight,this.height});
  final int? height;
  final int? weight;
  double bmi=0.0;

  String calculate(){
    bmi=(weight!/pow(height!/100, 2))!;
    return bmi.toStringAsFixed(1);
  }
  String getResult(){

    if(bmi>25){
      return "Overweight";
    }else if(bmi>18.5){
      return "Normal";
    }else {
      return "Underweight";
    }
  }
}