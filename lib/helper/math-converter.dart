class MathConverter{

  static int intToHundred(int value){
    return value + (100 - value % 100);
}
}