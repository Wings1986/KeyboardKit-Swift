//
//  CustomView.swift
//  KeyboardKitDemoKeyboard
//
//  Created by iGold on 3/31/20.
//

import UIKit

public protocol CustomViewDelegate {
    func openSettings()
}

class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet var contentView: UIView!
    
//    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnClose: UIButton!
    
    
    var delegate: CustomViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        
//        btnSettings.layer.cornerRadius = 24
        btnClose.layer.cornerRadius = 14;
    }
    

    @IBAction func onClickOpenSetting(_ sender: Any) {
        
        delegate?.openSettings()
        
    }
    
    @IBAction func onClickClose(_ sender: Any) {
    
        self.removeFromSuperview()
    }
}
