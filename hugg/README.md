#  난임 관리 파트너 Hugg iOS Application

# Todo (우선순위 정리)

## 1월 마무리

### Due to : 01/21

- [ ] 회원가입 페이지 : 주민등록번호 입력 페이지 리팩토링
- [ ] Spouse code 로직
- [ ] 남편 / 부인 분기 처리
- [ ] DTO 정리
- [ ] Colors -> Enum => Color extension 분리

- [ ] UIKit 스터디


- [ ] 테스트용 계정 세팅 (동준님 연락)

### Due to : 설 연휴 기간 내 마무리

- [ ] 로그인/회원가입 기능 적용 및 E2E 테스트

- [ ] 온보딩 -> 권한 설정 관련 기능 (추후 작업?)
- [ ] 홈화면 기능 적용
- [ ] 가계부 기능 적용


- [ ] 마이페이지 기능 구현

- [ ] 캘린더 State 설계 (VM)
- [ ] 캘린더 View

### Due to : 01/31

- [ ] 캘린더 연동




## 1월 가능 ?

- [ ] 데일리 허그 구현 (FCM 연동)

## 1.0 출시 이후
- [ ] 챌린지 기능 구현



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
