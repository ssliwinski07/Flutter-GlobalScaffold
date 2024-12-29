# flutter_toast_message

Standard increase counter app to show the example of displaying messages after event occurs - in that case after trying to increase the counter value.

1. Used pacakges:
   - get_it - service locator - class `ServiceLocator`
   - fluttertoast - for sending simple messages (notifications for users) through the app. Passing BuildContext is not required. Have a look at the class `MessageServiceMain`.
  
Additional notes:
1. I've written a custom class `FutureTracker` to track the status of future function and to display proper message after future completes.
2. I've written a method `showMessage()` inside MessageServiceMain class, that uses SnackBar to display message as an alternative for fluttertoast. Thanks to global key, passing BuildContext is also not required as in `Fluttertoast` class
