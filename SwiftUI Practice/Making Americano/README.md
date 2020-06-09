#  Slider and Stepper


Using State (Binding)

````

@State private var orderCount = 0
@State private var waterPercent = 0.0

````

````

Slider(value: $waterPercent)

Stepper("How many?", value: $orderCount)

````

![OrderCoffee](https://user-images.githubusercontent.com/40102795/84166652-229e7f00-aab0-11ea-819b-d4182aa704dd.png)
