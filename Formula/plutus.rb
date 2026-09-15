class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "7.0.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/versions/7.0.0/133f8ebde/plutus-v7.0.0-133f8ebde-darwin-arm64.tar.gz"
    sha256 "84c29d76599844e2c948a9ee9d8ca7ebb392d68c947208fb32b2ab95b5c22341"
  end

  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/versions/7.0.0/133f8ebde/plutus-v7.0.0-133f8ebde-linux-x64.tar.gz"
    sha256 "3710f7d088629b42a414e6a03e7ede16586ce72905da85c5125aa8c74e5850f8"
  end

  depends_on "coreutils"
  depends_on "awscli"
  depends_on "jq"
  depends_on "npm"

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
