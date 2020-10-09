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
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    // Animation 적용
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    // Animation 수행전 준비
    private func prepareAnimation() {
        nameLabelCenterX.constant = view.bounds.width
        bountyLabelCenterX.constant = view.bounds.width
    }
    
    // Animation 수행후
    private func showAnimation() {
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: { self.view.layoutIfNeeded() }, completion: nil)
        
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
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
