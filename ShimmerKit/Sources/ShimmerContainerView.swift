//
//  ShimmerContainerView.swift
//  ShemmerKit
//
//  Created by Илья Разумов on 19.03.2022.
//

import UIKit

final class ShimmerContainerView: UIView {
	
	var shimmerColor: UIColor = .white {
		didSet {
			updateShimmerColor()
		}
	}
	
	var animationDuration: CFTimeInterval = 1.5
	
	private var shimmerLayers = [CALayer]()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		createLayers()
	}
	
	private func createLayers() {
		guard shimmerLayers.isEmpty else {
			return
		}
		
		shimmerLayers.forEach {
			$0.removeAllAnimations()
			$0.removeFromSuperlayer()
		}
		shimmerLayers.removeAll()
		
		subviews.forEach {
			$0.clipsToBounds = true
			let gradientLayer = CAGradientLayer()
			gradientLayer.colors = [
				UIColor.white.withAlphaComponent(0).cgColor,
				shimmerColor.cgColor,
				UIColor.white.withAlphaComponent(0).cgColor
			]
			gradientLayer.locations = [0, 0.2, 1]
			gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
			
			let angle: CGFloat = 45 * .pi / 100
			gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
			
			let animation = CABasicAnimation(keyPath: "transform.translation.x")
			animation.duration = animationDuration
			animation.fromValue = -frame.width
			animation.toValue = frame.width
			animation.repeatCount = .infinity
			
			gradientLayer.add(animation, forKey: "gradientMove")
			
			$0.layer.addSublayer(gradientLayer)
			
			shimmerLayers.append(gradientLayer)
		}
	}
	
	private func updateShimmerColor() {
		shimmerLayers.forEach {
			if let gradient = $0 as? CAGradientLayer {
				gradient.colors = [
					UIColor.white.withAlphaComponent(0).cgColor,
					shimmerColor.cgColor,
					UIColor.white.withAlphaComponent(0).cgColor
				]
			}
		}
	}
}
