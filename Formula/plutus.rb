class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.28.4/plutus-v0.28.4-darwin-x64.tar.gz"
    sha256 "9e23f7daf094f9bc1d04abe32cffe122e6cee7f3a11e2b66f903ff44abcdb3dc"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.28.5/plutus-v0.28.5-linux-x64.tar.gz"
    sha256 "7cef636821d1ae31fd59bfe20cac00636bcede6ee1836c20ab39efbfaeac3cd0"
  end

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
