class Composer < Formula
  desc "Composer package and dependency manager"
  homepage "https://getcomposer.org/"
  url "https://getcomposer.org/download/1.4.1/composer.phar"
  version "1.4.1"
  sha256 "abd277cc3453be980bb48cbffe9d1f7422ca1ef4bc0b7d035fda87cea4d55cbc"

  devel do
    url "https://getcomposer.org/composer.phar"
    sha256 ""
  end

  bottle :unneeded

  def install
    bin.install "composer.phar" => "composer"
  end

  test do
    system "#{bin}/composer", "--version"
  end
end
