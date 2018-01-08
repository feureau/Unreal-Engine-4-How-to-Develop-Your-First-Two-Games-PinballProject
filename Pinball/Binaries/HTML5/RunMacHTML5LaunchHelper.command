#!/bin/sh

# Find the Unreal Mono install if it exists, we'll use that if possible
# Otherwise we fallback to mono and hope it exists
if [ -f "C:\Program Files\Epic Games\UE_4.18\Engine\Build\BatchFiles\Mac\SetupMono.sh" ]; then
    pushd "C:\Program Files\Epic Games\UE_4.18\Engine\Build\BatchFiles\Mac"
	source SetupMono.sh
    popd
fi

# Give some warning if mono isn't valid.
command -v mono > /dev/null 2>&1 || { echo "Mono is required to run this script. If it's already installed please make sure it exists on the path"; exit 1; }

# Set the current directory to where the script is being run from
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
pushd "$DIR"
mono HTML5LaunchHelper.exe
popd
