using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Lock.Detection.RNLockDetection
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNLockDetectionModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNLockDetectionModule"/>.
        /// </summary>
        internal RNLockDetectionModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNLockDetection";
            }
        }
    }
}
