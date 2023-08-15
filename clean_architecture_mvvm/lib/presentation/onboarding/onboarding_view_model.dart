import 'dart:async';

import 'package:clean_architecture_mvvm/domain/model.dart';
import 'package:clean_architecture_mvvm/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs{

final StreamController _streamController = StreamController<SlideViewObject>();
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }
  
  @override
  void goNext() {
    // TODO: implement goNext
  }
  
  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }
  
  @override
  void onPageChanged(int Index) {
    // TODO: implement onPageChanged
  }
}

abstract class OnBoardingViewModelInputs{
  void goNext();
  void goPrevious();
  void onPageChanged(int Index);
  
  Sink get inputSliderViewObject;
} 

abstract class OnBoardingViewModelOutputs{
  Stream<SlideViewObject> get  outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int  numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject,this.numOfSlides, this.currentIndex);
}