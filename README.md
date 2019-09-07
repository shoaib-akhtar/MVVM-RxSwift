# Advantages
# Observers and Observable
With the help of RxSwift Multiple observers can listen to single observable and when a single observable get changed all the observers get
notified. It can be useful if any cases i-e a viewcontroller have multiple child viewcontroller and we want to transmit a change to all child viewcontroller. Conventionally we have to use delegates or blocks which is a lot of boilerplate code. 

# Reactive programming
Using RxSwift we don't need to tell view using delegates about the change and reload views. Reactive pattern reduces boilerplate code.

# Disadvantage
I have observed in the instruments that there are many memory leaks in the RxSwift framework. 
