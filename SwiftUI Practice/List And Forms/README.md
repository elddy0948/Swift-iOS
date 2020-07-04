#  List & Forms


````
NavigationView {
    Form {
````

````
Section {
    Picker (selection: $selectedSnackIndex, label: Text("Snack Type")) {
        ForEach(0..<5) {
            Text("\($0)")
        }
    }
}
````


````

Section {
    Toggle(isOn: $isOn) {
        Text("Toggle!")
    }
}

````


````
Section {
    TextField("AnyThing Else?", text: $anythingElse)
}

````


![Simulator Screen Shot - iPhone SE (2nd generation) - 2020-07-05 at 03 22 23](https://user-images.githubusercontent.com/40102795/86518804-35b62c00-be6f-11ea-911e-817231037507.png)

![Simulator Screen Shot - iPhone SE (2nd generation) - 2020-07-05 at 03 22 29](https://user-images.githubusercontent.com/40102795/86518808-39e24980-be6f-11ea-8692-d4556431c759.png)

![Simulator Screen Shot - iPhone SE (2nd generation) - 2020-07-05 at 03 22 38](https://user-images.githubusercontent.com/40102795/86518810-3c44a380-be6f-11ea-99f6-cab4f9fd8170.png)


