# WatchFaces

Staging project for various screens and features to be included in Phlex Swim Apple Watch Application.

## Main Workout Face
![Main Dashboard View](https://github.com/rrosenbaum4310/WatchFaces/blob/main/DashboardView.jpg)

## 3 Minute Test

This is a staging view that implements Lottie animation for the watch to guide the user through an initial fitness test.

The 3 minute test will
- Introduce user to the test set concept
- Run them through a **5 minute warmup**
- Prompt them just before the 3 minute test
- Run them through a **3 minute test set** and allow them to **manually end it, but notify them once 3 minutes hits**(they will need to reach the next wall and end the workout on their own).
- Congratulations view should also do the background processing and logging of the users test set and confirm that it was communicated.

## TimerView

Staging this for a TimerManager combine class that can control the time & limited relative healthkit recording properties for a user to do the 3 minute test (above).
