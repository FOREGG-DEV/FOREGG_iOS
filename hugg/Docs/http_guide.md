
# HTTP 통신 정리 (Restful API)

- 모든 API 콜은 kakao token을 필요로한다. (카카오톡 로그인 call 제외)
- API 콜을 위해 HTTP Client를 생성하여 활용한다.
- [ ] singleton으로 구현해야하는가?

# HTTP call 순서

1. 모든 요청은 `resource`를 정의하고 활용한다.
```swift
    struct Resource<T: Codable> {
        // 요청할 URL
        let url: URL
        // 요청 시 사용할 Method 정의
        var method: HTTPMethod = .get([])
        // 리턴 받을 타입 정의
        var modelType: T.Type
    }
    
    // 사용 예시
   let resource = Resource(
    url: Constants.Urls.spouseCode,
    method: HTTPMethod.get([]),
    modelType: ApiResponse<UserSpouseCodeResponseDTO>.self)
 
```

2. 모든 요청은 해당 데이터를 가지는 Model 레이어에서 실행한다.
