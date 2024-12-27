# FriendsFace

FriendsFace is a SwiftUI application that demonstrates fetching, decoding, displaying, and storing user data. The app showcases key iOS development principles such as working with `URLSession`, `Codable`, navigation, and offline persistence using `SwiftData`. This challenge was part of the 100 Days of SwiftUI curriculum and is divided into two phases.

---

## Challenge Overview

### Phase 1: Fetch and Display Data

In the first phase, the goal was to fetch JSON data from the provided URL, decode it into Swift types, and display it using SwiftUI components. Key tasks included:

1. **Fetching JSON Data**: Download data using `URLSession` from the endpoint:

   ```
   https://www.hackingwithswift.com/samples/friendface.json
   ```

2. **Decoding JSON**: Parse the data into `User` and `Friend` models using `Codable`.
3. **Displaying Data**:
   - Show a list of users with their names and active status.
   - Create a detail view for each user, showing their age, email, company, address, about section, tags, and friends.

### Phase 2: Integrate SwiftData

The second phase introduced offline persistence using SwiftData. The app was updated to:

1. **Migrate Models**: Convert `User` and `Friend` models into `@Model` classes conforming to `Codable`.
2. **Add Offline Support**: Use SwiftData to store and query user data locally, ensuring that data is only fetched from the network if the local cache is empty.

---

## Features

### 1. User List

- **NavigationStack**: Allows navigation between a list and detail view.
- **List with Rows**: Displays user name and active status using color-coded icons.

### 2. User Detail View

- **Organized Information**: Displays user details in categorized sections:
  - Basic Information (age, email, company).
  - Address.
  - About Section.
  - Friends and Tags.

### 3. Offline Support with SwiftData
- Data is saved locally using SwiftData, enabling the app to function without an internet connection after the initial fetch.

---

## Implementation Highlights

### Data Models

- **`User`**: Represents individual users, including their friends and other details.
- **`Friend`**: Represents friends with a unique ID and name.
- Both models are `@Model` classes, supporting SwiftData and custom Codable implementations.

### SwiftUI Components

- **`ContentView`**: Displays a list of users and navigates to a detail view.
- **`DetailView`**: Shows detailed information about a selected user.

### Networking

- **Fetching Data**: `fetchUsers()` method fetches JSON data, decodes it, and inserts it into the SwiftData model context.

### SwiftData Integration

- The app leverages `@Query` to fetch and display users stored in the SwiftData database.
- Local caching ensures minimal network usage.

---

## File Structure

1. **ContentView.swift**: The main view displaying the user list and handling navigation.
2. **DetailView.swift**: A detailed view showing user information.
3. **User.swift**: The `@Model` class for user data.
4. **Friend.swift**: The `@Model` class for friend data.
5. **FriendsFaceApp.swift**: The app entry point, setting up the SwiftData container.
6. **Preview Content**: Contains test data for previewing views during development.

---

## Commit History

### Phase 1: Fetch and Display Data

- `6d4558d`: Fetch the users data.
- `9a30440`: Show the list of users.
- `53ce2b3`: Extract row into a subview.
- `0be0147`: Navigate to a selected user.
- `5b71298`: Show the user data on the detail view.

### Phase 2: Integrate SwiftData

- `f1263e0`: Migrate `User` and `Friend` models to SwiftData models.
- `e0f8a1d`: Connect the SwiftData container to the app.
- `510fad9`: Query the users using SwiftData.

---

## Usage

1. Run the app to view the user list fetched from the network or loaded from the local SwiftData cache.
2. Tap on a user to view detailed information about them.
3. The app requires an initial network fetch to populate the local cache.

---

## Future Enhancements

- Add a search bar for filtering users.
- Support additional sorting options for the user list.
- Optimize performance for larger datasets.

---

## Credits

Challenge from [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui), authored by Paul Hudson.
