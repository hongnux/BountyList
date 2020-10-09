#  원피스 현상금 추적

1) 원피스 캐릭터들의 이미지와 이름, 현상금을 띄운다
2)  캐릭터 클릭시 Modal 을 활용한 새로운 화면으로 전환
3) Close 아이콘 클릭시 해당화면 종료
4) 현상금 순서별 정렬

* 리팩터링

1차 단순히 기능만 구현

2차 디자인 패턴을 적용 ( Model - View - ViewModel ) , 현상금 금액 순서대로 sorted

3차 collectionView 로 재구성

4차 Animation 구성

5차 View 의 속성을 이용한 Animation 이용

* 앱 구동 영상은 [ AppRun.mov ] 동영상 확인!
