class Ssdtprgen < Formula
  desc "SSDT generator for Power Management"
  homepage "https://github.com/Piker-Alpha/ssdtPRGen.sh"
  sha256 "611868ba808225baec2cde6b81328a486727d265de8a9d25be22213d169540e2"
  url "https://github.com/Piker-Alpha/ssdtPRGen.sh/archive/v17.0.zip"
  head "https://github.com/Piker-Alpha/ssdtPRGen.sh.git"

  devel do
    url "https://github.com/Piker-Alpha/ssdtPRGen.sh/archive/e634fe0553743c790841e3e8b65e92b78f240638.zip"
    sha256 "b256580d67c6231209284b0a9149b8198ddfc596b4dd7b6d945157ddfd5f43b0"
  end

  bottle :unneeded

  def install
    inreplace "ssdtPRGen.sh", "${gHome}/Library/ssdtPRGen", "#{libexec}"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"ssdtPRGen.sh" => "ssdtprgen"
  end

  test do
    system "#{bin}/ssdtprgen", "-h"
  end
end
