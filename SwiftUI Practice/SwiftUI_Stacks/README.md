#  <#Title#>

HStack
![HStack](https://user-images.githubusercontent.com/40102795/84114082-b0ee1300-aa66-11ea-9f74-9204e49eb755.png)

VStack
![VStack](https://user-images.githubusercontent.com/40102795/84114096-b77c8a80-aa66-11ea-8a4f-f319f8160b28.png)

ZStack
![ZStack](https://user-images.githubusercontent.com/40102795/84114105-bb101180-aa66-11ea-9b00-7f071718acc7.png)


````

ForEach(chelsea, id: \.self) {
    player in Image(player)
        .resizable()
        .aspectRatio(contentMode: .fit)
    
}

````
