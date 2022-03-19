//
//  ShimmerView.swift
//  ShemmerKit
//
//  Created by Илья Разумов on 19.03.2022.
//

import UIKit

class ShimmerView: UIView {
	
	weak var relatedView: UIView?
	
	init(relatedView: UIView) {
		self.relatedView = relatedView
		super.init(frame: .zero)
		self.clipsToBounds = true
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.frame = relatedView?.frame ?? .zero
		self.layer.cornerRadius = bounds.height / 2
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
