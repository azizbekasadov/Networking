//
//  NetworkService.m
//  Networking
//
//  Created by Azizbek Asadov on 11.11.2025.
//

@import AppKit;

#import <AvailabilityMacros.h>
#import "NetworkService.h"

@interface NetworkService()

@end

@implementation NetworkService

- (void) loadImageFromURL: (NSURL *) url withCompletionHandler: (void (^)(NSImage *)) completion {
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // deprecated
    
#if MAC_OS_X_VERSION_MAX_ALLOWED > MAC_OS_X_VERSION_10_1
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSImage *image = [[NSImage alloc] initWithData: data];
        completion(image);
    }] resume];
#else
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSImage *image = [[NSImage alloc] initWithData: data];
        completion(image);
    }];
#endif
}

@end
