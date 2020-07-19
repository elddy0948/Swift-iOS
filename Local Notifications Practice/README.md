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


