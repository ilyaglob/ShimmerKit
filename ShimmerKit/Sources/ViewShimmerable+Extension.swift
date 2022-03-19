//
//  ViewShimmerable+Extension.swift
//  ShimmerKit
//
//  Created by Илья Разумов on 19.03.2022.
//

import UIKit

extension ViewShimmerable {
	
	var color: UIColor {
		return UIColor(red: 0.949, green: 0.949, blue: 0.965, alpha: 1)
	}
	
	func updateShimmer(isEnabled: Bool) {
		if isEnabled {
			guard !superView.subviews.contains(where: { $0 is ShimmerContainerView }) else {
				return
			}
			prepareForShimmer()
			
			let shimmer = ShimmerContainerView(frame: superView.bounds)
			shimerableViews.forEach {
				let view = ShimmerView(relatedView: $0)
				view.frame = $0.frame
				view.clipsToBounds = true
				view.backgroundColor = color
				shimmer.addSubview(view)
			}
			superView.addSubview(shimmer)
		} else {
			superView.subviews.forEach {
				if $0 is ShimmerContainerView {
					$0.removeFromSuperview()
				}
			}
		}
	}
}
