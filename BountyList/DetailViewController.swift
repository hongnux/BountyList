//
//  DetailViewController.swift
//  BountyList
//

import UIKit

class DetailViewController: UIViewController {

    // MVVM 적용
    
    // Model : BountyInfo
    
    // View : imageView, nameLabel, bountyLabel 에 필요한 정보를 ViewModel 한테서 받기 ~> 해당 정보로 View 업데이트
    
    // ViewModel : DetailViewModel - View 레이어에서 필요한 메서드 만들기 , 모델 가지고 있기 ( BountyInfo 등등.. )
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
   
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// ViewModel
class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
