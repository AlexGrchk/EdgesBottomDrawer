# EdgesBottomDrawer

This package will help you to add cool Bottom drawer view to your application

![trim 2EF75B39-9A21-4090-AAC1-71009F865615](https://user-images.githubusercontent.com/33230460/233499159-35cf118c-d74a-417b-ad37-58bcf107b7d8.gif)

### Installation
#### Swift Package Manager
- File > Swift Packages > Add Package Dependency
- Add `https://github.com/AlexMochalov/EdgesBottomDrawer.git`
- Select "Up to Next Major" with "0.0.2"

### Usage
```swift
import EdgesBottomDrawer

```

```swift
struct ContentView: View {
    var body: some View {
        //Main content
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .bottomDrawerView( // EdgesBottomDrawer
            bottomDrawerHeight: 80, /* Drawer height when closed*/
            drawerTopCornerRadius: 32 /*Top corners radius*/) {
                // Drawer content
                ZStack {
                    Color.black
                    Text("Hello Drawer")
                        .font(.system(size: 24))
                        .foregroundColor(Color.white)
                }
            } pullUpView: { shouldGoUp in
                // Drawer pull up view
                ZStack {
                    Color.black
                    if shouldGoUp {
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.white)
                    } else {
                        Image(systemName: "chevron.up")
                            .foregroundColor(Color.white)
                    }
                }
            }
    }
}
```
#### Parameters for `.bottomDrawerView()`
- `bottomDrawerHeight` - drawer height when it's closed
- `drawerTopCornerRadius` - drawer top corners radius
- `drawerContent` - Content of the drawer that will be presented if user pulls drawer up
- `pullUpView` - View that user should pull to open/close bottom drawer

![Image_21 04 2023_at_0 00](https://user-images.githubusercontent.com/33230460/233498355-a03d6d54-46b1-45f3-864f-15b14e62cfe9.png)

