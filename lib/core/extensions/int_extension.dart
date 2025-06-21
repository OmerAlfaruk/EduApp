extension IntExt on int{
  String get estimate{
    if(this<=10)return '$this';
    var data=this-(this%10);
    return 'over $data';
  }
}