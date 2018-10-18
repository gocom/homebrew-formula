class ComposerCompletion < Formula
  desc "Bash completion for Composer package and dependency manager"
  homepage "https://github.com/iArren/composer-bash-completion"
  url "https://github.com/iArren/composer-bash-completion/archive/86a81292a51a879b33c06a4b3dbaa02bc18c5a1e.zip"
  version "86a8129"
  sha256 "08b442ed71288973d40277bcef4fe5d2327bf65f772404b5481fc4d6ba47f4e5"
  head "https://github.com/iArren/composer-bash-completion.git"

  bottle :unneeded

  def install
    bash_completion.install "composer"
  end

  test do
    assert_match "-F _composer",
      shell_output("source #{bash_completion}/composer && complete -p composer")
  end

  def caveats
    <<~EOS
      Requires bash-completion >= 2.0.0 and Bash >= 4.1, and that 'composer'
      is in path. Legacy system bash and bash-completion can not be used.
    EOS
  end
end
