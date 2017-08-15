class SshKeychain < Formula
  desc "Add OpenSSH passphrases from the keychain to SSH agent"
  homepage "https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain"
  url "https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain/archive/62ff57064b63cd8a6d811d45556a1a92fe5a0e09.zip"
  version "62ff570"
  sha256 "72a17c2da6fda8b6426fc2d7b2738cd4072af264fc75873983b8963882129d60"
  head "https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain.git"

  bottle :unneeded

  plist_options :startup => true

  def install
    inreplace "ssh.add.a.plist", "ssh.add.a", "#{plist_name}"
    prefix.install "ssh.add.a.plist" => "#{plist_name}.plist"
  end
end
