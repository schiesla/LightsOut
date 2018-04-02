//
//  LightsOutObjC.h
//  LightsOut
//
//  Created by CSSE Department on 4/2/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_NUM_LIGHTS 100

typedef NS_ENUM(NSInteger, GameState) {
    GameStateWon,
    GameStateNotWon
};

@interface LightsOutObjC : NSObject {
    BOOL lightStates[MAX_NUM_LIGHTS];
}

@property (nonatomic) NSInteger movesTaken;
@property (nonatomic) GameState gameState;
@property (nonatomic) NSInteger numLights;

- (id) initWithNumLights:(NSInteger) numLights;
- (BOOL) pressedLightAtIndex:(NSInteger) lightIndex;
- (void) switchLight:(NSInteger) lightIndex;
- (NSString*) lightStateString:(NSInteger) lightIndex;
- (BOOL) checkForWin;
@end
