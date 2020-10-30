import Cocoa
import Foundation

let sharedSession = URLSession.shared
sharedSession.configuration.allowsCellularAccess    // true
sharedSession.configuration.allowsCellularAccess = false
sharedSession.configuration.allowsCellularAccess    // true

let myDefaultConfiguration = URLSessionConfiguration.default
let eConfig = URLSessionConfiguration.ephemeral
let bConfig = URLSessionConfiguration.background(withIdentifier: "com.raywenderlich.com.sessions")

myDefaultConfiguration.allowsCellularAccess = false
myDefaultConfiguration.allowsCellularAccess //false

myDefaultConfiguration.allowsExpensiveNetworkAccess = true
myDefaultConfiguration.allowsConstrainedNetworkAccess = true

let myDefaultSession = URLSession(configuration: myDefaultConfiguration)
myDefaultSession.configuration.allowsConstrainedNetworkAccess   //true

let defaultSession = URLSession(configuration: .default)
defaultSession.configuration.allowsCellularAccess   //true
