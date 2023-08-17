abstract class BaseViewModel extends BaseViewModelInputs
    implements BaseViewModelOutputs {
  // *shared variable and function that will be used through any view model.
}

abstract class BaseViewModelInputs {
  void start(); // * start view model job.

  void dispose(); // * will be called when view model dies.
}

abstract class BaseViewModelOutputs {
  // ? will be  implemented late
}
