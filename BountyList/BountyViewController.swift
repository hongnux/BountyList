//
//  BountyViewController.swift
//  BountyList
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MVVM 적용
    
    // Model : BountyInfo ( 데이터 )
    
    // View : ListCell 에 필요한 정보를 ViewModel 한테서 받기 ~> 해당 정보로 View 업데이트
    
    // ViewModel : BountyViewModel - View 레이어에서 필요한 메서드 만들기 , 모델 가지고 있기 ( BountyInfo 등등.. )
      
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 Data 제공
        // prepare 함수는 세그웨이 수행전, 준비하는 함수!
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UICollectionViewDataSource
    // 몇개의 데이터?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    // cell 의 구성은 어떻게?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else { return UICollectionViewCell() }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        return cell
    }
    
    // UICollectionViewDelegate : 셀 클릭시 어떤 이벤트 처리할것인가?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    // UICollectionViewDelegateFlowLayout : 디바이스별 동적인 cell size 계산
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height: CGFloat = width * 10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
}

class GridCell: UICollectionViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}

// ViewModel
class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList: [BountyInfo] {
        let sortedList =  bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        
        return sortedList
    }
    
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
