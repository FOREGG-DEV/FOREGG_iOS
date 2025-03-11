# MV pattern

## View

Screen vs View
Screen의 목적인 View는 반드시 Screen으로 명칭

### Reusable View ->
`Presenter` : 부모로부터 데이터를 상속받는 view (기본적인 view)

`Container` : 로직을 포함하는 View

#### Color 사용
- Constants.Colors 변수 활용


### .task {}
- View 보이기 전에 async 작업 처리 - (모델에 데이터 불러오기)

### viewStatus
- View 마다 불러올 데이터가 있다면 viewStatus라는 enum을 @State로 가진다.
- `failure`, `success`, `loading` 값을 가지며 이에 따라 알맞게 렌더링한다.


### Screen 만들기
- View 생성 (for screen)
- extension에 로직 넣어서 코드 정리
- Screen이 커지는 경우, ScreenState 만들어도 됨 (ViewModel의 역할)

- `huggApp` 내에 Route에 View 연결
- 기본 navigationBar 가리기
> Gesture navigation 고려


### Study
- [ ] Do catch, try await 공부
- [ ] AnyCodable ?
