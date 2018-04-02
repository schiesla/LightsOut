//
//  LightsOutObjC.m
//  LightsOut
//
//  Created by CSSE Department on 4/2/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

#import "LightsOutObjC.h"

@implementation LightsOutObjC

- (id) initWithNumLights:(NSInteger) numLights {
    self = [super init];
    if (self) {
        self.gameState = GameStateNotWon;
        self.numLights = numLights;
        self.movesTaken = 0;
        for (int i = 0; i < numLights; ++i) {
            int randomNumber = arc4random_uniform(2);
            if (randomNumber == 1) {
                lightStates[i] = true;
            } else {
                lightStates[i] = false;
            }
        }
    }
    return self;
}

- (BOOL) pressedLightAtIndex:(NSInteger) lightIndex {
    if (self.gameState == GameStateWon) {
        return true;
    }
    self.movesTaken++;
    [self switchLight:lightIndex];
    if (lightIndex == 0) {
        [self switchLight:lightIndex+1];
    } else if (lightIndex == self.numLights - 1) {
        [self switchLight:lightIndex-1];
    } else {
        [self switchLight:lightIndex+1];
        [self switchLight:lightIndex-1];
    }
    return [self checkForWin];
}

- (void) switchLight:(NSInteger) lightIndex {
    if (lightStates[lightIndex] == false) {
        lightStates[lightIndex] = true;
    } else {
        lightStates[lightIndex] = false;
    }
}

- (NSString*) lightStateString:(NSInteger) lightIndex{
    if (lightStates[lightIndex] == true) {
        return @"T";
    } else {
        return @"F";
    }
}

- (BOOL) checkForWin {
    for (int j = 0; j < self.numLights; ++j) {
        if (lightStates[j] == true) {
            self.gameState = GameStateNotWon;
            return false;
        }
    }
    self.gameState = GameStateWon;
    return true;
}

@end
