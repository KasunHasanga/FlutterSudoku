import 'package:sudoku_puzzle/views/block_char.dart';

class BoxInner{
  late int index;
  List<BlockChar> blockChars =List<BlockChar>.from([]);

  BoxInner(this.index,this.blockChars);

  //declare method use
setFocus(int index, Direction direction){
  List<BlockChar> temp;
  if(direction ==Direction.horizontal){
    temp =blockChars.where((element) => element.index! ~/ 3 ==index ~/3).toList();
  }else{
    temp =blockChars.where((element) => element.index! % 3 ==index %3).toList();
  }

  temp.forEach((element) {
    element.isFocus =true;
  });


}

  setExistValue(int index,int indexBox,String textInput,Direction direction){
  List<BlockChar> temp;
  if(direction ==Direction.horizontal){
    temp =blockChars.where((element) => element.index! ~/ 3 ==index ~/3).toList();
  }else{
    temp =blockChars.where((element) => element.index! % 3 ==index %3).toList();
  }
  
  if (this.index ==indexBox){
    List<BlockChar> blockCharsBox =blockChars.where((element) => element.text==textInput).toList();
    
    if(blockCharsBox.length==1 && temp.isEmpty) blockCharsBox.clear();
    
    temp.addAll(blockCharsBox);
  }
  temp.where((element) => element.text==textInput).forEach((element) {
    element.isExist =false;
  });
  }

  clearFocus() {
    blockChars.forEach((element) {
      element.isFocus = false;
    });
  }

  clearExist() {
    blockChars.forEach((element) {
      element.isExist = false;
    });
  }
  }



enum Direction {horizontal,vertical}