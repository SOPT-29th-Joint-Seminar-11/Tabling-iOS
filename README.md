# 🍽 Tabling-iOS

🔥 WE SOPT 29th 합동 세미나 11조 iOS 팀 프로젝트 레포지터리입니다.

🔥 [Notion Page](https://huree-can-do-it.notion.site/Tabling-iOS-f3873c78a8ce42dcb3ccbe6284f8aae6)

<br>

## 🌼 Team Potato [🥔🥔🥔](https://www.notion.so/huree-can-do-it/f039766d16d4490d8515ca5c84987aba?v=856803fc5c43446cad6208c9795761dc)

| [@heerucan](https://github.com/heerucan) | [@ningpop](https://github.com/ningpop) | [@yujinnee](https://github.com/yujinnee) |
| :---: | :---: | :---: |
|![스크린샷 2021-11-15 오후 2 04 50](https://user-images.githubusercontent.com/63235947/141725493-089fe8ba-f2f2-4c73-83a0-b730415d592b.png) | ![스크린샷 2021-11-15 오후 2 03 47](https://user-images.githubusercontent.com/63235947/141725415-23a22c1a-5779-4d62-b856-13921b86df08.png) |![스크린샷 2021-11-15 오후 2 04 28](https://user-images.githubusercontent.com/63235947/141725464-b4625704-4c99-483c-b738-e423a3adca81.png)|
|`DetailView`|`MainView`|`MainView`|

 `MainView`의 경우 공동 구현이 아닌 각자 구현하는 방식으로 진행합니다.

    

<br>



## 🌼🌼 Code Convention

<aside>

🔥 진짜 꼭 지킵시다!

🔥 [스타일쉐어](https://github.com/StyleShare/swift-style-guide)의 스위스트 스타일 가이드를 참고합니다.
       
</aside>

<details>

<summary> 💬 💬 💬 </summary>
<div markdown="1">


### 1. 코드 레이아웃


#### 1-1. 공백

- 콜론(`:`)을 쓸 때에는 콜론의 오른쪽에만 공백을 둡니다.
    
    ```swift
    let names: [String: String]?
    ```
    

- 빈 줄은 딱 한 줄 정도만.. 너무 많은 빈 줄은 지양합니다.

#### 1-2. MARK 구문

- `MARK` 구문 위와 아래에는 공백이 필요합니다.
    
    ```swift
    // MARK: Layout
    
    override func layoutSubviews() {
      // doSomething()
    }
    
    // MARK: Actions
    
    override func menuButtonDidTap() {
      // doSomething()
    }
    ```
    

- `MARK` 구문의 순서는 아래와 같습니다.
    
    ```swift
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Override Method UI + Layout
    
    override func configUI() {
        
    }
    
    override func setupAutoLayout() {
        
    }
    
    // MARK: - Custom Method
    
    // MARK: - @objc
    
    ```
    

- `Cell` 파일은 `// MARK: - Lifecycle` 대신 아래와 같습니다.
    
    ```swift
    // MARK: - Initializing
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(style: .default, reuseIdentifier: nil)
    }
    ```
    
- `Delegate`나 `Datasource`를 `extension`으로 빼줄 경우 위에 마크구문을 꼭 써줘야 합니다.
    
    ```swift
    // MARK: - UICollectionViewDelegate
    
    extension MainVC: UICollectionViewDelegate {
    
    ...
    
    }
    ```
    

#### 1-3. 임포트

- 모듈 임포트는 `알파벳 순`으로 정렬합니다.
- 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.
    
    ```swift
    import UIKit
    
    import SwiftyColor
    import SwiftyImage
    import Then
    import URLNavigator
    ```
    

<br>

### 2. 네이밍


#### 2-1. 액션 함수 네이밍

- `Action` 함수의 네이밍은 '주어 + 동사 + 목적어' 형태를 사용합니다.
    - **Tap(눌렀다 뗌)** 은  `.touchUpInside`에 대응하고,
    - **Press(누름)** 는  `.touchDown`에 대응합니다.
    - **will~** 은 특정 행위가 일어나기 직전이고, **did~** 는 특정 행위가 일어난 직후입니다.
    - **should~** 는 일반적으로 `Bool`을 반환하는 함수에 사용됩니다.
    
    
    ```
    func backButtonDidTap() {
      // ...
    }
    
    touchUpBackButton
    
    ```
    
<br>

### 3. 권장사항


#### 3-1. 변수 초기화

- 가능하다면 변수를 정의할 때 함께 초기화하도록 합니다.
- [Then](https://github.com/devxoul/Then) 라이브러리를 사용하면 초기화와 함께 속성을 지정할 수 있습니다.
    
    ```swift
    let label = UILabel().then {
      $0.textAlignment = .center
      $0.textColor = .black
      $0.text = "Hello, World!"
    }
    ```
    
    ```swift
    var job: String = "iOS Programmer"
    ```
    

#### 3-2. enum

- 상수를 정의할 때에는 `enum`를 만들어 비슷한 상수끼리 모아둡니다.
    
    재사용성과 유지보수 측면에서 큰 향상을 가져옵니다. 
    
    `struct` 대신 `enum`을 사용하는 이유는, 생성자가 제공되지 않는 자료형을 사용하기 위해서입니다.
    
- [CGFloatLiteral](https://github.com/devxoul/CGFloatLiteral)과 [SwiftyColor](https://github.com/devxoul/SwiftyColor)를 사용해서 코드를 단순화시킵니다.
    
    ```swift
    final class ProfileViewController: UIViewController {
    
      private enum Metric {
        static let profileImageViewLeft = 10.f
        static let profileImageViewRight = 10.f
        static let nameLabelTopBottom = 8.f
        static let bioLabelTop = 6.f
      }
    
      private enum Font {
        static let nameLabel = UIFont.boldSystemFont(ofSize: 14)
        static let bioLabel = UIFont.boldSystemFont(ofSize: 12)
      }
    
      private enum Color {
        static let nameLabelText = 0x000000.color
        static let bioLabelText = 0x333333.color ~ 70%
      }
    
    }
    ```
    

#### 3-3. final

- 더이상 상속이 발생하지 않는 클래스는 항상 `final` 키워드로 선언합니다.
    
    ```swift
    
    final class MyViewController: UIViewController {
      // ...
    }
    
    ```
 
<br>

### 4. ViewController


- `ViewController`, `TableViewCell`, `CollectionViewCell`
    - `VC`, `TVC`, `CVC`로 축약해서 사용합니다.


</div>
</details>

<br>
<br>

## 🌼🌼🌼 Git Convention

🔥 [참고자료](https://github.com/TeamMyDaily/4most-Android/wiki/1.-Git-사용법)

🔥 [감자들의 깃 컨벤션이 자세하게 보고 싶다면?](https://huree-can-do-it.notion.site/code-convention-5d1c99ce79754b2eb9d82a75f14ff507)

<details>

<summary> 💬 💬 💬 </summary>
<div markdown="1">

### Git Flow

```
1. Issue를 생성한다.
2. feature Branch를 생성한다.
3. Add - Commit - Push - Pull Request 의 과정을 거친다.
4. Pull Request가 작성되면 작성자 이외의 다른 팀원이 Code Review를 한다.
5. Code Review가 완료되면 Pull Request 작성자가 develop Branch로 merge 한다.
6. 종료된 Issue와 Pull Request의 Label과 Project를 관리한다.
```

### Commit Message Convention


    - FEAT : 새로운 기능 구현
    - ADD : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 View나 Activity 생성
    - CHORE : 그 이외의 잡일/ 버전 코드 수정, 패키지 구조 변경, 파일 이동, 가독성이나 변수명, reformat 등
    - FIX : 버그, 오류 해결
    - DEL : 쓸모없는 코드 및 파일 삭제
    - MOD : xml (스토리보드) 파일만 수정한 경우
    - DOCS : README나 WIKI 등의 문서 개정
    - REFACTOR : 내부 로직은 변경 하지 않고 기존의 코드를 개선하는 리팩토링 시


<details>
<summary>`Prefix` 가 헷갈릴 때 참고해주세요!</summary>
<div markdown="2">

```swift
[ADD] 홈 테이블뷰 높이 관련 코드 추가(#1)
[FEAT] 홈 기능 구현**(#2)
[CHORE] 홈 셀 레이아웃 코드 수정(#2)
[MOVE] 홈 폴더 파일 이동(#2)
[FIX] 홈 셀 리로드 버그 해결(#3)
[DEL] 필요없는 주석 삭제(#2)
```
</div>
</details>


### Branch Naming

`<prefix 소문자로>/<이슈번호>-<관련설명>`

*→ 대소문자 꼭 지켜주세요!*

```swift
feature/2-HomeLayout
feature/10-HomeService
```

### Issue

- Template 사용
- 라벨 달기
- 프로젝트 칸반보드 체크 필수

### Pull Request

- Template 사용 (내용 꼼꼼하게 작성)
- Code Review 24시간 내로

### Merge

- Approved 걸고 코리 받으면 자기자신이 Click

</aside>




</div>
</details>


<br>
<br>

## 🌼🌼🌼🌼 Foldering

<details>

<summary> 💬 💬 💬 </summary>
<div markdown="1">

<br>

```
   🗂 Tabling-iOS
           │
           │
           |── 📂 Global
           │        │
           │        |── 📁 Base
           │        |── 📁 Constant
           │        |── 📁 Extension
           │        └── 📁 Protocol
           │
           │── 📂 Source
           │        |── 📁 Model
           │        |── 📁 Network
           │        └── 📁 Screen
           │                  │
           │                  |── TabbarController
           │                  |── 📁 Yujin
           │                  |        |── 📁 VC   
           │                  |        |── 📁 Cell
           │                  |        └── 📁 Component
           │                  |── 📁 Namjoon
           │                  |        |── 📁 VC
           │                  |        |── 📁 Cell
           │                  |        └── 📁 Component 
           │                  |── 📁 Ruhee
           │                  |        |── 📁 VC 
           │                  |        |── 📁 Cell 
           │                  |        └── 📁 Component
           │                  |
           │                  └── 📁 MyPage
           │
           └── 📂 Resource
                     |
                     |── 📁 Support
                     |        |── AppDelegate.swift     
                     |        └── SceneDelegate.swift
                     |
                     |── 📁 Storyboard
                     |        |── LaunchScreen.storyboard    
                     |        |── Main.storyboard    
                     |        |── NamjoonMain.storyboard    
                     |        └── YujinMain.storyboard
                     |
                     |── Assets.xcassets
                     └── Info.plist
        
```

</div>
</details>


