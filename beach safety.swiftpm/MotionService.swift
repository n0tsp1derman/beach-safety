//
//  MotionService.swift
//  beirutes_game
//
//  Created by Enzo Enrico on 10/11/25.
//

import CoreMotion
import Foundation

struct Rotation {
	var x: Double
	var y: Double
	var z: Double

	init() {
		self.x = 0.0
		self.y = 0.0
		self.z = 0.0
	}
}

@Observable
class MotionService: MotionProtocol {
	var motionManager = CMMotionManager()
	var rotation: Rotation
	var pitch: Double = 0.0
	var progress: Double = 0.5

	private let pitchSensitivity: Double = 2.0
	private let maxPitch: Double = 0.5  // Maximum pitch angle in radians (~28 degrees)

	init() {
		self.rotation = Rotation()
		if !self.motionManager.isDeviceMotionAvailable {
			print("Device Motion not available")
		}
	}

	func startListening() {
		motionManager.deviceMotionUpdateInterval = 0.05  // 20Hz update rate
		motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, _ in
			guard let self = self, let motion = motion else { return }

			// Get attitude (pitch is rotation around Y-axis)
			let attitude = motion.attitude
			self.pitch = attitude.pitch

			// Update rotation for backward compatibility
			self.rotation.x = attitude.roll
			self.rotation.y = attitude.pitch
			self.rotation.z = attitude.yaw

			// Calculate progress based on pitch
			// Tilting right (positive pitch) increases progress
			// Tilting left (negative pitch) decreases progress
			let normalizedPitch = max(-maxPitch, min(maxPitch, attitude.pitch))
			let pitchRatio = normalizedPitch / maxPitch  // -1.0 to 1.0

			// Map pitch to progress: center (0 pitch) = 0.5, right = 1.0, left = 0.0
			self.progress = 0.5 + (pitchRatio * 0.5)
			self.progress = max(0.0, min(1.0, self.progress))  // Clamp between 0 and 1
		}
	}

	func stopListening() {
		self.motionManager.stopDeviceMotionUpdates()
	}
}
