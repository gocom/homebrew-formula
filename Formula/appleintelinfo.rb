class Appleintelinfo < Formula
  desc "Log Intel power management states"
  homepage "https://github.com/Piker-Alpha/AppleIntelInfo"
  url "https://github.com/Piker-Alpha/AppleIntelInfo/archive/c93102afe7406f1190b14723bddcf5b761da5d56.zip"
  version "c93102a"
  sha256 "e00bceedb66dc920693a29bbb3628cbc979eacb6797c89320d3d9396b80361ab"
  head "https://github.com/Piker-Alpha/AppleIntelInfo.git"

  depends_on :xcode => :build

  def install
    xcodebuild "-project", "AppleIntelInfo.xcodeproj",
               "-configuration", "Release",
               "SYMROOT=build",
               "SDKROOT="

    prefix.install "build/Release/AppleIntelInfo.kext"
  end

  def caveats
    <<~EOS
      Load the kernel extension with:
        sudo kextload "#{prefix}/AppleIntelInfo.kext"

      Unload the kernel extension with:
        sudo kextunload "#{prefix}/AppleIntelInfo.kext"

      View output with:
        sudo cat /tmp/AppleIntelInfo.dat
    EOS
  end
end
