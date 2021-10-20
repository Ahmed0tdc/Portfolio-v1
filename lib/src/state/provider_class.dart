import 'package:flutter/material.dart';


class ProviderClass extends ChangeNotifier{

  final ScrollController _scrollController = ScrollController();
  ScrollController get getScrollController => _scrollController;
  void listenToScrollChanges(){
    _scrollController.addListener(() {
      notifyListeners();
    });
  }
  void disposeOfScrollController(){
    _scrollController.dispose();
    notifyListeners();
  }


  final PageController _pageController = PageController();
  PageController get getPageController => _pageController;
  void disposeOfPageController(){
    _pageController.dispose();
    notifyListeners();
  }



  bool _disposed = false;
  
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if(!_disposed) super.notifyListeners();
  }
}