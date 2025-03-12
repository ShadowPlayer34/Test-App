# Conference Viewer App

The **Conference Viewer** app allows users to view details about upcoming conferences, including information such as the conference name, dates, location, categories, and type. The app fetches conference data from an API and presents it in an easy-to-read format. Users can also view the duration of the conference in days.

## Features

- **Conference List**: View a list of upcoming conferences, sorted by date.
- **Conference Details**: Tap on a conference to view detailed information, such as name, location, and duration.
- **Duration Calculation**: Displays the duration of the conference in days (e.g., "2 дня").
- **Error Handling**: If data fails to load, a message will be displayed.

## Requirements

- **iOS 16.0+** for running the app.
- **Swift 5.0+** for the source code.

## Setup

1. Clone the repository:
    ```bash
    git clone https://github.com/ShadowPlayer34/Test-App.git
    ```

2. Open the project in Xcode:
    ```bash
    open TestTask.xcodeproj
    ```

3. Build and run the app on the simulator or a physical device.

## App Flow

### Main Screen

- The main screen lists all conferences with the name, dates, and locations.
- Tapping a conference navigates to the detailed conference view, showing more information such as the start date, categories, and a description.
- A duration string, e.g., "2 дня," is calculated based on the conference's start and end date.

### Conference Details Screen

- This screen shows detailed information about the selected conference, including:
    - Conference name.
    - Start date.
    - Categories.
    - Description.
    - Duration (calculated in days between start and end date).
    - Location (country and city).

### Error Handling

- If the conference data cannot be loaded, the app will display a message (e.g., "Что-то пошло не так.").

## How it Works

1. The app fetches conference data from an API using `APIService`.
2. The data is parsed and displayed in a list using SwiftUI.
3. The `EventDetailsViewModel` calculates the duration in days between the start and end date of the conference.
4. The duration is displayed in the correct plural form (in Russian, e.g., "1 день", "2 дня", "5 дней").

## Screenshots

<img src="https://github.com/user-attachments/assets/0d3526a5-eac5-40e2-9f5f-3bbd3a7dec16" width="300">
<img src="https://github.com/user-attachments/assets/6ac34cca-74ce-4fc6-8371-42d9c0f3f4b5" width="300">


## Customization

You can customize the following features in the app:

- **API Service**: Modify the API URL and the way data is fetched from the backend.
- **UI Components**: The app uses SwiftUI for building views. Feel free to modify the components such as `ConferenceElementView`, `EventDetailsView`, and `ConferencesListView` to better suit your design needs.
