class DircolorsSolarized < Formula
  desc "Solarized color scheme for GNU dircolors"
  homepage "https://github.com/seebi/dircolors-solarized"
  url "https://github.com/seebi/dircolors-solarized/archive/71dbfd5ea3e39b41977df36a61bedc5f9374d47e.zip"
  version "71dbfd5"
  sha256 "3804bd33b0e2d3fa51994058c736c6e797c8b4185192bb609b7fafc8ee8ec4a0"
  head "https://github.com/seebi/dircolors-solarized.git"

  bottle :unneeded

  def install
    prefix.install Dir["dircolors.*"]
    share.install_symlink prefix/"dircolors.256dark" => "dircolors"
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
