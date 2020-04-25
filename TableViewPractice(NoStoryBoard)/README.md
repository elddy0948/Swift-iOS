#  TableView without Story Board

- Kingfisher
- WebKit
- Sean Allen의 TableView https://www.youtube.com/watch?v=bXHinfFMkFw
- 유튜브 영상을 불러오는 방법을 참고 [https://yagom.net/forums/topic/youtube-%ec%98%81%ec%83%81-%eb%b6%88%eb%9f%ac%ec%98%a4%ea%b8%b0/](https://yagom.net/forums/topic/youtube-영상-불러오기/)
- WkWebView 참조 https://medium.com/better-programming/create-a-wkwebview-programmatically-in-swift-5-fc08c8ad8708

# 화면

![1](TableViewPractice(NoStoryBoard)/1.png)
![2](TableViewPractice(NoStoryBoard)/2.png)

### SceneDelegate.swift (no Story Board setup)

```swift
let navController = UINavigationController(rootViewController: VideoListVC())
        navController.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
```

