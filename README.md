# flutter_toast_message

Standard increase counter app to show the example of displaying toast messages. In that case toast message (success/failure) will show up after clicking on "+" button on the main screen.

1. Used pacakges:
   - get_it - service locator - class `ServiceLocator`
   - fluttertoast - for displaying simple toast messages all around the app. Have a look at the class `MessageServiceMain`.
   - mobx & provider - simple app state management - class `CounterStore`
  
Additional notes:
1. I've written a custom class `FutureTracker` to track the status of future function and to display proper toast message after future completes.
2. Converted `MyHomePage` widget to Stateless widget as there's no need to use Stateful widget (thanks to mobx).
3. Tapping on notification will remove it.
