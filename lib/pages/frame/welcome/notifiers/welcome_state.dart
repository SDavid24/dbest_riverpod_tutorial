part of 'welcome_notifier.dart';

class WelcomeState extends Equatable{
  const WelcomeState({
    this.page = 0,
  });

  final int page; //Tracks which page the screen is on

  //This method is used to create a copy of the current WelcomeState instance with updated properties.
  // It takes an optional named parameter page.
  WelcomeState copyWith({
    int? page,
  }) {
    return WelcomeState(
      page: page ?? this.page,
    );
  }

  //This getter is overridden from the Equatable class. It returns a list of properties
  // that will be used to determine whether two instances of WelcomeState are equal.
  @override
  List<Object> get props => [page];

}