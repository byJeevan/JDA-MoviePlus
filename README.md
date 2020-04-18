# MoviePlus
SwiftUI+MVVM with Clean Swift 


Take away points :  
1. Login Page - 
- View Model class :
Is subclass of ObservableObject
@Published objects defined in VM are used for binding

- View class : 
@ObservedObject is the ViewModel instance 
 Using Binding<T> variables will be injected UI elements value
