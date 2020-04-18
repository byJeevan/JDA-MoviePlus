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

-RootView :
Keep track of current page and passes to ViewRouter to display

-ViewRouter :
Implements Swift Combine (PassthroughSubject) where it notifies RootView whenever a new page ID assigned to current page ID.

2. MovieList Page
- Will show list of Movies in Grid format. 
