import Foundation

// UI is draw as a constant struct when declared
// View on Appear is triggered this only happens once
// A @State variable changes
// This creates a change in the source of truth
// SwiftUI redraws the new UI in memory
// The change is applied between the versions if the parent or any subview has changes it is refreshed if they don't have changes they are NOT refreshed
// Goes back to initial state
