#  난임 관리 파트너 Hugg iOS Application


## Study
- [x] @State & Binding
- [ ] jwt with SwiftUI
- [x] http connection (Client)
- [x] cocoapods

## Todo
### chore
- [x] app icon setting

### feature
- [x] home screen UI
- [ ] add assets (daily hugg)
- [ ] 마이페이지 파생 스크린 UI 작업
- [ ] base API DTO 작업

#### Sign up
- [ ] clipboard with toast

- [ ] Implement WebService layer (repository)
- [ ] Connect SignIn API
- [ ] Implement Apple Login
- [ ] Implement Calendar view
- [ ] Implement popup system (toast...)

## Done
### chore
- [x] github 연동 

### feature
- [x] Add animation to Gesture on onboarding progress indicators
- [x] progress indicator (구현 및 구현 정리)
- [x] appear Animation
- [x] seperated TextFieldView
- [x] drop menu
- [x] counter view (3 rectangle?)
- [x] datepicker
- [x] splash screen (app launch screen)
- [x] onboarding screen
- [x] Implement Kakao Login
- [x] Implement JWT system (AppState or ViewModel for RootView)

### Design
- [x] font system
- [x] color system

## MEMO
> code convention

### 모든 변수 이름은 읽을 수 있도록 작성
```swift
// Do not this
let desc = "Hello"

// Do this
let description = "Hello"
```

### View hierarchy 구성
Screen > Page > Content > Other Components like Cell (Listed Items)

`Screen` : 전체 화면 View

`Page` : Screen 내부 View (PageView, TabView 등)

`Content` : Page 내부 View

`Cell` : List 아이템

## CHECK
- Modal, dialog 등 내에서 상태관리를 직접하지말 것 (Server request)
