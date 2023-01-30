//
//  UserInfoView.swift
//  practice1
//
//  Created by APPLE on 2022/12/05.
//  Copyright © 2022 sejin. All rights reserved.
//

import Foundation
import UIKit


class UserInfoView : UIView{
    
    public lazy var userInfoStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [userNameTextField, userTierDropDownButton,userPositionDropDownButton])
        view.insertViewIntoStack(background: .black, cornerRadius: 5, borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), borderWidth: 2)
        view.alignment = .center
        view.distribution = .equalSpacing
        view.axis = .vertical
        view.spacing = 15
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins.top = 15
        view.layoutMargins.bottom = 15
        return view
    }()
    
    public lazy var userNameTextField = UITextField().then{
        $0.layer.cornerRadius = 8
        $0.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        //userdefault 사용
        $0.font = .systemFont(ofSize: 18)
        $0.attributedPlaceholder = NSAttributedString(string: userName, attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        $0.textColor = .white
        $0.tintColor = .white
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        //$0.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
    }
    
    
    private var userTierDropDownButton = UIButton().then{
        $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.layer.cornerRadius = 8
        $0.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.contentHorizontalAlignment = .left
        //$0.addTarget(self, action: #selector(tierDropDownButtonTapped), for: .touchUpInside)
    }
    
    private var userPositionDropDownButton = UIButton().then{
        $0.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        $0.layer.cornerRadius = 8
        $0.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.contentHorizontalAlignment = .left
        //$0.addTarget(self, action: #selector(positionDropDownButtonTapped), for: .touchUpInside)
    }
    
    private let enterButton = UIButton().then{
        $0.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        $0.layer.cornerRadius = 5
        $0.layer.borderWidth = 1
        $0.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitleColor(#colorLiteral(red: 0.7167869606, green: 0.7167869606, blue: 0.7167869606, alpha: 1), for: .normal)
        $0.isEnabled = false
        //$0.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    
}
