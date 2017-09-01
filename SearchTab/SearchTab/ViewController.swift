//
//  ViewController.swift
//  SearchTab
//
//  Created by Siavash on 1/9/17.
//  Copyright © 2017 Siavash. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    fileprivate lazy var searchTab: SearchHeaderView = {
        return SearchHeaderView()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(searchTab)
        searchTab.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.top.equalTo(50)
            make.height.equalTo(44)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class SearchHeaderView: UIView {
    
    fileprivate lazy var container: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 4
        v.isHidden = true
        return v
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.boldSystemFont(ofSize: 14)
        return l
    }()
    
    fileprivate lazy var searchTextField: UITextField = {
        let t = UITextField()
        t.borderStyle = .none
        t.textColor = .black
        t.font = UIFont.systemFont(ofSize: 12)
        t.delegate = self
        return t
    }()
    
    fileprivate lazy var smallLeftIcon: UIImageView = {
        let imgView = UIImageView.init(image: #imageLiteral(resourceName: "mag"))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    fileprivate lazy var rightButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "mag"), for: .normal)
        btn.tag = 1
        btn.addTarget(self, action: #selector(didTapRightBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
    
    fileprivate func config() {
        backgroundColor = .clear
        
        // add title 
        addSubview(titleLabel)
        titleLabel.text = "Transactions"
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(24)
            make.centerY.equalToSuperview()
        }
        
        // add container
        addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        container.addSubview(smallLeftIcon)
        smallLeftIcon.snp.makeConstraints { (make) in
            make.left.equalTo(4)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        container.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { (make) in
            make.left.equalTo(smallLeftIcon.snp.right).offset(4)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-50)
        }
        
        // add right btn
        addSubview(rightButton)
        rightButton.snp.makeConstraints { (make) in
            make.right.equalTo(-24)
            make.size.equalTo(CGSize(width: 25, height: 25))
            make.centerY.equalToSuperview()
        }
        
    }
    
    @objc
    fileprivate func didTapRightBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            rightButton.tag = 2
            // show textField container
            titleLabel.isHidden = true
            rightButton.setImage(#imageLiteral(resourceName: "close"), for: .normal)
            container.isHidden = false
        } else {
            rightButton.tag = 1
            // hide textField container
            container.isHidden = true
            rightButton.setImage(#imageLiteral(resourceName: "mag"), for: .normal)
            titleLabel.isHidden = false
        }
    }
    
}
extension SearchHeaderView: UITextFieldDelegate {
    
}
