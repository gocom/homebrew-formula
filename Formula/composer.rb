class Composer < Formula
  desc "Composer package and dependency manager"
  homepage "https://getcomposer.org/"
  url "https://getcomposer.org/download/1.5.1/composer.phar"
  version "1.5.1"
  sha256 "2745e7b8cced2e97f84b9e9cb0f9c401702f47cecea5a67f095ac4fa1a44fb80"

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
