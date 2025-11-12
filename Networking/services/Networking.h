//
//  Networking.h
//  Networking
//
//  Created by Azizbek Asadov on 11.11.2025.
//

@import Foundation;

@protocol Networking <NSObject>

- (void) loadImageFromURL: (NSURL *) url withCompletionHandler: (void (^)(NSImage *)) completion;

@end


