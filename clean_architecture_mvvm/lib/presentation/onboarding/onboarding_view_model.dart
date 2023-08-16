import 'dart:async';

import 'package:clean_architecture_mvvm/domain/model.dart';
import 'package:clean_architecture_mvvm/presentation/base/base_view_model.dart';
import 'package:clean_architecture_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_mvvm/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs{

final StreamController _streamController = StreamController<SlideViewObject>();

late final List<SliderObject> _list ;
int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }
  
  @override
  void goNext() {
    int nextIndex = _currentIndex ++; // -1
  if(nextIndex == _list.length){
    _currentIndex = 0; // infinete loop to go to the length of slider list
  }
  _postDataToView();
  }
  
  @override
  void goPrevious() {
    int proviousIndex = _currentIndex --; // -1
  if(proviousIndex == -1){
    _currentIndex = _list.length -1; // infinete loop to go to the length of slider list
  }
  _postDataToView();
  }
  
  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }
  
  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;
  
  @override
  
  Stream<SlideViewObject> get outputSliderViewObject => _streamController.stream.map((slideViewObject) => slideViewObject);

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingTitle4, ImageAssets.onboardingLogo4),
      ];
      _postDataToView(){
        inputSliderViewObject.add(SlideViewObject(_list[_currentIndex], _list.length, _currentIndex));
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