class Iasl < Formula
  desc "Intel ACPI compiler and decompiler"
  homepage "https://github.com/RehabMan/Intel-iasl"
  head "https://github.com/RehabMan/Intel-iasl.git"

  devel do
    url "https://github.com/RehabMan/Intel-iasl/archive/d8e092766f31f5b576a8d377c54a3179194b27f1.zip"
    sha256 "c84a97b652810b2f2d300170b7624e3441785c51246b13e62e363fce30408c05"
  end

  depends_on :xcode => :build

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end
end
