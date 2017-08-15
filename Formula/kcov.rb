class Kcov < Formula
  desc "Code coverage tool for compiled programs, Python and Bash"
  homepage "https://simonkagstrom.github.io/kcov/"
  url "https://github.com/SimonKagstrom/kcov/archive/v33.tar.gz"
  sha256 "23e20157c8fb933b76d5733ca5700c9eb2399851febf0d4144d7b2dc940f4464"
  head "https://github.com/SimonKagstrom/kcov.git"

  depends_on :macos => :mountain_lion
  depends_on :python => :run
  depends_on "bash" => :run
  depends_on "cmake" => :build
  depends_on "curl" => :run
  depends_on "llvm" => [:run, "with-lldb", "with-python", "with-toolchain"]
  depends_on "pkgconfig" => :run
  depends_on "zlib" => :run

  # Does not compile with clang >= 4 due to 'char < int'.
  patch :DATA

  def install
    llvm = Formula["llvm"]
    ENV.append "LDFLAGS", "-L#{llvm.opt_lib} -Wl,-rpath,#{llvm.opt_lib}"
    ENV.prepend_path "PATH", "#{llvm.opt_bin}"

    mkdir "build" do
      system "cmake", "../", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/kcov", "-h"
  end

  def caveats
    <<-EOS.undent
      Due to lack of headers, and to get it to consistently compile on different
      host systems, we use the full LLVM stack instead of LLDB that is bundled
      with Xcode.
    EOS
  end
end

__END__
diff --git a/src/engines/lldb-engine.cc b/src/engines/lldb-engine.cc
index 8b6390e..c44b8cf 100644
--- a/src/engines/lldb-engine.cc
+++ b/src/engines/lldb-engine.cc
@@ -147,7 +147,7 @@ public:

 		m_listener = &listener;

-		if (getcwd(buf, sizeof(buf)) < 0) {
+		if (getcwd(buf, sizeof(buf)) == NULL) {
 			error("No current WD?\n");

 			return false;