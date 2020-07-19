#  Local Notification Practice


````
import UserNotifications
````

Step 1 . Ask the user for Permission

````
let center = UNUserNotificationCenter.current()

center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
    
}
````

Step 2 . Create the notification content

````
let content = UNMutableNotificationContent()
content.title = "This is title"
content.body = "Hello!"
````

Step 3 . Create the trigger 


````
let date = Date().addingTimeInterval(5)
let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
````

Step 4 . Create Request

````
let uuidString = UUID().uuidString
let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
````

Step 5 . Register with notification Center


````
center.add(request) { (error) in
    //Check the error Parameter
    
}
````

![Simulator Screen Shot - iPhone SE (2nd generation) - 2020-07-19 at 16 51 17](https://user-images.githubusercontent.com/40102795/87870292-69ea2a80-c9e1-11ea-8a07-2dd3a0ef320b.png)

![Simulator Screen Shot - iPhone SE (2nd generation) - 2020-07-19 at 16 57 50](https://user-images.githubusercontent.com/40102795/87870295-6b1b5780-c9e1-11ea-967a-56b73dd6b230.png)

