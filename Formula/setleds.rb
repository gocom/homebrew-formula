class Setleds < Formula
  desc "Set your keyboard LEDs from the command-line"
  homepage "https://github.com/damieng/setledsmac"
  url "https://github.com/damieng/setledsmac/archive/0.1.tar.gz"
  sha256 "7c5cb37a9315bc59c55ee40f9945ed19246e04bcfd40d43965e597a2ba587aab"
  head "https://github.com/damieng/setledsmac.git"

  depends_on :xcode => :build

  plist_options :startup => true

  def install
    xcodebuild "-project", "./Source/SetLEDs.xcodeproj",
               "-configuration", "Release",
               "SYMROOT=build",
               "SDKROOT="

    bin.install "Source/build/Release/setleds"
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
    	<key>Label</key>
    	<string>#{plist_name}</string>
    	<key>ProgramArguments</key>
    	<array>
    		<string>#{bin}/setleds</string>
    		<string>-num</string>
    	</array>
    	<key>RunAtLoad</key>
    	<true/>
    </dict>
    </plist>
    EOS
  end

  test do
    assert_match(/version/, shell_output("#{bin}/setleds", 1))
  end
end
