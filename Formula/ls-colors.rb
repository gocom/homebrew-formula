class LsColors < Formula
  desc "A collection of LS_COLORS definitions for GNU dircolors"
  homepage "https://github.com/trapd00r/LS_COLORS"
  url "https://github.com/trapd00r/LS_COLORS/archive/4198d50ca94fbb9080b6b18ad8889b7c309eba5d.zip"
  version "4198d50"
  sha256 "67d822e524c2d2094e4acc4ea532d28f27bc345dd8e19eb6617a63987e2dd9aa"
  head "https://github.com/trapd00r/LS_COLORS.git"

  bottle :unneeded

  def install
    share.install "LS_COLORS" => "dircolors"
  end

  test do
    system "dircolors", "-b", "#{share}/dircolors"
  end

  def caveats
    <<-EOS.undent
      Add the following lines to your bash or zsh config (e.g. ~/.bash_profile):
        if [ -f "#{HOMEBREW_PREFIX}/share/dircolors" ] && [ "$(command -v dircolors)" ]; then
          eval "$(dircolors -b "#{HOMEBREW_PREFIX}/share/dircolors")"
        fi
    EOS
  end
end
