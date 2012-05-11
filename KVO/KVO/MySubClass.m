#import "MySubClass.h"

// observation context
static int kSubClassChangingValueContext;
static NSString *kChangingValueObservationKey = @"changingValue";

@implementation MySubClass
@synthesize subClassObservee = _subClassObservee;

- (id)initWithObservee:(Observee *)observee
{
    self = [super initWithObservee:observee];
    
    if (self != nil)
    {
        self.subClassObservee = observee;
    }
    
    return self;
}



- (void)dealloc
{
    // set observee to nil explicitly, so our setter is triggered and
    // our observation removed
    self.subClassObservee = nil;
}



// setup our observation in the setter, so it's removed properly from old observees
- (void)setSubClassObservee:(Observee *)observee
{
    // remove observation from old observee
    if (_subClassObservee) {
        [_subClassObservee removeObserver:self forKeyPath:kChangingValueObservationKey context:&kSubClassChangingValueContext];
    }
    
    _subClassObservee = observee;
    
    // setup observation for new observee
    if (_subClassObservee) {
        [_subClassObservee addObserver:self forKeyPath:kChangingValueObservationKey options:0 context:&kSubClassChangingValueContext];
    }
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == &kSubClassChangingValueContext) {
        NSLog(@"sub class: value has changed");
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end

